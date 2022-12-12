// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../helpers/helper.dart';
import '../helpers/token.dart';

class UpdateAvatarScreen extends StatefulWidget {
  const UpdateAvatarScreen({super.key});

  @override
  State<UpdateAvatarScreen> createState() => _UpdateAvatarScreenState();
}

class _UpdateAvatarScreenState extends State<UpdateAvatarScreen> {
  late Future<XFile?> file;
  late final XFile? tmpFile;
  final ImagePicker _picker = ImagePicker();
  late Widget finalImage;
  void chooseImage() {
    setState(() {
      file = _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 100,
        maxWidth: 100,
        imageQuality: 50,
      );
    });
  }

  Widget showImage() {
    return FutureBuilder<XFile?>(
        future: file,
        builder: (BuildContext context, AsyncSnapshot<XFile?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              null != snapshot.data) {
            tmpFile = snapshot.data;
            finalImage = Column(
              children: [
                Image.file(File(tmpFile!.path)),
                TextButton.icon(
                  onPressed: () {
                    startUpload();
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('save'),
                )
              ],
            );
            return finalImage;
          } else {
            return const Text("no image");
          }
        });
  }

  @override
  void initState() {
    chooseImage();
    super.initState();
  }

  void startUpload() {
    if (tmpFile != null) {
      String filename = tmpFile!.path.split('/').last;
      upload(filename);
    }
  }

  Future<void> upload(String filename) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(Helper.linkUploadavatar));
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "mutipart/form_data",
      "Authorization": "Bearer ${Token.value}",
    };
    request.headers.addAll(headers);
    final imageBytes = await tmpFile?.readAsBytes();
    final compressedImageBytes =
        await FlutterImageCompress.compressWithList(imageBytes!);
    request.files.add(http.MultipartFile.fromBytes('file', compressedImageBytes,
        filename: filename));
    var response = await request.send();
    print(response.statusCode);
    final res = await http.Response.fromStream(response);
    print(res.body);
    // var data = json.decode(res.body);
    if (!mounted) return;
    if (response.statusCode == 200) {
      Helper.getProfile(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Avatar"),
      ),
      body: Column(
        children: [
          TextButton.icon(
            onPressed: chooseImage,
            icon: const Icon(Icons.camera_enhance_rounded),
            label: const Text("Choose image"),
          ),
          showImage(),
        ],
      ),
    );
  }
}
