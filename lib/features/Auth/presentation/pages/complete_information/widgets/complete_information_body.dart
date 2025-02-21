import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/features/Screens/screens.dart';
import 'package:fruits_market/core/widgets/custom_buttons.dart';
import 'package:fruits_market/core/widgets/space_widget.dart';
import 'package:fruits_market/features/Auth/presentation/pages/complete_information/widgets/complete_info_item.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CompleteInformationBody extends StatelessWidget {
  CompleteInformationBody({super.key, required this.userCredential});
  final UserCredential userCredential;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? username;
  String? phone;
  String? address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(children: [
          const VerticalSpace(2),
          CompleteInfoItem(
              label: "Enter Your Name",
              inputType: TextInputType.name,
              onSaved: (val) {
                username = val;
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "username is empty";
                }
                if (!val.contains(RegExp(r'[A-z]'))) {
                  return "incorrect username";
                }
                return null;
              }),
          const VerticalSpace(3),
          CompleteInfoItem(
              label: "Enter Your Phone Number",
              inputType: TextInputType.phone,
              onSaved: (val) {
                phone = val;
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "phone can't be empty";
                }
                if (val.length != 11) {
                  return "incorrect phone number";
                }
                if (val.contains(RegExp(r'[A-z]')) &&
                    val.contains(RegExp(r'[!,@,#,$,%,^,&,*,?]'))) {
                  return "phone number can't contain chracters";
                }
                return null;
              }),
          const VerticalSpace(3),
          CompleteInfoItem(
            label: "Enter Your Address",
            inputType: TextInputType.text,
            maxLines: 4,
            onSaved: (val) {
              address = val;
            },
          ),
          const VerticalSpace(3),
          CustomGeneralButton(
              text: "Login",
              onTap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  FirebaseStorage.instance.ref().child("user_images").child(
                    userCredential.user!.uid
                  );

                  Get.offAll(() => const Screens(),
                      transition: Transition.leftToRightWithFade);
                }
              })
        ]),
      ),
    );
  }
}
