import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // final String hi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (context, value, child) => Column(
            children: [
              Expanded(
                  child: GridView.builder(
                padding: const EdgeInsets.all(4),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 0),
                itemBuilder: (context, index) {
                  final data = value.homeData?.dtAbstract[index];
                  return Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data?.item ?? ''),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(int.parse(
                                    '0xFF${data?.colour.substring(1, 7).toUpperCase()}')),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                data?.count.toString() ?? '',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: value.homeData?.dtAbstract.length ?? 0,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
