import 'package:flutter/material.dart';

import 'mainscreen.dart';

class Chat extends StatelessWidget {
  final String nama;

  Chat({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nama,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            );
          },
        ),
        actions: [
          const Icon(
            Icons.more_horiz,
            color: Color.fromRGBO(195, 195, 195, 1),
            size: 25,
          ),
          const SizedBox(width: 20),
        ],
        backgroundColor: const Color.fromRGBO(39, 39, 54, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromRGBO(39, 39, 54, 1),
              child: const Center(
                child: Text(
                  'content',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color.fromRGBO(39, 39, 54, 1),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  width : 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                    IconButton(
                      icon:
                          const Icon(Icons.emoji_emotions, color: Color.fromRGBO(39, 39, 54, 1)),
                      onPressed: () {},
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                        ),
                      ),
                    ),
                  ]),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send,
                        color: Color.fromRGBO(39, 39, 54, 1)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
