
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/Login_Screen/Login_Screen.dart';
import 'Utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: KBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(bodyColor: KPrimaryColor)),
      initialRoute: '/LoginScreen',
      getPages: [
        GetPage(
          name: '/LoginScreen',
          page: () => const LoginScreen(),
        ),
      ],
    );
  }
}
