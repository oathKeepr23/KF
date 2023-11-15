// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/Components/Button.dart';

import '../Firebase_Services/Firebase_services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final checkLogin = SplashServices();

  bool loading=false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image(
                fit: BoxFit.fill,
                width: width,
                height: height,
                image: const AssetImage('images/bg1.png')),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.1, vertical: height * 0.1),
                  child: const Image(
                      fit: BoxFit.fill, image: AssetImage('images/logo.png')),
                ),
                SizedBox(height: height * 0.4),
                AppButton(
                    loading: loading,
                    text: 'Continue',
                    onTap: () {
                      setState(() {
                        loading = true;
                      });
                      checkLogin.isLogin(context);
                      setState(() {
                        loading = false;
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
