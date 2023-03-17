import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/chatPage1.dart';
import 'package:pinterest_clone/screen/pages/bottomNavPages/chatPage2.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 24, 23, 23),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 24, 23, 23),
          centerTitle: true,
          title: const SizedBox(
            width: 200,
            child: TabBar(
              indicatorColor: Color.fromARGB(255, 53, 51, 51),
              indicatorWeight: 4,
              tabs: [
                Tab(
                  text: 'Updates',
                ),
                Tab(
                  text: 'Messages',
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Chat1(),
            Chat2(),
          ],
        ),
      ),
    );
  }
}
