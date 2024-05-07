

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_clinic/core/helpers/spacing.dart';
import 'package:e_clinic/core/network/api_service.dart';
import 'package:e_clinic/src/edit_profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../core/network/dio_factory.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(profileImage==null? 'ffff' : profileImage!.path),
            verticalSpace(30),

            MaterialButton(
                child: const Text('get image'),
                onPressed: (){
                  pickProfileImage();
                }),

            verticalSpace(30),

            MaterialButton(
                child: const Text('upload'),
                onPressed: ()async {
                  String token= '11|vD4wTUF6sIcjrZHaee0rXzMYzw2pIZ3sHRbzPDrG40740121';
                  Dio dio= DioFactory.getDio();
                  ApiService apiServ= ApiService(dio);
                  EditProfileRepo editRepo= EditProfileRepo(apiServ);

                  var formData = FormData.fromMap({
                    'image': [MultipartFile.fromFileSync(profileImage!.path, filename: profileImage!.path)],
                  });

                  editRepo.uploadImage(token, formData);
                }),
          ],
        ),
      ),
    );
  }


  File? profileImage;
  var picker = ImagePicker();

  void pickProfileImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      setState(() {

      });
    }
  }

}

class CustomFormData extends FormData {
  final Map<String, dynamic> data;

  CustomFormData(this.data);

  @override
  Map<String, dynamic> toJson() {
    return data;
  }
}
