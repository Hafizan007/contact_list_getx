import 'package:contact_list/controllers/contact_controller.dart';
import 'package:contact_list/widget/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlerWidget extends StatelessWidget {
  const AlerWidget({Key? key, required this.idContact}) : super(key: key);
  final String idContact;
  @override
  Widget build(BuildContext context) {
    final ContactController c = Get.find();
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: SizedBox(
        height: 220,
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.all(
                13.0,
              ),
              margin: const EdgeInsets.only(top: 5),
              child: const Center(
                child: Text(
                  'Delete contact',
                  style: TextStyle(
                    fontSize: 19,
                    color: kBlack,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 0),
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: const Center(
                child: Text(
                  'Are you sure delete this contact?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: kBlack,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 135,
                    height: 58,
                    child: OutlinedButton(
                      onPressed: () {
                        c.deleteContact(idContact);
                        Get.back();
                      },
                      child: const Text(
                        'Sure!',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
                      ),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(
                            width: 1,
                            color: kPrimaryColor,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 135,
                    height: 58,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'No!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800),
                      ),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: kPrimaryColor.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: const BorderSide(
                            width: 1,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
