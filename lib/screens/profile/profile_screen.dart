import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size phoneScreen = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: phoneScreen.height * .5,
            child: const Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundColor: Color.fromARGB(255, 255, 252, 224),
                ),
                CircleAvatar(
                  radius: 110,
                  backgroundColor: Color.fromARGB(255, 255, 251, 208),
                ),
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Color.fromARGB(255, 255, 245, 208),
                ),
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Color.fromARGB(255, 255, 239, 180),
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Color.fromARGB(255, 255, 233, 154),
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 227, 124),
                  radius: 70,
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 221, 100),
                  radius: 60,
                ),
                CircleAvatar(
                  backgroundColor: Colors.amberAccent,
                  radius: 50,
                  child: Icon(
                    CupertinoIcons.person_alt,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Username',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Firstname Lastname',
            style: TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          const Text(
            'I got full null values as resposnse except for my ID and token when I am logged in, so I added fully static values on this screen',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
