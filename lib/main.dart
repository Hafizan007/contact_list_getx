import 'package:contact_list/screen/contact_list_screen.dart';
import 'package:contact_list/utils/routes.dart';
import 'package:contact_list/widget/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Contact list',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themeData(context),
        home: const ContactListScreen(),
        getPages: Routes.getPages);
  }
}
