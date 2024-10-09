import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahabatkosku/app/modules/home/controllers/pencari_Kos/home_controller.dart';

class KostCard extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Kos Saya'),
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
                Tab(text: 'Sekarang'),
                Tab(text: 'Pernah Ditempati'),
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
                  // Tab pertama: list Kos yang sedang ditempati
                  Obx(() => buildKosList(controller.kostList)),
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

  Widget buildKosList(List<KostModel> kostList) {
    return ListView.builder(
      itemCount: controller.kostList.length,
      itemBuilder: (context, index) {
        var kos = kostList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Placeholder untuk gambar
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gender Badge
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(kos.gender),
                        ),
                        SizedBox(height: 5),
                        // Nama Kost
                        Text(
                          kos.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        // Lokasi
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16),
                            SizedBox(width: 5),
                            Text(kos.location),
                          ],
                        ),
                        SizedBox(height: 5),
                        // Fasilitas
                        Text(kos.facilities),
                        SizedBox(height: 5),
                        // Rating dan Status Kamar
                        Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            SizedBox(width: 5),
                            Text('${kos.rating} / 5.0'),
                          ],
                        ),
                        SizedBox(width: 10),
                        Text('Sisa 5 kamar'),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  // Harga / Bulan
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.bookmark_added, size: 24),
                      SizedBox(height: 84),
                      Text(
                        '''${kos.price} 
/ Bulan''',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
