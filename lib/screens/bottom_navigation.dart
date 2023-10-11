import 'package:flutter/material.dart';
import 'package:petro_audit/provider/audit_provider.dart';
import 'package:petro_audit/screens/audit/audit_screen.dart';
import 'package:petro_audit/screens/home/home_screen.dart';
import 'package:petro_audit/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

import '../provider/graph_provider.dart';
import '../provider/home_provider.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  ValueNotifier<int> screenNotifier = ValueNotifier(0);
  final screens = const [HomeScreen(), ScreenAudit(), ScreenProfile()];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: screenNotifier,
        builder: (context, value, child) {
          return Scaffold(
            body: SafeArea(child: screens[value]),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: value,
                onTap: (value) {
                  screenNotifier.value = value;

                  switch (value) {
                    case 0:
                      
                      break;
                    case 1:
                      Provider.of<GraphProvider>(context, listen: false)
                          .getGraphDatas(context);
                      Provider.of<AuditProvider>(context, listen: false)
                          .getAuditDetails(context);
                      break;
                    default:
                  }

                  // if (value == 1) {
                  //   Provider.of<GraphProvider>(context, listen: false)
                  //       .getGraphDatas(context);
                  //   Provider.of<AuditProvider>(context, listen: false)
                  //       .getAuditDetails(context);
                  // }
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'hi'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.abc), label: 'hello'),
                  BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'hii')
                ]),
          );
        });
  }
}
