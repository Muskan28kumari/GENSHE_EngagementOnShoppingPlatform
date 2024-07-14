import 'package:flutter/material.dart';
import 'package:personality_quiz/chat/commonRoom.dart';
import 'package:personality_quiz/quiz/quiz.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Myntra'),
        backgroundColor: Colors.pink,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    getImagePath(index),
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    getTitle(index),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    getSubtitle(index),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Action when "Shop Now" button is pressed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Shop Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: const Color.fromRGBO(233, 30, 99, 1),
        notchMargin: 8.0,
        child: Container(
          height: 20.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  _showDialog(context);
                },
                child: Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                        child: Text(
                      'Shop Together',
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.bold),
                    ))),
              ),
              SizedBox(
                width: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FashionPersonalityQuiz()));
                },
                child: Container(
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                        child: Text(
                      'Fshion Personality',
                      style: TextStyle(
                          color: Colors.pink, fontWeight: FontWeight.bold),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/Images/shopping.webp';
      case 1:
        return 'assets/Images/shopping1.webp';
      case 2:
        return 'assets/Images/shopping2.webp';
      case 3:
        return 'assets/Images/shopping3.webp';
      case 4:
        return 'assets/Images/shopping4.webp';
      case 5:
        return 'assets/Images/shopping5.webp';
      case 6:
        return 'assets/Images/shopping6.webp';
      case 7:
        return 'assets/Images/shopping7.webp';
      default:
        return '';
    }
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Set of 2-Black Sweetheart Neck Crop Top With High Rise Trouser for women';
      case 1:
        return 'Asymmetrical Floral Printed Co-Ord Set for women';
      case 2:
        return 'PINACOLADA Fringe Top With Skirt Co-Ords (M) by Myntra';
      case 3:
        return 'Srk Collection Women Two Piece Dress Pink Dress';
      case 4:
        return 'Set of 2-Black Sweetheart Neck Crop Top With High Rise Trouser for women';
      case 5:
        return 'Asymmetrical Floral Printed Co-Ord Set for women';
      case 6:
        return 'PINACOLADA Fringe Top With Skirt Co-Ords (M) by Myntra';
      case 7:
        return 'Srk Collection Women Two Piece Dress Pink Dress';
      default:
        return '';
    }
  }

  String getSubtitle(int index) {
    switch (index) {
      case 0:
        return '₹899.00\nFree delivery';
      case 1:
        return '₹999.00\nFree delivery';
      case 2:
        return '₹1,049.00\n₹79.00 delivery';
      case 3:
        return '₹899.00\nFree delivery';
      case 4:
        return '₹899.00\nFree delivery';
      case 5:
        return '₹999.00\nFree delivery';
      case 6:
        return '₹1,049.00\n₹79.00 delivery';
      case 7:
        return '₹899.00\nFree delivery';
      default:
        return '';
    }
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
