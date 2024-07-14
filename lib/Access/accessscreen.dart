import 'dart:async';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:personality_quiz/chat/commonRoom.dart';

class Collaborative extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Colaborative Shopping'),
            backgroundColor: Colors.pink,
          ),
          body: ReactionScreen(),
        ),
      ),
    );
  }
}

class ReactionScreen extends StatefulWidget {
  @override
  _ReactionScreenState createState() => _ReactionScreenState();
}

class _ReactionScreenState extends State<ReactionScreen> {
  final TextEditingController _textController = TextEditingController();

  List<ScheduledItem> scheduledItems = [
    ScheduledItem(
      itemType: ItemType.Reaction,
      assetPath: 'assets/reaction/wow.png',
      leftPosition: 0.1,
      scheduledTime: const Duration(seconds: 5),
      backgroundColor: Colors.yellow,
      name: 'Aditi',
    ),
    ScheduledItem(
      itemType: ItemType.Text,
      text: 'Hiiiiiiiiiii',
      leftPosition: 0.5,
      backgroundColor: Colors.blue,
      scheduledTime: const Duration(seconds: 15),
      name: 'Shreya',
    ),
    ScheduledItem(
      itemType: ItemType.Text,
      text: 'Hello!!!',
      leftPosition: 0.5,
      backgroundColor: Colors.yellow,
      scheduledTime: const Duration(seconds: 10),
      name: 'Aditi',
    ),
    ScheduledItem(
      itemType: ItemType.Text,
      text: 'Its looking nice',
      leftPosition: 0.5,
      backgroundColor: Colors.blue,
      scheduledTime: const Duration(seconds: 15),
      name: 'Shreya',
    ),
    ScheduledItem(
      itemType: ItemType.Reaction,
      assetPath: 'assets/reaction/like.jpeg',
      leftPosition: 0.1,
      backgroundColor: Colors.yellow,
      scheduledTime: const Duration(seconds: 20),
      name: 'Shreya',
    ),
    ScheduledItem(
      itemType: ItemType.Text,
      text: 'Second one is beautiful',
      leftPosition: 0.5,
      backgroundColor: Colors.blue,
      scheduledTime: const Duration(seconds: 22),
      name: 'Shreya',
    ),
    ScheduledItem(
      itemType: ItemType.Reaction,
      assetPath: 'assets/reaction/like.jpeg',
      leftPosition: 0.1,
      scheduledTime: const Duration(seconds: 25),
      backgroundColor: Colors.yellow,
      name: 'Aditi',
    ),
    ScheduledItem(
      itemType: ItemType.Text,
      text: 'Second one is beautiful',
      leftPosition: 0.5,
      backgroundColor: Colors.blue,
      scheduledTime: const Duration(seconds: 29),
      name: 'Shreya',
    ),
    ScheduledItem(
      itemType: ItemType.Reaction,
      assetPath: 'assets/reaction/beautiful.png',
      leftPosition: 0.1,
      scheduledTime: const Duration(seconds: 32),
      backgroundColor: Colors.blue,
      name: 'Shreya',
    ),
    // Add more scheduled items as needed
  ];

  @override
  void initState() {
    super.initState();
    scheduleItems();
  }

  void scheduleItems() {
    for (var item in scheduledItems) {
      Timer(item.scheduledTime, () {
        displayItem(item);
      });
    }
  }

  void displayItem(ScheduledItem item) {
    if (item.itemType == ItemType.Reaction) {
      _showScdReaction(
        item.assetPath!,
        item.leftPosition,
        item.name!,
      ); // Use ! to assert non-null
    } else if (item.itemType == ItemType.Text) {
      _showFloatingScdText(
        item.text!,
        item.leftPosition,
        item.backgroundColor!,
        item.name!,
      ); // Use ! to assert non-null
    }
  } // List to store scheduled messages

  void _showScdReaction(String assetPath, double leftPosition, String name) {
    final overlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned(
            left: (MediaQuery.of(context).size.width * 0.04),
            bottom: 200, // Adjust the vertical position as needed
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Positioned(
            left: leftPosition,
            bottom: 160, // Adjust the vertical position as needed
            child: AnimatedFloatingReaction(
              assetPath: assetPath,
              leftPosition: leftPosition,
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(overlay);

    Future.delayed(Duration(seconds: 2), () {
      overlay.remove();
    });
  }

  void _showReaction(String assetPath, double leftPosition, String name) {
    final overlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned(
            left:
                (MediaQuery.of(context).size.width - calculateTextWidth(name)) /
                    2,
            bottom: 200, // Adjust the vertical position as needed
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          Positioned(
            left: leftPosition,
            bottom: 160, // Adjust the vertical position as needed
            child: AnimatedFloatingReaction(
              assetPath: assetPath,
              leftPosition: leftPosition,
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(overlay);

    Future.delayed(Duration(seconds: 2), () {
      overlay.remove();
    });
  }

  void _showFloatingScdText(
      String text, double leftPosition, Color color, String name) {
    final overlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          AnimatedFloatingText(
            text: text,
            leftPosition: leftPosition,
            backgroundColor: color,
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width * 0.04),

            bottom: 200, // Adjust the vertical position as needed
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: color.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(overlay);
    Future.delayed(Duration(seconds: 2), () {
      overlay.remove();
    });
  }

  void _showFloatingText(
      String text, double leftPosition, Color color, String name) {
    final overlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          AnimatedFloatingText(
            text: text,
            leftPosition: leftPosition,
            backgroundColor: color,
          ),
          Positioned(
            left:
                (MediaQuery.of(context).size.width - calculateTextWidth(text)) /
                    2,
            bottom: 200, // Adjust the vertical position as needed
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: color.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(overlay);
    Future.delayed(Duration(seconds: 2), () {
      overlay.remove();
    });
  }

  double calculateTextWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        MainScreen(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => _showReaction('assets/reaction/like.jpeg',
                          screenWidth * 0.1, 'Muskan'),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          height: 40,
                          width: 60,
                          fit: BoxFit.fill,
                          image: AssetImage('assets/reaction/like.jpeg'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _showReaction('assets/reaction/wow.png',
                          screenWidth * 0.25, 'Muskan'),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          height: 40,
                          width: 40,
                          fit: BoxFit.fill,
                          image: AssetImage('assets/reaction/wow.png'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _showReaction('assets/reaction/laugh.jpeg',
                          screenWidth * 0.4, 'Muskan'),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          height: 40,
                          width: 50,
                          fit: BoxFit.fill,
                          image: AssetImage('assets/reaction/laugh.jpeg'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _showReaction(
                          'assets/reaction/beautiful.png',
                          screenWidth * 0.55,
                          'Muskan'),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          height: 40,
                          width: 50,
                          fit: BoxFit.fill,
                          image: AssetImage('assets/reaction/beautiful.png'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _showReaction('assets/reaction/dislike.jpg',
                          screenWidth * 0.7, 'Muskan'),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/reaction/dislike.jpg'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _showReaction('assets/reaction/bad.jpeg',
                          screenWidth * 0.85, 'Muskan'),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/reaction/bad.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(12)),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'Message',
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                                color: Colors.pink, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                                color: Colors.pink, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                      size: 50,
                    ),
                    color: Colors.pink,
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        _showFloatingText(
                            _textController.text,
                            screenWidth * 0.5,
                            Colors.pink, // Customize color here
                            'Muskan'
                            // Schedule message 5 seconds later
                            );
                        _textController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedFloatingReaction extends StatefulWidget {
  final String assetPath;
  final double leftPosition;

  const AnimatedFloatingReaction({
    required this.assetPath,
    required this.leftPosition,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedFloatingReactionState createState() =>
      _AnimatedFloatingReactionState();
}

class _AnimatedFloatingReactionState extends State<AnimatedFloatingReaction>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.leftPosition,
      bottom:
          160, // Adjust this value as needed to float above the text box and reactions
      child: SlideTransition(
        position: _offsetAnimation,
        child: Image.asset(
          widget.assetPath,
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}

class AnimatedFloatingText extends StatefulWidget {
  final String text;
  final double leftPosition;
  final Color backgroundColor;

  const AnimatedFloatingText({
    required this.text,
    required this.leftPosition,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedFloatingTextState createState() => _AnimatedFloatingTextState();
}

class _AnimatedFloatingTextState extends State<AnimatedFloatingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.leftPosition,
      bottom:
          160, // Adjust this value as needed to float above the text box and reactions
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: widget.backgroundColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

enum ItemType {
  Reaction,
  Text,
}

class ScheduledItem {
  final ItemType itemType;
  final String? assetPath;
  final String? text;
  final double leftPosition;
  final Color? backgroundColor;
  final Duration scheduledTime;
  final String? name; // New property for fixed name

  ScheduledItem({
    required this.itemType,
    this.assetPath,
    this.text,
    required this.leftPosition,
    this.backgroundColor,
    required this.scheduledTime,
    this.name, // Initialize here
  });
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
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
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    getSubtitle(index),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                const Spacer(),
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
                      child: const Text(
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
            title: const Text('Enter Email IDs'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...emailControllers.map((controller) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
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
                  child: const Text('Add Another Email'),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Submit'),
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
                child: const Text('Close'),
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
