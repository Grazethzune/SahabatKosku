import 'package:get/get.dart';

class UserModel {
  String name;
  String role;
  String no_telp;
  String email;

  // Constructor
  UserModel({
    required this.name,
    required this.role,
    required this.no_telp,
    required this.email,
  });

  // Implementing copyWith method
  UserModel copyWith({
    String? name,
    String? role,
    String? no_telp,
    String? email,
  }) {
    return UserModel(
      name: name ??
          this.name, // If name is provided, use it; otherwise use the current name
      role: role ?? this.role,
      no_telp: no_telp ?? this.no_telp,
      email: email ?? this.email,
    );
  }
}

class UserController_PemilikKos extends GetxController {
  var name = ''.obs;
  var no_telp = ''.obs;
  var email = ''.obs;

  void saveData() {
    // Add your data saving logic here
    Get.snackbar("Success", "Data has been saved",
        snackPosition: SnackPosition.BOTTOM);
  }

  var userList = <UserModel>[].obs;
  void fetchUser() {
    var user = [
      UserModel(
        name: 'John Doe',
        role: 'Pemilik Kos',
        no_telp: '081234567890',
        email: 'example@gamil.com',
      )
      // Tambahkan data kost lainnya
    ];
    userList.value = user;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void updateUser({
    required String name,
    required String no_telp,
    required String email,
  }) {
    userList[0] = UserModel(
      name: name,
      role: userList[0].role, // Keep role as is
      no_telp: no_telp,
      email: email,
    );
    update();
  }
}
