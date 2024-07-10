import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import 'soon.dart';
// import 'chat.dart';
import 'chatpage.dart';


class MainScreen extends StatelessWidget {
const MainScreen({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        "MyChat",
        style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold),
      ), //text
      centerTitle: true,
      leading: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.fromLTRB(8, 5, 0, 0),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage('assets/images/6.png')),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          decoration: BoxDecoration(
            border: Border.all(
                width: 1.5, color: const Color.fromRGBO(104, 104, 104, 1)),
            borderRadius: BorderRadius.circular(5),
          ),
          width: 45,
          height: 45,
          child: const Icon(
            Icons.search_sharp,
            color: Color.fromRGBO(195, 195, 195, 1),
            size: 25,
          ),
        ),
      ],
      backgroundColor: const Color.fromRGBO(39, 39, 54, 1),
    ),
    body: Container(
      width: 400,
      color: const Color.fromRGBO(39, 39, 54, 1),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 70,
                width: 370,
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.add,
                          color: Color.fromRGBO(195, 195, 195, 1),
                          size: 35,
                        ),
                        status('assets/images/1.png'),
                        status('assets/images/3.png'),
                        status('assets/images/8.png'),
                        status('assets/images/7.png'),
                        status('assets/images/9.png'),
                        status('assets/images/6.png'),
                      ]),
                ),
              ),
              SizedBox(
                width: 370,
                child: Row(children: [
                  const Text(
                    "Chats",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: const Text(
                        "3 new",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ]),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatPage(),
                    ),
                  );
                },
                child: chatBiru('assets/images/6.png', "Sarah", "01 : 02",
                    "Lorem udach makan beyum?... ..."),
              ),
              chatBiru('assets/images/3.png', "Ujang", "01 : 02",
                  "Lorem udach makan beyum?... ..."),
              chat('assets/images/1.png', "Mikel", '01 : 47',
                  "Lorem ipsum dolor sit amet, cons.."),
              chat('assets/images/4.png', "Elis", '01 : 44',
                  "Lorem ipsum dolor sit amet, cons.."),
              chatBiru('assets/images/12.png', "Okasan", "01 : 22",
                  "Mau makan apach kamu kak?...."),
              chat('assets/images/7.png', "Narto", '01 : 48',
                  "Lorem ipsum dolor sit amet, cons.."),
              chat('assets/images/8.png', "Nami", '01 : 48',
                  "Lorem ipsum dolor sit amet, cons.."),
              chat('assets/images/9.png', "Lee", '01 : 48',
                  "Lorem ipsum dolor sit amet, cons.."),
              chat('assets/images/11.png', "Asep", '01 : 48',
                  "Lorem ipsum dolor sit amet, cons.."),
            ]),
      ),
    ),
    bottomNavigationBar: BottomAppBar(
      color: const Color.fromRGBO(39, 39, 54, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 50,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 35,
                ),
                Icon(
                  Icons.brightness_1,
                  color: Colors.white,
                  size: 7,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.people_outline, size: 35),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Soon(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 35),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Soon(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.call, size: 35),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Soon(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, size: 35),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Soon(),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget status(String gambar) {
  return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      padding: const EdgeInsets.all(0.8),
      decoration: BoxDecoration(
        border: const DashedBorder.fromBorderSide(
          dashLength: 4,
          side: BorderSide(color: Color.fromRGBO(30, 192, 3, 1), width: 2),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Image.asset(
        gambar,
        fit: BoxFit.contain,
      ));
}

Widget chat(String asset, String nama, String jam, String text) {
  return Container(
    width: 370,
    margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            //width : 280,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              children: [
                Text(jam,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                    )),
                const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 25,
                )
              ],
            ),
          ),
        ]),
  );
}

Widget chatBiru(String asset, String nama, String jam, String text) {
  return Container(
    width: 370,
    margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            //margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            width: 250,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                ]),
          ),
          Container(
            width: 23,
            height: 23,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(3)),
            child: const Center(
              child: Text('1',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Quicksand',
                    color: Colors.white,
                  )),
            ),
          ),
        ]),
  );
}
}
