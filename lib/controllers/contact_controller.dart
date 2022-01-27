import 'package:contact_list/model/contact_model.dart';
import 'package:contact_list/utils/api.dart';
import 'package:contact_list/utils/http_service.dart';
import 'package:contact_list/widget/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class ContactController extends GetxController {
  HttpService httpService = HttpService();
  final searchController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final notesController = TextEditingController().obs;
  final contactList = <Data>[].obs;
  final contactDetail = Data().obs;
  final loading = false.obs;
  final search = ''.obs;
  final listIsEmpty = false.obs;

  final labelType = [
    "Teman kantor",
    "Teman kecil",
    "Teman SMA",
  ];
  final selectedList = <bool>[].obs;
  final selectedLabel = <String>[].obs;
  // List<bool> selectedList = [];
  // List<String> selectedLabel = [];

  @override
  void onInit() {
    httpService.init();
    getListContact();
    super.onInit();
  }

  Future<void> getListContact() async {
    loading(true);
    contactList.clear();

    Map<String, Object> customParams;
    customParams = {'userId': Api.userId};
    if (search.value.isNotEmpty) {
      Map<String, Object> searchParams = {'search': search.value};

      customParams.addAll(searchParams);
    }

    try {
      final result = await httpService.request(
        url: Api.contact,
        method: Method.GET,
        params: customParams,
      );

      if (result != null) {
        if (result is d.Response) {
          final loadedData = ContactModel.fromJson(result.data);
          contactList.addAll(loadedData.data!);
        } else {
          Get.toNamed('/error');
        }
      }
    } finally {
      loading(false);
    }
  }

  void getDetail(Data contact) {
    contactDetail.value = contact;
    Get.toNamed('/contact-detail');
  }

  void setLabel(bool value, int i) {
    if (value) {
      selectedLabel.add(labelType[i]);
    } else {
      selectedLabel.remove(labelType[i]);
    }
    selectedList[i] = value;

    debugPrint("selected  :  $selectedLabel");
  }

  void handleButtonForm() {
    clearTextController();
    Get.toNamed('/add-contact');
  }

  void handleButtonEdit(Data contact) {
    selectedList.clear();
    contactDetail.value = contact;
    nameController.value.text = contact.name!;
    emailController.value.text = contact.email!;
    phoneController.value.text = contact.phoneNumber!;
    notesController.value.text = contact.notes!;
    Get.toNamed('/edit-contact');
  }

  void clearTextController() {
    nameController.value.clear();
    emailController.value.clear();
    phoneController.value.clear();
    notesController.value.clear();
    selectedList.clear();
  }

  void handleAddButtonEdit() async {
    if (nameController.value.text.isEmpty ||
        emailController.value.text.isEmpty ||
        phoneController.value.text.isEmpty ||
        notesController.value.text.isEmpty ||
        selectedLabel.isEmpty) {
      Get.defaultDialog(
          titlePadding: verticalPadding(20),
          title: 'Error !',
          onConfirm: () => Get.back(),
          middleText: 'Silahkan lengkapi form');
    } else {
      Map<String, dynamic> postData = {
        "name": nameController.value.text,
        "email": emailController.value.text,
        "phoneNumber": phoneController.value.text,
        "notes": notesController.value.text,
        "labels": selectedLabel,
        "userId": "13dbfff6-a8e4-4e83-98f2-f96b13bf17a4"
      };
      clearTextController();
      await editContact(postData);
      getListContact();

      Get.back();
    }
  }

  Future editContact(Map<String, dynamic> data) async {
    loading(true);

    try {
      await httpService.request(
          url: Api.contact + '/' + contactDetail.value.contactId!,
          method: Method.PUT,
          params: data);
    } finally {
      loading(false);
    }
  }

  void handleAddButtonSave() async {
    if (nameController.value.text.isEmpty ||
        emailController.value.text.isEmpty ||
        phoneController.value.text.isEmpty ||
        notesController.value.text.isEmpty ||
        selectedLabel.isEmpty) {
      Get.defaultDialog(
          titlePadding: verticalPadding(20),
          title: 'Error !',
          onConfirm: () => Get.back(),
          middleText: 'Silahkan lengkapi form');
    } else {
      Map<String, dynamic> postData = {
        "name": nameController.value.text,
        "email": emailController.value.text,
        "phoneNumber": phoneController.value.text,
        "notes": notesController.value.text,
        "labels": selectedLabel,
        "userId": "13dbfff6-a8e4-4e83-98f2-f96b13bf17a4"
      };
      clearTextController();
      await addContact(postData);
      getListContact();

      Get.back();
    }
  }

  Future addContact(Map<String, dynamic> data) async {
    loading(true);

    try {
      await httpService.request(
          url: Api.contact, method: Method.POST, params: data);
    } finally {
      loading(false);
    }
  }

  Future deleteContact(String idContact) async {
    Map<String, Object> customParams;
    customParams = {'userId': Api.userId};
    try {
      await httpService.request(
        url: Api.contact + '/' + idContact,
        method: Method.DELETE,
        params: customParams,
      );
    } finally {
      int index =
          contactList.indexWhere((element) => element.contactId == idContact);
      contactList.removeAt(index);
    }
  }

  Future<void> callNumber(String phonenumber) async {
    await FlutterPhoneDirectCaller.callNumber(phonenumber);
  }

  @override
  void onClose() {
    nameController.value.dispose();
    emailController.value.dispose();
    phoneController.value.dispose();
    notesController.value.dispose();
    super.onClose();
  }
}
