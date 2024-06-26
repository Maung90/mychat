import 'package:flutter/material.dart';

class Soon extends StatelessWidget {
  const Soon({super.key});

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
            image: const DecorationImage(image: NetworkImage('assets/images/6.png')),
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
      body: const Center(
        child: Text(
          "Halaman masih tahap pengembangan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
      backgroundColor: const Color.fromRGBO(39, 39, 54, 1),
      );
  }
}
