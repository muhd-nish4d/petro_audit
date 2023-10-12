import 'package:flutter/material.dart';
import 'package:petro_audit/models/status_enum.dart';
import 'package:petro_audit/presentation/home/widgets/bottum_section.dart';
import 'package:petro_audit/presentation/home/widgets/top_section.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false).getHomeDatas(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Consumer<HomeProvider>(builder: (context, value, child) {
          //If loading return loading screen

          return value.status == CallStatus.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )

              //if success =>
              //This screen have HomeTopSection and HomeBottumSection
              //Top section is carousal and bottum section is cards

              : value.status == CallStatus.success
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        HomeTopSection(value: value),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(child: HomeBottumSection(value: value)),
                      ],
                    )

                  //if failed

                  : const Center(
                      child: Icon(Icons.wifi_find_rounded),
                    );
        }),
      ),
    );
  }
}
