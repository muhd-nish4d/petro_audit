import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petro_audit/provider/home_provider.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({
    super.key,
    required this.value,
  });
  final HomeProvider value;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
      ),
      items: value.homeData?.dtContent.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Card(
                color: Colors.purple[50],
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            i.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            i.category,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 10),
                          ),
                          Expanded(
                              child: Center(
                            child: Text(
                              i.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '- ${i.companyName}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      )),
                ));
          },
        );
      }).toList(),
    );
  }
}
