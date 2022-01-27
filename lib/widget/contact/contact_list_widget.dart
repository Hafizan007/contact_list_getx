import 'package:contact_list/controllers/contact_controller.dart';
import 'package:contact_list/widget/contact/alert_widget.dart';
import 'package:contact_list/widget/contact/contact_empty_widget.dart';
import 'package:contact_list/widget/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactController c = Get.find();
    return Obx(() {
      return c.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : c.contactList.isEmpty
              ? const ContactEmptyWidget()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: c.contactList.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => c.getDetail(c.contactList[index]),
                        child: Container(
                          constraints: const BoxConstraints(
                            minHeight: 110,
                          ),
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(31),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/man.png',
                                width: 50,
                                height: 50,
                              ),
                              marginWidth(15),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      c.contactList[index].name!,
                                      style: boldStyle(17),
                                    ),
                                    marginHeight(5),
                                    Text(c.contactList[index].labels!.join(','),
                                        style: lightStyle(15,
                                            mycolor: kGreyColor)),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () => c
                                        .handleButtonEdit(c.contactList[index]),
                                    child: const Icon(
                                      Icons.edit_outlined,
                                      color: kYellowColor,
                                      size: 20,
                                    ),
                                  ),
                                  marginHeight(10),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlerWidget(
                                                idContact: c.contactList[index]
                                                    .contactId!);
                                          });
                                    },
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: kTextLightColor,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
    });
  }
}
