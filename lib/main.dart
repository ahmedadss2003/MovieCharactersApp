import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_routers.dart';
import 'package:movie_app/business_logic/character/character_cubit.dart';

void main() {
  runApp(BreakingBadApp(
    routeGenerator: RouteGenerator(),
  ));
}

class BreakingBadApp extends StatelessWidget {
  const BreakingBadApp({super.key, required this.routeGenerator});
  final RouteGenerator routeGenerator;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterCubit(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "MochiyPopPOne",
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routeGenerator.generateRoute,
      ),
    );
  }
}
