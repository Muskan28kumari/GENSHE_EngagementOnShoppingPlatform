import 'package:flutter/material.dart';
import 'package:personality_quiz/quiz/option1/screen.dart';
import 'package:personality_quiz/quiz/option2/screen.dart';

class FashionPersonalityQuiz extends StatefulWidget {
  const FashionPersonalityQuiz({super.key});

  @override
  State<FashionPersonalityQuiz> createState() => _FashionPersonalityQuizState();
}

class _FashionPersonalityQuizState extends State<FashionPersonalityQuiz> {
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
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Option1Screen())),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink, width: 6)),
                    width: 200, // Ensure the container has a width
                    height: 200, // Ensure the container has a height
                    child: Image.asset("assets/fashion.jpg"),
                  ),
                ),

                InkWell(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Option2Screen())),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink, width: 6)),
                    width: 200, // Ensure the container has a width
                    height: 200, // Ensure the container has a height
                    child: Image.asset("assets/fashion2.jpg"),
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
