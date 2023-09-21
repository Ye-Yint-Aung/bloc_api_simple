import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/view/detail_screen.dart';

import '../bloc/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBlock = BlocProvider.of<HomeBloc>(context, listen: false);
    homeBlock.add(GetHomeEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "BLOC API",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeErrorState) {
            return const Text("Error");
          } else if (state is HomeSuccessState) {
            return ListView.builder(
                itemCount: state.post.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: () {
                        print("Clecked ${state.post[index].id}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      postId: state.post[index].id.toString(),
                                    )));
                      },
                      child: Card(
                        color: Colors.white70,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Title",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              Text(state.post[index].title.toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
