import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahabatkosku/app/modules/home/controllers/pencari_Kos/user_controller.dart';
import 'package:sahabatkosku/app/page/root_page/login.dart';

class ProfileView_PencariKos extends StatelessWidget {
  final UserController_PencariKos controller =
      Get.put(UserController_PencariKos());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: 50),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.userList[0].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(controller.userList[0].role,
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () => Get.to(AddPersonalDataView()),
                      icon: Icon(Icons.edit),
                    )
                  ],
                )),
            SizedBox(height: 20),
            TabBarSection(),
          ],
        ),
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: "Data Pribadi"),
              Tab(text: "Lainnya"),
            ],
          ),
          SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                PersonalDataForm(),
                LainnyaTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalDataForm extends StatelessWidget {
  final UserController_PencariKos controller =
      Get.find<UserController_PencariKos>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.userList.isEmpty) {
        return Center(child: Text("No Personal Data Available"));
      }
      var user = controller.userList[0];
      return ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: [
          PersonalDataField(label: "Jenis Kelamin", value: user.gender),
          PersonalDataField(
              label: "Tanggal Lahir", value: user.birthdate.toString()),
          PersonalDataField(label: "Pekerjaan", value: user.occupation),
          PersonalDataField(
              label: "Pendidikan Terakhir", value: user.education),
          PersonalDataField(
              label: "Status Pernikahan", value: user.maritalStatus),
          PersonalDataField(label: "Provinsi", value: user.province),
          PersonalDataField(label: "Kota Asal", value: user.city),
        ],
      );
    });
  }
}

class PersonalDataField extends StatelessWidget {
  final String label;
  final String value;

  PersonalDataField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          SizedBox(height: 4),
          Container(
            height: 30,
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LainnyaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        ListTile(
          leading: Icon(Icons.receipt_long, size: 30),
          title: Text("Riwayat Transaksi"),
          onTap: () {
            // Navigate to transaction history
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.help_outline, size: 30),
          title: Text("Bantuan"),
          onTap: () {
            // Navigate to help section
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout, size: 30),
          title: Text("Keluar dari akun"),
          onTap: () => Get.off(LoginScreen()),
        ),
      ],
    );
  }
}

class AddPersonalDataView extends StatelessWidget {
  final UserController_PencariKos controller =
      Get.put(UserController_PencariKos());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data Pribadi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
                  _buildTextField(
                      label: 'Nama Lengkap',
                      hint: 'Masukkan Nama Lengkap',
                      onChanged: (value) {
                        controller.name.value = value;
                      }),
                  _buildDropdownField(
                      label: 'Jenis Kelamin',
                      hint: 'Pilih Jenis Kelamin',
                      items: ['Laki-laki', 'Perempuan'],
                      onChanged: (value) {
                        controller.gender.value = value!;
                      }),
                  _buildTextField(
                      label: 'Tanggal Lahir',
                      hint: 'Masukkan Tanggal Lahir',
                      onChanged: (value) {
                        controller.birthDate.value = value;
                      }),
                  _buildDropdownField(
                      label: 'Pekerjaan',
                      hint: 'Pilih Pekerjaan',
                      items: ['Mahasiswa', 'Karyawan', 'Wirausaha'],
                      onChanged: (value) {
                        controller.occupation.value = value!;
                      }),
                  _buildDropdownField(
                      label: 'Pendidikan Terakhir',
                      hint: 'Pilih Pendidikan Terakhir',
                      items: ['SMA', 'Diploma', 'Sarjana', 'Magister'],
                      onChanged: (value) {
                        controller.education.value = value!;
                      }),
                  _buildDropdownField(
                      label: 'Status Pernikahan',
                      hint: 'Pilih Status Pernikahan',
                      items: ['Belum Menikah', 'Menikah'],
                      onChanged: (value) {
                        controller.maritalStatus.value = value!;
                      }),
                  _buildTextField(
                      label: 'Provinsi',
                      hint: 'Masukkan Provinsi',
                      onChanged: (value) {
                        controller.province.value = value;
                      }),
                  _buildTextField(
                      label: 'Kota',
                      hint: 'Masukkan Kota Asal',
                      onChanged: (value) {
                        controller.city.value = value;
                      }),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: controller.saveData,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full width button
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Simpan',
                style: TextStyle(fontSize: 18),
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
          Text(label, style: TextStyle(fontSize: 16)),
          SizedBox(height: 4),
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
          Text(label, style: TextStyle(fontSize: 16)),
          SizedBox(height: 4),
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
