import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Home', style: TextStyle(fontSize: 18)),
          elevation: 0,
          bottom: const TabBar(
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.deepPurple,
            tabs: [
              Tab(icon: Icon(Icons.chat_bubble_outline), text: "Chat"),
              Tab(icon: Icon(Icons.group_outlined), text: "Group"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Padding(padding: EdgeInsets.all(16.0), child: Text("Chat Screen")),
            Center(child: Text("Group")),
          ],
        ),
      ),
    );
  }
}
