// edit_brand_view.dart
import 'package:belajar_getx/app/data/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/modules/brand/controllers/brand_controller.dart';

class EditBrandView extends StatelessWidget {
  final Brand brand;
  final BrandController controller = Get.find();
  final TextEditingController nameController = TextEditingController();

  EditBrandView({required this.brand}) {
    nameController.text = brand.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Brand'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  // Always call the editBrand method without any conditional checks
                  controller.editBrand(brand, nameController.text);
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}
