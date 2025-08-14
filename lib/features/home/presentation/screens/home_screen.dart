import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),

      ),
      body: Column(


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for the button
        },
        child: const Icon(Icons.add),
      ),



    );
  }
}
