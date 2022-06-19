// ignore_for_file: use_key_in_widget_ructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

class RiwayatBayar extends StatefulWidget {
  @override
  State<RiwayatBayar> createState() => _RiwayatBayarState();
}

class _RiwayatBayarState extends State<RiwayatBayar> {
  FirebaseStorage storage = FirebaseStorage.instance;

  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
              imageFile,
            );

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'user',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 19, 42, 76),
          centerTitle: true,
          title: Image.asset(
            "assets/images/logo(krem).png",
            height: 80,
            fit: BoxFit.fitHeight,
          )),
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 15),
              child: Text(
                "Riwayat Pembayaran",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: "Poppins",
                  color: Color.fromARGB(255, 19, 42, 76),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 19, 42, 76),
                    ),
                    onPressed: () => _upload('camera'),
                    icon: Icon(
                      Icons.camera,
                      color: Color.fromARGB(255, 255, 250, 237),
                    ),
                    label: Text('Kamera',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 255, 250, 237),
                        ))),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 19, 42, 76),
                    ),
                    onPressed: () => _upload('gallery'),
                    icon: Icon(
                      Icons.library_add,
                      color: Color.fromARGB(255, 255, 250, 237),
                    ),
                    label: Text('Galeri',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color.fromARGB(255, 255, 250, 237),
                        ))),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: _loadImages(),
                builder: (context,
                    AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                            snapshot.data![index];

                        return Card(
                          color: Color.fromARGB(255, 19, 42, 76),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            dense: false,
                            leading: Image.network(image['url']),
                            title: Text(image['uploaded_by'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 250, 237),
                                    fontFamily: 'Poppins')),
                            subtitle: Text(image['description'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 250, 237),
                                    fontFamily: 'Poppins')),
                          ),
                        );
                      },
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
