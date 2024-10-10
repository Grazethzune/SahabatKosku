import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sahabatkosku/app/modules/home/controllers/pemilik_Kos/penghuni_controller.dart';

class PenghuniView extends StatelessWidget {
  final PenghuniController controller = Get.put(PenghuniController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Penghuni'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: DefaultTabController(
        length: 2, // Jumlah tab yang tersedia
        child: Column(
          children: [
            // TabBar menggantikan TextButton untuk navigasi tab
            const TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.blue,
              tabs: [
                Tab(text: 'Daftar Penghuni'),
                Tab(text: 'Daftar Booking'),
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Button color
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.schedule, color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Kirim Pesan Tagihan Otomatis',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        // Row untuk mengatur agar icon filter sejajar dengan TextField
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 270,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                fillColor:
                                    const Color.fromARGB(255, 235, 233, 233),
                                filled: true,
                                prefixIcon: const Icon(Icons.search),
                                hintText: 'Nama Penghuni',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            color: Colors.black,
                            icon: const Icon(Icons.filter_alt),
                            onPressed: () => Get.to(()),
                          ),
                        ],
                      ),
                      Obx(() => buildPenghuniList(controller.penghuni)),
                    ],
                  ),
                  // Tab pertama: list Kos yang sedang ditempati

                  // Tab kedua: konten untuk kos yang pernah ditempati
                  const Center(child: Text('Pernah Ditempati Kos List')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPenghuniList(List<Penghuni> penghuniList) {
    return ListView.builder(
      shrinkWrap: true, // Tambahkan ini agar ListView bisa scroll
      itemCount: penghuniList.length,
      itemBuilder: (context, index) {
        var penghuni = penghuniList[index];
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
                    width: 64,
                    height: 100,
                    color: Colors.grey[300],
                    child:
                        const Icon(Icons.image, size: 45, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Nama Penghuni
                        Text(
                          penghuni.nama,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          penghuni.namaKost,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Lokasi
                        Row(
                          children: [
                            Text(
                                'Lantai ${penghuni.lantai} - Ruang ${penghuni.noRuang}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Sisa Bulanan
                        Text(penghuni.bulananSisa),
                        const SizedBox(height: 5),
                        // Status
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Status
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            penghuni.status,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () => Get.to(EditPersonalDataView()),
                            icon: const Icon(
                              Icons.edit,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 44, 243, 33),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Ajukan Sewa",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
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

  Widget buildBookingList(List<Penghuni> kostList) {
    return ListView.builder(
      itemCount: kostList.length,
      itemBuilder: (context, index) {
        var kos = kostList[index];
        return Column(
          children: [
            Row(
              // Row untuk mengatur agar icon filter sejajar dengan TextField
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 305,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      fillColor: const Color.fromARGB(255, 235, 233, 233),
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Nama Penghuni',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                        color: Colors.grey[300],
                        child: const Icon(Icons.image,
                            size: 45, color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nama Penghuni
                            Text(
                              kos.nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              kos.namaKost,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Lokasi
                            Row(
                              children: [
                                Text(
                                    'Lantai ${kos.lantai} - Ruang ${kos.noRuang}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Fasilitas
                            Text(kos.bulananSisa),
                            const SizedBox(height: 5),
                            // Rating dan Status Kamar
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Harga / Bulan
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                kos.status,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 44, 243, 33),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Ajukan Sewa",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class EditPersonalDataView extends StatelessWidget {
  final PenghuniController controller = Get.put(PenghuniController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Penghuni'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildDropdownField(
                      label: 'Nama Kos',
                      hint: 'Pilih kos',
                      items: ['Kos A', 'Kos B'],
                      onChanged: (value) {
                        controller.namaKos.value = value!;
                      }),
                  _buildDropdownField(
                      label: 'Lantai',
                      hint: 'Masukkan lantai',
                      items: ['1', '2'],
                      onChanged: (value) {
                        controller.lantai.value = value!;
                      }),
                  _buildDropdownField(
                      label: 'Kamar',
                      hint: 'Pilih kamar',
                      items: ['101', '102'],
                      onChanged: (value) {
                        controller.noRuang.value = value!;
                      }),
                  _buildDropdownField(
                      label: 'Status Penghuni',
                      hint: 'Pilih status',
                      items: ['Aktif', 'Tidak Aktif'],
                      onChanged: (value) {
                        controller.status.value = value!;
                      }),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required String hint,
      required Function(String) onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(
      {required String label,
      required String hint,
      required List<String> items,
      required Function(String?) onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            hint: Text(hint),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
