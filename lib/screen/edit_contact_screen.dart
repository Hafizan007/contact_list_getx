import 'package:contact_list/controllers/contact_controller.dart';
import 'package:contact_list/widget/contact/contact_label_widget.dart';
import 'package:contact_list/widget/theme/schema.dart';
import 'package:contact_list/widget/theme/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditContactScreen extends StatelessWidget {
  const EditContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactController c = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit contact'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFieldInput(
              textEditingController: c.nameController.value,
              iconData: const Icon(Icons.account_circle_sharp),
              hintText: 'Name contact',
              textInputType: TextInputType.name),
          marginHeight(20),
          TextFieldInput(
              textEditingController: c.emailController.value,
              iconData: const Icon(Icons.email_rounded),
              hintText: 'Email ',
              textInputType: TextInputType.name),
          marginHeight(20),
          TextFieldInput(
              textEditingController: c.phoneController.value,
              iconData: const Icon(Icons.phone_android),
              hintText: 'Phone number',
              textInputType: TextInputType.name),
          marginHeight(20),
          TextFieldInput(
              textEditingController: c.notesController.value,
              iconData: const Icon(Icons.note),
              hintText: 'Note',
              textInputType: TextInputType.name),
          marginHeight(20),
          const LabelWidget(),
          marginHeight(20),
          Obx(() {
            return ElevatedButton(
              onPressed: c.handleAddButtonEdit,
              child: c.loading.value
                  ? const Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: kWhiteBackground,
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Edit contact',
                            style:
                                semiBoldStyle(17, mycolor: kBackgroundColor)),
                      ],
                    ),
              style: buttonStyle(kPrimaryColor),
            );
          }),
        ],
      ),
    );
  }
}
