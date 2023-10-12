import 'package:flutter/material.dart';
import 'package:petro_audit/models/status_enum.dart';
import 'package:petro_audit/provider/login_provider.dart';
import 'package:petro_audit/presentation/bottom_navigation.dart';
import 'package:provider/provider.dart';

import 'widget/text_field.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Consumer<LoginProvider>(builder: (context, value, child) {
                return Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    InputFeild(
                        hintText: 'Username', controller: value.userNameCont),
                    const SizedBox(height: 30),
                    InputFeild(
                        hintText: 'Password', controller: value.passwordCont),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          value.submintUsernamePassword().then((data) {
                            if (value.status == CallStatus.success) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScreenMain()));
                            } else if (value.status == CallStatus.failed) {
                              final snackBar = SnackBar(
                                content: Text(value.errorMassege!),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(value.status == CallStatus.waiting
                            ? 'Loading...'
                            : 'Login'),
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
