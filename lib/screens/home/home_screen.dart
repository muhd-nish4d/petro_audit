import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:petro_audit/models/status_enum.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // final String hi;

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false)
                          .getHomeDatas(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Consumer<HomeProvider>(builder: (context, value, child) {
          return value.status == CallStatus.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : value.status == CallStatus.success
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                          ),
                          items: value.homeData?.dtContent.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Card(
                                    color: Colors.purple[50],
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Center(
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                i.title,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                i.category,
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10),
                                              ),
                                              Expanded(
                                                  child: Center(
                                                child: Text(
                                                  i.description,
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              )),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text(
                                                  '- ${i.companyName}',
                                                  style: const TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              )
                                            ],
                                          )),
                                    ));
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                            child: GridView.builder(
                          padding: const EdgeInsets.all(4),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data?.item ?? ''),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(int.parse(
                                              '0xFF${data?.colour.substring(1, 7).toUpperCase()}')),
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
                        )),
                      ],
                    )
                  : const Center(
                      child: Icon(Icons.wifi_find_rounded),
                    );
        }),
      ),
    );
  }
}
