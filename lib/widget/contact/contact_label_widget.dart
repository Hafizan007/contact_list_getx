import 'package:contact_list/controllers/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactController c = Get.find();
    return Obx(() {
      return Wrap(
        children: [
          for (int i = 0; i < c.labelType.length; i++) _listItem(i, c),
        ],
      );
    });
  }

  Widget _listItem(int i, ContactController c) {
    c.selectedList.add(false);
    return Container(
        margin: const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
        child: FilterChip(
            label: Text(c.labelType[i]),
            selected: c.selectedList[i],
            onSelected: (bool value) {
              c.setLabel(value, i);
            }));
  }
}
