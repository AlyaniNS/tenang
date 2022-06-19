import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String nama;
  final String namaDokter;
  final String tanggal;
  final String keluhan;
  final String jenisKonsul;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(
      this.nama, this.namaDokter, this.tanggal, this.keluhan, this.jenisKonsul,
      {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 19, 42, 76),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(255, 19, 42, 76))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  namaDokter,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 250, 237),
                      fontFamily: 'Poppins'),
                ),
              ),
              Text(
                "$jenisKonsul | $tanggal",
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 250, 237),
                    fontFamily: 'Poppins'),
              ),
              Text(
                "Nama Pasien : $nama",
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 250, 237),
                    fontFamily: 'Poppins'),
              ),
              Text(
                "Keluhan           : $keluhan",
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 250, 237),
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
