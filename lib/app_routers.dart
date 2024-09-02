import 'package:flutter/material.dart';
import 'package:movie_app/presentation/views/home_view.dart';

class RouteGenerator{
    Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>const HomeView());
    }
    return null;
  }
}