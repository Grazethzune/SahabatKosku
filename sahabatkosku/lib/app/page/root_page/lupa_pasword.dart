import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahabatkosku/app/modules/home/controllers/login_controller.dart';
import 'package:sahabatkosku/app/page/root_page/login.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.off(LoginScreen()),
        ),
        title: const Text(
          'Lupa Password',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan Nomor telepon yang telah terdaftar dan lakukan verifikasi untuk membuat password baru.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'No. Telepon *',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan Nomor telepon',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Get.off(VerificationMethodScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Pilih metode verifikasi',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationMethodScreen extends StatelessWidget {
  const VerificationMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.off(ForgotPasswordScreen()),
        ),
        title: const Text(
          'Metode Verifikasi',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih metode verifikasi agar kami dapat mengirimkan kode verifikasi.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            VerificationMethodButton(
              icon: Icons.sms,
              label: 'Kirim kode verifikasi via SMS',
              onTap: () => Get.off(VerificationScreen()),
            ),
            const SizedBox(height: 16),
            VerificationMethodButton(
              icon: Icons.phone,
              label: 'Kirim kode verifikasi via WhatsApp',
              onTap: () => Get.off(VerificationScreen()),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationMethodButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const VerificationMethodButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final List<TextEditingController> _codeControllers =
      List.generate(4, (_) => TextEditingController());

  VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi Akun ${controller.selectedTab.value}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Tampilkan dialog konfirmasi
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Apakah Anda yakin ingin kembali?'),
                    content: const Text(
                        'Jika anda kembali, data yang anda masukkan tidak akan tersimpan. Apakah Anda ingin melakukannya?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Kembali ke halaman sebelumnya
                          Get.off(VerificationMethodScreen());
                        },
                        child: const Text('Ya'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Tutup dialog
                          Navigator.pop(context);
                        },
                        child: const Text('Tidak'),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Mohon isi kolom berikut dengan kode verifikasi yang kami kirimkan ke [metode verifikasi] melalui [cara pengiriman]',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _codeControllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Gabungkan nilai dari semua TextEditingController menjadi satu string
                String enteredCode = _codeControllers
                    .map((controller) => controller.text)
                    .join();

                // Logika verifikasi kode
                if (enteredCode == '1234') {
                  // Contoh kode verifikasi yang valid
                  Get.to(UbahPasswordScreen());
                } else {
                  // Tampilkan pesan error jika kode salah
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kode verifikasi salah')),
                  );
                }
              },
              child: const Text('Verifikasi'),
            ),
            // ... bagian lainnya dari Column
            TextButton(
              onPressed: () {
                // Kirim ulang kode verifikasi
                // Ganti dengan logika pengiriman ulang kode Anda
                print('Kode verifikasi dikirim ulang');
              },
              child: const Text('Kirim ulang kode verifikasi'),
            ),
          ],
        ),
      ),
    );
  }
}

class UbahPasswordScreen extends StatefulWidget {
  const UbahPasswordScreen({super.key});

  @override
  _UbahPasswordScreenState createState() => _UbahPasswordScreenState();
}

class _UbahPasswordScreenState extends State<UbahPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Tampilkan dialog konfirmasi
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Apakah Anda yakin ingin kembali?'),
                    content: const Text(
                        'Jika anda kembali, data yang anda masukkan tidak akan tersimpan. Apakah Anda ingin melakukannya?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Kembali ke halaman sebelumnya
                          Get.off(VerificationMethodScreen());
                        },
                        child: const Text('Ya'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Tutup dialog
                          Navigator.pop(context);
                        },
                        child: const Text('Tidak'),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _newPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password Baru',
                  hintText: 'Masukkan password baru',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password baru tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Konfirmasi Password Baru',
                  hintText: 'Masukkan kembali password baru',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Konfirmasi password tidak boleh kosong';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Password tidak sama';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Jika validasi berhasil, lakukan tindakan menyimpan password baru
                    Get.off(LoginScreen());
                    print('Password baru: ${_newPasswordController.text}');
                    // ... tambahkan logika untuk menyimpan password baru ke database atau API Anda,
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
