// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Konselor extends StatefulWidget {
  const Konselor({Key? key}) : super(key: key);

  @override
  _KonselorState createState() => _KonselorState();
}

class _KonselorState extends State<Konselor> {
  // text fields' controllers
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _spesialisasiController = TextEditingController();

  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('konselor');

  // This function is triggered when the floatting button or one of the edit buttons is pressed
  // Adding a product if no documentSnapshot is passed
  // If documentSnapshot != null then update an existing product
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _namaController.text = documentSnapshot['nama'];
      _spesialisasiController.text = documentSnapshot['spesialisasi'];
    }

    await showModalBottomSheet(
        backgroundColor: Color.fromARGB(255, 255, 250, 237),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: _spesialisasiController,
                  decoration: const InputDecoration(
                    labelText: 'Spesialisasi',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? nama = _namaController.text;
                    final String? spesialisasi = _spesialisasiController.text;
                    if (nama != null && spesialisasi != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _productss
                            .add({"nama": nama, "spesialisasi": spesialisasi});
                      }

                      if (action == 'update') {
                        // Update the product
                        await _productss.doc(documentSnapshot!.id).update(
                            {"nama": nama, "spesialisasi": spesialisasi});
                      }

                      // Clear the text fields
                      _namaController.text = '';
                      _spesialisasiController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a product by id
  Future<void> _deleteProduct(String productId) async {
    await _productss.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data konselor berhasil dihapus')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 237),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 19, 42, 76),
          centerTitle: true,
          title: Image.asset(
            "assets/images/logo(krem).png",
            height: 80,
            fit: BoxFit.fitHeight,
          )),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder<QuerySnapshot>(
        stream: _productss.snapshots(),
        builder: (context, streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView(
              children: streamSnapshot.data!.docs
                  .map(
                    (e) => Text(e.get("nama")),
                  )
                  .toList(),
            );
            // return ListView.builder(
            //   itemCount: streamSnapshot.data!.docs.length,
            //   itemBuilder: (context, index) {
            //     final documentSnapshot = streamSnapshot.data!.docs[index];
            //     return Card(
            //       margin: const EdgeInsets.all(10),
            //       child: ListTile(
            //         tileColor: Color.fromARGB(255, 255, 250, 237),
            //         title: Text(documentSnapshot['nama']),
            //         subtitle: Text(documentSnapshot['spesialisasi']),
            //         trailing: SizedBox(
            //           width: 100,
            //           child: Row(
            //             children: [
            //               // Press this button to edit a single product
            //               IconButton(
            //                   icon: const Icon(Icons.edit),
            //                   onPressed: () =>
            //                       _createOrUpdate(documentSnapshot)),
            //               // This icon button is used to delete a single product
            //               IconButton(
            //                   icon: const Icon(Icons.delete),
            //                   onPressed: () =>
            //                       _deleteProduct(documentSnapshot.id)),
            //             ],
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Add new product
      floatingActionButton: FloatingActionButton(
          onPressed: () => _createOrUpdate(),
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 255, 250, 237),
          ),
          backgroundColor: Color.fromARGB(255, 19, 42, 76)),
    );
  }
}
