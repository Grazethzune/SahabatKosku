import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahabatkosku/app/modules/home/controllers/pemilik_Kos/statistik_controller.dart';

// Model Transaksi

// View
class StatistikView extends StatelessWidget {
  final StatistikController controller = Get.put(StatistikController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Statisik'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: DefaultTabController(
        length: 2, // Jumlah tab yang tersedia
        child: Column(
          children: [
            // TabBar menggantikan TextButton untuk navigasi tab
            TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: 'Keuangan'),
                Tab(text: 'Okupansi'),
              ],
            ),
            Divider(
              height: 1,
              thickness: 2,
              color: Colors.grey[300],
            ),
            // Menggunakan TabBarView untuk konten dari tiap tab
            Expanded(
              child: TabBarView(
                children: [
                  Obx(() => buildKeuanganList(controller.transaksiList)),

                  // Tab pertama: list Kos yang sedang ditempati

                  // Tab kedua: konten untuk kos yang pernah ditempati
                  Center(child: Text('Pernah Ditempati Kos List')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildKeuanganList(List<Transaksi> kostList) {
    return ListView.builder(
      itemCount: kostList.length,
      itemBuilder: (context, index) {
        var kos = kostList[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Placeholder untuk gambar
                      Container(
                        width: 64,
                        height: 100,
                        child: Icon(
                            (kos.isPemasukan == true
                                ? Icons.arrow_upward
                                : Icons.arrow_downward),
                            size: 45,
                            color: kos.isPemasukan == true
                                ? Colors.green
                                : Colors.red),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nama Penghuni
                            Text(
                              kos.namaBarang,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '${kos.tanggal}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Lokasi
                            // Fasilitas
                            // Rating dan Status Kamar
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Get.to(()),
                                icon: Icon(
                                  Icons.edit,
                                ),
                              ),
                              IconButton(
                                onPressed: () => Get.to(()),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            (kos.isPemasukan == true
                                ? ' + Rp ${kos.jumlah}'
                                : ' - Rp ${kos.jumlah}'),
                            style: TextStyle(
                                color: (kos.isPemasukan == true
                                    ? Colors.green
                                    : Colors.red)),
                          ),
                        ],
                      )
                      // Harga / Bulan
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
