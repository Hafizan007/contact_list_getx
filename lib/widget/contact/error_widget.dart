import 'package:contact_list/widget/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Image(image: AssetImage('assets/images/error.jpg')),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.offAndToNamed('/contact-list');
              },
              style: buttonStyle(kPrimaryColor),
              child: Text('Try again',
                  style: mediumStyle(16, mycolor: kBackgroundColor)),
            ),
          ),
        ],
      ),
    );
  }
}
