import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/custom_gridview.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void _startSearch(BuildContext context) {
    // Implement your search logic here.
    print('Search started');
    // You can navigate to a search result page or filter the displayed items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 201, 201),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(
            child: Text(
          "Characters",
          style: TextStyle(fontSize: 28),
        )),
        actions: [
          IconButton(
            onPressed: () => _startSearch(context), // Start search directly
            icon: const Icon(Icons.search, size: 30),
          )
        ],
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
