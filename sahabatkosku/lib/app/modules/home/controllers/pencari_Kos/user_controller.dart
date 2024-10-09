import 'package:get/get.dart';

class UserModel {
  String name;
  String role;
  String gender;
  DateTime birthdate;
  String occupation;
  String education;
  String maritalStatus;
  String province;
  String city;

  // Constructor
  UserModel({
    required this.name,
    required this.role,
    required this.gender,
    required this.birthdate,
    required this.occupation,
    required this.education,
    required this.maritalStatus,
    required this.province,
    required this.city,
  });

  // Implementing copyWith method
  UserModel copyWith({
    String? name,
    String? role,
    String? gender,
    DateTime? birthdate,
    String? occupation,
    String? education,
    String? maritalStatus,
    String? province,
    String? city,
  }) {
    return UserModel(
      name: name ??
          this.name, // If name is provided, use it; otherwise use the current name
      role: role ?? this.role,
      gender: gender ?? this.gender,
      birthdate: birthdate ?? this.birthdate,
      occupation: occupation ?? this.occupation,
      education: education ?? this.education,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      province: province ?? this.province,
      city: city ?? this.city,
    );
  }
}

class UserController_PencariKos extends GetxController {
  var name = ''.obs;
  var gender = ''.obs;
  var birthDate = ''.obs;
  var occupation = ''.obs;
  var education = ''.obs;
  var maritalStatus = ''.obs;
  var province = ''.obs;
  var city = ''.obs;

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
        role: 'Pencari Kos',
        gender: 'Laki-laki',
        birthdate: DateTime.now(),
        occupation: 'Mahasiswa',
        education: 'S1',
        maritalStatus: 'Belum Menikah',
        province: 'Jawa Tengah',
        city: 'Semarang',
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
    required String gender,
    required DateTime birthdate,
    required String occupation,
    required String education,
    required String maritalStatus,
    required String province,
    required String city,
  }) {
    userList[0] = UserModel(
      name: name,
      role: userList[0].role, // Keep role as is
      gender: gender,
      birthdate: birthdate,
      occupation: occupation,
      education: education,
      maritalStatus: maritalStatus,
      province: province,
      city: city,
    );
    update();
  }
}
