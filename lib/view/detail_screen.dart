import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/cubits/detail/post_detail_cubit.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.postId});

  String postId;

  @override
  Widget build(BuildContext context) {
    final detailCubit =
        BlocProvider.of<PostDetailCubit>(context, listen: false);
    detailCubit.getPostById(postId);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          title: const Text(
            "Detail",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: BlocBuilder<PostDetailCubit, PostDetailState>(
          builder: (context, state) {
            if (state is PostDetailInitialState) {
              print("Init");
              return const Text("Init State");
            } else if (state is PostDetailLoadingState) {
              print("Loading");
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostDetailErrorState) {
              print("Error");
              return const Text("Error State");
            } else if (state is PostDetailSuccessState) {
              print("Success");
              return Container(
                //height: 200,
                //color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            const Text(
                              "Id",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 70,
                            ),
                            Text(
                              state.postById.id.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            const Text(
                              "User Id",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              state.postById.userId.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            const Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: Text(
                                state.postById.title.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            const Text(
                              "Body",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              child: Text(
                                state.postById.body.toString(),
                                style: const TextStyle(
                                    //overflow: TextOverflow.ellipsis,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Text("Else");
            }
          },
        ));
  }
}
