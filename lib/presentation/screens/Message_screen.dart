import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageScreen extends StatelessWidget {
  final String name;
  final String avatar;

  const MessageScreen({Key? key, required this.name, required this.avatar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(avatar),
                  radius: 20,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16)),
                Text("Active now", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
            children: [IconButton(
              icon: SvgPicture.asset('assets/images/m-Call.svg', width: 24, height: 24,color: Colors.black,),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset('assets/images/Video.svg'),
              onPressed: () {},
            ),
            ],
            ),
          ),
        ],

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8FBFA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Today", style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13),bottomRight: Radius.circular(13)),
                    ),
                    child: Text(
                      "Hello! Jhon abraham",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // align name and image to top
                  children: [
                    // Avatar
                    CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                      radius: 18,
                    ),

                    SizedBox(width: 8),

                    // Name + Message Bubble
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),

                        // Message Bubble
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(13),
                              bottomLeft: Radius.circular(13),
                              bottomRight: Radius.circular(13),
                            ),
                          ),
                          child: Text(
                            "Hello! Nazrul How are you?",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13),bottomRight: Radius.circular(13)),
                    ),
                    child: Text(
                      "You did your job well!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(avatar), radius: 18),
                    SizedBox(width: 8),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(13),bottomLeft: Radius.circular(13),bottomRight: Radius.circular(13)),
                            ),
                            child: Text("Have a great working week!!"),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(13),bottomLeft: Radius.circular(13),bottomRight: Radius.circular(13)),
                            ),
                            child: Text("Hope you like it"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(13),bottomLeft: Radius.circular(13),bottomRight: Radius.circular(13)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white),
                        SizedBox(width: 4),
                        Icon(Icons.graphic_eq, color: Colors.white),
                        SizedBox(width: 8),
                        Text("00:16", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 90,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(

              color: Colors.white,
            ),
            child: Row(
              children: [
                // 📎 Attachment icon
                Icon(Icons.attach_file, color: Colors.black,weight: 600,size: 24,),

                SizedBox(width: 10),

                // 💬 Text input with clipboard icon inside
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Write your message",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.content_paste_rounded, color: Colors.grey,weight: 600,size: 24,),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 10),

                // 📷 Camera icon
                Icon(Icons.photo_camera_outlined,  color: Colors.black,weight: 600,size: 24,),

                SizedBox(width: 10),

                // 🎤 Mic icon
                Icon(Icons.mic_none,  color: Colors.black,weight: 600,size: 24,),
              ],
            ),
          )

        ],
      ),
    );
  }
}


