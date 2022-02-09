import 'main.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.amber),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          backgroundColor: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.amber),
              child: Padding(
                padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('box 1'),
                    Text('box 2'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
