import 'package:contact_list/controllers/contact_controller.dart';
import 'package:contact_list/widget/theme/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactSearchWidget extends StatelessWidget {
  const ContactSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactController c = Get.find();
    return SizedBox(
      height: 50,
      child: TextFieldInput(
          onSubmit: (value) {
            c.search.value = value;
            c.getListContact();
          },
          textEditingController: c.searchController.value,
          iconData: const Icon(Icons.search),
          hintText: 'Search contact',
          textInputType: TextInputType.name),
    );
  }
}
