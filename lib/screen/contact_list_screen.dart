import 'package:contact_list/controllers/contact_controller.dart';
import 'package:contact_list/widget/contact/contact_list_widget.dart';
import 'package:contact_list/widget/contact/contact_search_widget.dart';
import 'package:contact_list/widget/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactController c = Get.put(ContactController());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            const ContactSearchWidget(),
            marginHeight(40),
            ContactListWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.handleButtonForm,
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: kWhiteBackground,
        ),
      ),
    );
  }
}
