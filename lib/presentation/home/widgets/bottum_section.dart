import 'package:flutter/material.dart';
import 'package:petro_audit/provider/home_provider.dart';

class HomeBottumSection extends StatelessWidget {
  const HomeBottumSection({super.key, required this.value});
  final HomeProvider value;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
    );
  }
}
