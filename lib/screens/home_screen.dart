import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(child: Text("Take picture"),onPressed: () => Navigator.pushNamed(context, "/take_picture"))
          ],
        ),
      ),
    );
  }
}
