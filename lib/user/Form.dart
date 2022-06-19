import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:tenang/user/RiwayatBayar.dart';

class FormKonsul extends StatefulWidget {
  @override
  State<FormKonsul> createState() => _FormKonsulState();
}

class _FormKonsulState extends State<FormKonsul> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController keluhan = TextEditingController();
  final TextEditingController dateinput = TextEditingController();

  String dokter = 'dr. Jiemi Ardian, Sp.KJ';
  String konsul = 'Online (Telemedicine)';

  var daftarDokter = [
    'dr. Jiemi Ardian, Sp.KJ',
    'dr. Chandra Irawan, Sp.KJ',
    'dr. Irna Permanasari Gani, Sp.KJ',
    'dr. Endah Ronawulan, Sp.KJ',
  ];

  var jenisKonsul = ['Online (Telemedicine)', 'Offline (Datang ke Klinik)'];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference konsultasi = firestore.collection("konsultasi");

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
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, left: 15),
                child: Text(
                  "Form Konsultasi",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: "Poppins",
                    color: Color.fromARGB(255, 19, 42, 76),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 19, 42, 76),
                ),
                controller: nama,
                decoration: InputDecoration(
                    labelText: "Nama",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 19, 42, 76),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 19, 42, 76),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              SizedBox(height: 10),
              TextFormField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 19, 42, 76),
                ),
                controller: dateinput, //editing controller of this TextField
                decoration: InputDecoration(
                    labelText: "Tanggal Konsultasi",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 19, 42, 76),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 19, 42, 76),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    )),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              SizedBox(height: 10),
              DropdownButton(
                  dropdownColor: Color.fromARGB(255, 255, 250, 237),
                  value: konsul,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color.fromARGB(255, 19, 42, 76),
                  ),
                  items: jenisKonsul.map((String jenisKonsul) {
                    return DropdownMenuItem(
                      child: Text(
                        jenisKonsul,
                        style:
                            TextStyle(color: Color.fromARGB(255, 19, 42, 76)),
                      ),
                      value: jenisKonsul,
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      konsul = newValue!;
                    });
                  }),
              SizedBox(height: 10),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: DropdownButton(
                      isExpanded: true,
                      hint: Text("Dokter"),
                      borderRadius: BorderRadius.circular(15),
                      dropdownColor: Color.fromARGB(255, 255, 250, 237),
                      value: dokter,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromARGB(255, 19, 42, 76),
                      ),
                      items: daftarDokter.map((String daftarDokter) {
                        return DropdownMenuItem(
                          child: Text(
                            daftarDokter,
                            style: TextStyle(
                                color: Color.fromARGB(255, 19, 42, 76)),
                          ),
                          value: daftarDokter,
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dokter = newValue!;
                        });
                      }),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 19, 42, 76),
                ),
                controller: keluhan,
                decoration: InputDecoration(
                    labelText: "Keluhan",
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 19, 42, 76),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Color.fromARGB(255, 19, 42, 76),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Berhasil Terdaftar!'),
              content: const Text('Silahkan Upload Bukti Pembayaran'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RiwayatBayar()));
                    }),
              ],
            ),
          );
          konsultasi.add({
            'nama': nama.text,
            'tanggal': dateinput.text,
            'namaDokter': dokter,
            'jenisKonsul': konsul,
            'keluhan': keluhan.text,
          });

          nama.text = '';
          keluhan.text = '';
          dateinput.text = '';
        },
        label: Text("Tambah"),
        backgroundColor: Color.fromARGB(255, 19, 42, 76),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
