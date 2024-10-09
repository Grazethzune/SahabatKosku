import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahabatkosku/app/modules/home/controllers/pencari_Kos/filter_controller.dart';

class FilterPage extends StatelessWidget {
  final FilterController controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                bottom: 100.0), // Add padding at bottom for button space
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Adjust the size to content
                children: [
                  Text('Kos untuk?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      genderButton('Laki-laki', Icons.male),
                      genderButton('Perempuan', Icons.female),
                      genderButton('Campur', Icons.transgender),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Berapa Orang?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Minimal',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Maksimal',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Pembayaran Kos Tiap?',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      paymentOption('Mingguan'),
                      paymentOption('Bulanan'),
                      paymentOption('Tahunan'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                      'Harga                                                             Mulai dari',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Minimal',
                            border: OutlineInputBorder(),
                            prefixText: 'Rp',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Maksimal',
                            border: OutlineInputBorder(),
                            prefixText: 'Rp',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      DropdownButton<String>(
                        value: 'Minimal',
                        items:
                            <String>['Minimal', 'Maksimal'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0, // Sticky at the bottom
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white, // Optional, to ensure the button stands out
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.resetFilters();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 142, vertical: 15),
                ),
                child: Text('Reset Ulang'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget genderButton(String gender, IconData icon) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          controller.selectedGender.value = gender;
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: controller.selectedGender.value == gender
                  ? Colors.blue
                  : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Icon(icon),
              SizedBox(height: 5),
              Text(gender),
            ],
          ),
        ),
      );
    });
  }

  Widget paymentOption(String option) {
    return Obx(() {
      return RadioListTile(
        value: option,
        groupValue: controller.paymentOption.value,
        onChanged: (value) {
          controller.paymentOption.value = value.toString();
        },
        title: Text(option),
      );
    });
  }
}
