import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileDP extends StatelessWidget {
  const ProfileDP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
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
    );
  }
}
