import 'package:flutter/material.dart';
import 'package:personality_quiz/quiz/option1/option12/option121/screen.dart';
import 'package:personality_quiz/quiz/option1/option12/option122/screen.dart';

class Option12Screen extends StatelessWidget {
  const Option12Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("    Personality Quiz",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have choose the image out of two images:',
              style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Option121Screen())),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink, width: 6)),
                    width: 200, // Ensure the container has a width
                    height: 200, // Ensure the container has a height
                    child: Image.asset("assets/fashion7.jpg"),
                  ),
                ),

                InkWell(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Option122Screen())),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink, width: 6)),
                    width: 200, // Ensure the container has a width
                    height: 200, // Ensure the container has a height
                    child: Image.asset("assets/fashion8.jpg"),
                  ),
                ),

                //Icon(Icons.person),
              ],
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
