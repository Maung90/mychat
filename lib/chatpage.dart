import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marquee/marquee.dart';
import 'package:mychat/database/db_helper.dart';
import 'package:mychat/model/message_model.dart';
import 'mainscreen.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();
  final DBHelper _dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    List<Message> loadedMessages = await _dbHelper.getMessages();
    setState(() {
      messages.addAll(loadedMessages);
    });
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      Message newMessage = Message(text: _controller.text, sender: 'me');
      await _dbHelper.insertMessage(newMessage);
      setState(() {
        messages.add(newMessage);
      });

      String userMessage = _controller.text;
      _controller.clear();

      try {
        String encodeMessage = Uri.encodeComponent(userMessage);
        final url =
            'https://api.ngodingaja.my.id/api/gpt?prompt=$encodeMessage';
        final response = await http.get(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          String botReply = jsonResponse['hasil'];
          Message botMessage = Message(text: botReply, sender: 'other');
          await _dbHelper.insertMessage(botMessage);
          setState(() {
            messages.add(botMessage);
          });
        } else {
          Message errorMessage =
              Message(text: 'Failed to get response from bot', sender: 'other');
          await _dbHelper.insertMessage(errorMessage);
          setState(() {
            messages.add(errorMessage);
          });
        }
      } catch (e) {
        Message errorMessage = Message(text: 'Error: $e', sender: 'other');
        await _dbHelper.insertMessage(errorMessage);
        setState(() {
          messages.add(errorMessage);
        });
      }
    }
  }

  void _showEditDialog(int index) {
    final TextEditingController _editController =
        TextEditingController(text: messages[index].text);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Message'),
          content: TextField(
            controller: _editController,
            decoration: const InputDecoration(
              hintText: 'Edit your message',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                if (_editController.text.isNotEmpty) {
                  setState(() {
                    messages[index].text = _editController.text;
                  });
                  await _dbHelper.updateMessage(messages[index]);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMessage(int index) async {
    await _dbHelper.deleteMessage(messages[index].id!);
    setState(() {
      messages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 240,
          child: Row(children: [
            Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.fromLTRB(8, 5, 10, 0),
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage('assets/images/6.png')),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              width: 170,
              child: Column(
                children: [
                  const Text(
                    "Sarah",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                    child: Marquee(
                      text: 'Terakhir Terlihat 28/10/2021',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold),
                      scrollAxis: Axis.horizontal,
                      blankSpace: 20.0,
                      velocity: 30.0,
                      startPadding: 10.0,
                      accelerationDuration: const Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: const Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                ],
              ),
            ),
          ]),
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
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isMe = message.sender == 'me';
                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Text(
                              message.text,
                              style: TextStyle(
                                color: isMe ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          if (isMe)
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit,
                                      color:
                                          isMe ? Colors.white : Colors.black),
                                  onPressed: () => _showEditDialog(index),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete,
                                      color:
                                          isMe ? Colors.white : Colors.black),
                                  onPressed: () => _deleteMessage(index),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                },
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
                  width: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: Color.fromRGBO(39, 39, 54, 1),
                        ),
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Type your message...',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Color.fromRGBO(39, 39, 54, 1),
                    ),
                    onPressed: _sendMessage,
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

void main() {
  runApp(const MaterialApp(
    home: ChatPage(),
  ));
}
