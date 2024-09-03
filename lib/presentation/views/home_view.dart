import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/custom_gridview.dart';
import 'package:movie_app/presentation/widgets/custom_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 201, 201),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const CustomSearchBar(), // Custom search bar
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomGridView(),
          ],
        ),
      ),
    );
  }
}

