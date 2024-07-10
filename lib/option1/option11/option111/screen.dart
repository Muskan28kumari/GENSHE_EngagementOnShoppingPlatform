import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Option111Screen extends StatefulWidget {
  const Option111Screen({super.key});

  @override
  _Option111ScreenState createState() => _Option111ScreenState();
}

class _Option111ScreenState extends State<Option111Screen> {
  Color _backgroundColor = Color.fromARGB(255, 210, 233, 84);

  @override
  void initState() {
    super.initState();
    _animateBackgroundColor();
  }

  void _animateBackgroundColor() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _backgroundColor = Color.fromARGB(255, 114, 214, 216);
      });
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _backgroundColor = Color.fromARGB(255, 75, 233, 233);
      });
    });

    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        _backgroundColor = Color.fromARGB(255, 77, 195, 89);
      });
    });

    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        _backgroundColor = Color.fromARGB(255, 213, 230, 86);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        color: _backgroundColor,
        child: Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.pink, width: 25)),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Your fashion personality',
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink, width: 10)),
                child: const Center(
                  child: Text(
                    'Dramatic',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
