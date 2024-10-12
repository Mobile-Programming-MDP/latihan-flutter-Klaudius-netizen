import 'package:flutter/material.dart';

class GaleriFoto extends StatelessWidget {
  const GaleriFoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: Container(
          color: Colors.blue,
          child: const Center(
            child: Text(
              "Galeri Foto",
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Image.network(
            "https://picsum.photos/id/64/300/200",
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          const Text(
            "Wanita Di Barcelona",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const Divider(color: Colors.grey),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.add_location_alt_rounded,
                color: Colors.red,
              ),
              Text("Lokasi: Barcelona, spanyol"),
              Icon(
                Icons.date_range_sharp,
                color: Colors.blue,
              ),
              Text("Lokasi: Barcelona, spanyol")
            ],
          ),
          const Divider(color: Colors.grey),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deskripsi",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Sebuah Wanita Di Barcelona, Spanyol. Foto ini menampilkan muka seorang wanita cantik yang menawan.",
                style: TextStyle(fontSize: 24),
              ),
            ],
          )
        ],
      ),
    );
  }
}
