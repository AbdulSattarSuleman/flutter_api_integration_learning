// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? image;
  final _pickerImage = ImagePicker();
  bool showSpinner = false;

  // get Image ffrom gallery
  Future getImage() async {
    final pickedFile = await _pickerImage.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    } else {
      print("No Image Selected");
    }
  }

  //upload image
  Future<void> uploadImage() async {
    setState(() {
      showSpinner = true;
    });

    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = http.MultipartRequest('POST', uri);

    request.fields['title'] = "Sample Title";

    var multiPort = http.MultipartFile(
      'image',
      stream,
      length,
    );

    request.files.add(multiPort);

    var response = await request.send();
    print(response.stream.toString());

    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      print("Upload Image Successfully");
    } else {
      print("Failed");
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Upload Image"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Container(
                  child: image == null
                      ? const Center(
                          child: Text('Please Select Image'),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Image.file(
                              File(image!.path).absolute,
                              // height: 10,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
                  onPressed: () {
                    uploadImage();
                  },
                  child: const Text("Upload"))
            ],
          ),
        ),
      ),
    );
  }
}
