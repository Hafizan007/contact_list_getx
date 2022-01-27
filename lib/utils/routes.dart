import 'package:contact_list/screen/add_contact_screen.dart';
import 'package:contact_list/screen/contact_detail_screen.dart';
import 'package:contact_list/screen/contact_list_screen.dart';
import 'package:contact_list/screen/edit_contact_screen.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage>? getPages = [
    GetPage(name: '/contact-list', page: () => const ContactListScreen()),
    GetPage(
        name: '/add-contact',
        page: () => const AddContactScreen(),
        transitionDuration: const Duration(milliseconds: 150),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/edit-contact',
        page: () => const EditContactScreen(),
        transitionDuration: const Duration(milliseconds: 150),
        transition: Transition.rightToLeft),
    GetPage(
        name: '/contact-detail',
        page: () => const ContactDetailScreen(),
        transitionDuration: const Duration(milliseconds: 150),
        transition: Transition.rightToLeft),
  ];
}
