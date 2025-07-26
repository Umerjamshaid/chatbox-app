import 'package:chatbox/presentation/Screens/Message_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //fetching current user data from firestore
  final User = FirebaseAuth.instance.currentUser!;




  // Background colors for story avatars
  int bgcolor1 = 0xFFFFC746;

  int bgcolor2 = 0xFFEDA0A8;

  int bgcolor3 = 0xFF98A1F1;

  int bgcolor4 = 0xFFFBDC94;

  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> chats = [];
  List<Map<String, dynamic>> filteredChats = [];

  @override
  void initState() {
    super.initState();
    chats = [
      {
        'name': 'Alex Linderson',
        'message': 'How are you today?',
        'time': '2 min ago',
        'unread': 3,
        'avatar': 'assets/images/profile-image.png',
      },
      {
        'name': 'Team Align',
        'message': "Don't miss to attend the meeting.",
        'time': '2 min ago',
        'unread': 4,
        'avatar': 'assets/images/adil.png',
      },
      {
        'name': 'John Ahraham',
        'message': 'Hey! Can you join the meeting?',
        'time': '2 min ago',
        'unread': 0,
        'avatar': 'assets/images/alex.png',
      },
      {
        'name': 'Sabila Sayma',
        'message': 'How are you today?',
        'time': '2 min ago',
        'unread': 0,
        'avatar': 'assets/images/dean.png',
      },
      {
        'name': 'John Borino',
        'message': 'Have a good day 🌸',
        'time': '2 min ago',
        'unread': 0,
        'avatar': 'assets/images/max.png',
      },
    ];

    // Initialize filteredChats with all chats // search functionality
    filteredChats = List.from(chats);
    _searchController.addListener(_filterChats);
  }

  void _filterChats() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredChats = chats.where((chat) {
        final name = chat['name'].toLowerCase();
        final message = chat['message'].toLowerCase();
        return name.contains(query) || message.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile-image.png'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 110,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  storyAvatar(
                    'My status',
                    'assets/images/profile-image.png',
                    showOverlay: true,
                  ),
                  storyAvatar(
                    'Adil',
                    'assets/images/adil.png',
                    bgColor: Color(bgcolor1),
                    showOverlay: false,
                  ),
                  storyAvatar(
                    'Marina',
                    'assets/images/alex.png',
                    bgColor: Color(bgcolor2),
                  ),
                  storyAvatar(
                    'Dean',
                    'assets/images/dean.png',
                    bgColor: Color(bgcolor3),
                  ),
                  storyAvatar(
                    'Max',
                    'assets/images/max.png',
                    bgColor: Color(bgcolor4),
                    showOverlay: false,
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 20),
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    var chat = chats[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ), // 👈 gap between tiles
                      child: Slidable(
                        key: ValueKey(chat['name']), // Unique key
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            // Wrap both buttons in a row to fully control spacing
                            CustomSlidableAction(
                              flex: 1,
                              onPressed: (context) {},
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // 👈 Prevents extra spacing
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ), // 👈 Small spacing between buttons
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MessageScreen(
                                  name: chat['name'],
                                  avatar: chat['avatar'],
                                ),
                              ),
                            );
                          },
                          leading: Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(chat['avatar']),
                                radius: 25,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 6,
                                ),
                              ),
                            ],
                          ),
                          title: Text(
                            chat['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            chat['message'],
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                chat['time'],
                                style: TextStyle(fontSize: 12),
                              ),
                              if (chat['unread'] > 0)
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '${chat['unread']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/message.svg',
              width: 24,
              height: 24,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Call.svg',
              width: 24,
              height: 24,
            ),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/user.svg',
              width: 24,
              height: 24,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/settings.svg',
              width: 24,
              height: 24,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget storyAvatar(
    String name,
    String imagePath, {
    Color bgColor = Colors.grey, // default background color
    bool showOverlay = false, // optional overlay
    String overlayIcon = 'assets/images/images/person-icon.png',
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: bgColor,
                radius: 30,
                child: CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 27,
                  backgroundColor: Colors.transparent,
                ),
              ),
              if (showOverlay)
                Positioned(
                  top: 40,
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: AssetImage('assets/images/Vector.svg'),
                    backgroundColor: Colors.white,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
