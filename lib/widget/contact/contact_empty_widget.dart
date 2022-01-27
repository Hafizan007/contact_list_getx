import 'package:contact_list/widget/theme/schema.dart';
import 'package:flutter/material.dart';

class ContactEmptyWidget extends StatelessWidget {
  const ContactEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        marginHeight(50),
        const SizedBox(
          width: double.infinity,
          child: Icon(
            Icons.zoom_out,
            color: kPrimaryColor,
            size: 120,
          ),
        ),
        marginHeight(20),
        Text(
          'Contact is empty',
          style: mediumStyle(18),
        )
      ],
    );
  }
}
