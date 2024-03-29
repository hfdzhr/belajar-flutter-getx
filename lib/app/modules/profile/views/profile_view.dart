// profil_view.dart
import 'package:belajar_getx/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final ProfileController profilController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => profilController.logout(),
          ),
        ],
      ),
      body: Obx(
        () => profilController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID: ${profilController.user['id']}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Nama: ${profilController.user['full_name']}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Email: ${profilController.user['email']}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Phone Number: ${profilController.user['phone_number']}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    // SizedBox(height: 8),
                    // Text(
                    //   'Dibuat pada: ${profilController.user['created_at']}',
                    //   style: TextStyle(fontSize: 18),
                    // ),
                    // SizedBox(height: 8),
                    // Text(
                    //   'Diperbarui pada: ${profilController.user['updated_at']}',
                    //   style: TextStyle(fontSize: 18),
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}
