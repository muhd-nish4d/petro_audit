import 'dart:developer';

import 'package:flutter/material.dart';

class InputFeild extends StatelessWidget {
  const InputFeild({super.key, required this.hintText, this.controller});
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 3, 0, 82),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          onChanged: (value) => log(value),
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.all(10),
              border: InputBorder.none,
              hintText: hintText),
        ),
      ),
    );
  }
}
