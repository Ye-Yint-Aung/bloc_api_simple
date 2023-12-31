import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/home/home_bloc.dart';
import 'package:flutter_bloc_api/cubits/detail/post_detail_cubit.dart';
import 'package:flutter_bloc_api/view/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //create: (context) => HomeBloc(),
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => PostDetailCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Api',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
