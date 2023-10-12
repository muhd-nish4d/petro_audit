import 'package:flutter/material.dart';
import 'package:petro_audit/presentation/profile/widgets/profile_dp.dart';

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
            child: const ProfileDP(),
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
