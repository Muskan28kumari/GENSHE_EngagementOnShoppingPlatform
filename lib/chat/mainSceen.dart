import 'package:flutter/material.dart';
import 'package:personality_quiz/chat/commonRoom.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showDialog(context);
          },
          child: Text('Press Me'),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  List<TextEditingController> emailControllers = [TextEditingController()];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Enter Email IDs'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...emailControllers.map((controller) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email ID',
                      ),
                    ),
                  );
                }).toList(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      emailControllers.add(TextEditingController());
                    });
                  },
                  child: Text('Add Another Email'),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  List<String> emails = emailControllers
                      .map((controller) => controller.text)
                      .toList();
                  // Do something with the emails, e.g., print them or validate them
                  print('Emails: $emails');
                  _createCommonRoom(context, emails);
                },
              ),
              ElevatedButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}

void _createCommonRoom(BuildContext context, List<String> emails) {
  // Here you would have logic to create a common room with the given emails
  // For example, calling a backend service to create/join the room

  // Simulate room creation
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CommonRoomScreen(emails: emails),
    ),
  );
}
