import 'package:flutter/material.dart';
import 'package:petro_audit/provider/login_provider.dart';
import 'package:petro_audit/screens/bottom_navigation.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';
import 'widget/text_field.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 0, 34),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Consumer<LoginProvider>(
                builder: (context, value, child) => Column(
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
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
                        onPressed: () {
                          value.submintUsernamePassword();
                          if (value.isSuccess) {
                            Provider.of<HomeProvider>(context, listen: false)
                                .getHomeDatas();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenMain(
                                          token: value.token!,
                                          uid: value.uid!,
                                        )));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(value.isLoading ? 'Loading...' : 'Login'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
