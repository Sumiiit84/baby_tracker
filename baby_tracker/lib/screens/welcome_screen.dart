import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 26),
            Image.asset('assets/images/baby.png'),
            SizedBox(height: 26),
            Text(
              'BABY AND MOOD TRACKER',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 26,
                color: Colors.pink[900],
              ),
            ),
            SizedBox(height: 26),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/setup');
              },
              child: Text('Get Start'),
            ),
          ],
        ),
      ),
    );
  }
}
