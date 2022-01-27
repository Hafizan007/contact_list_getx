import 'package:contact_list/controllers/contact_controller.dart';
import 'package:contact_list/widget/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactController c = Get.find();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Container(
              height: 35,
              width: 35,
              padding: const EdgeInsets.fromLTRB(10, 5, 3, 5),
              decoration: BoxDecoration(
                  color: kBlueColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(99)),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: kBlack,
              ),
            )),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 480,
            ),
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.white,
              borderRadius: BorderRadius.circular(31),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/man.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                marginHeight(30),
                Text(
                  c.contactDetail.value.name!,
                  style: boldStyle(27),
                ),
                marginHeight(20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.contactDetail.value.phoneNumber!,
                            style: mediumStyle(18),
                          ),
                          Text(
                            'Mobile | Indonesia',
                            style: lightStyle(11),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () =>
                            c.callNumber(c.contactDetail.value.phoneNumber!),
                        icon: Container(
                          height: 50,
                          width: 50,
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          decoration: BoxDecoration(
                              color: kGreenColor2,
                              borderRadius: BorderRadius.circular(99)),
                          child: const Icon(
                            Icons.phone,
                            size: 15,
                            color: kWhiteBackground,
                          ),
                        ))
                  ],
                ),
                marginHeight(15),
                Text(
                  c.contactDetail.value.email!,
                  style: mediumStyle(18),
                ),
                Text(
                  'Mail',
                  style: lightStyle(11),
                ),
                marginHeight(15),
                Text(
                  c.contactDetail.value.notes!,
                  style: mediumStyle(18),
                ),
                Text(
                  'Note',
                  style: lightStyle(11),
                ),
                marginHeight(15),
                Text(c.contactDetail.value.labels!.join(', '),
                    style: mediumStyle(18)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
