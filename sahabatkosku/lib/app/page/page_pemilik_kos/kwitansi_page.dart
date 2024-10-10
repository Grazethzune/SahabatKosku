import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahabatkosku/app/modules/home/controllers/pemilik_Kos/penghuni_controller.dart';

// Model Transaksi

// View
class KwitansiView extends StatelessWidget {
  final PenghuniController controller = Get.put(PenghuniController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Statisik'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nama Kos'),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    fillColor: const Color.fromARGB(255, 235, 233, 233),
                    filled: true,
                    prefixIcon: const Icon(Icons.home),
                    hintText: 'Pilih Kos',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Tanggal Transaksi'),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    fillColor: const Color.fromARGB(255, 235, 233, 233),
                    filled: true,
                    prefixIcon: const Icon(Icons.calendar_month),
                    hintText: 'Tanggal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 215, 215, 215),
                    // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Semua',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.paid, color: Colors.black),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Lunas',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.paid, color: Colors.black),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Belum Lunas',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: buildPenghuniList(controller.penghuni)),
        ],
      ),
    );
  }

  Widget buildPenghuniList(List<Penghuni> kostList) {
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
                                onPressed: () => Get.to(()),
                                icon: const Icon(
                                  Icons.edit,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(kos.bulananSisa),
                                  const SizedBox(height: 10),
                                  const Text('2022-03-09')
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
