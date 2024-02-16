// pasien_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:belajar_getx/app/data/models/brand_model.dart';
import 'edit_brand_view.dart';
import 'show_brand_view.dart';
import 'package:belajar_getx/app/modules/brand/controllers/brand_controller.dart';

class BrandView extends StatelessWidget {
  final BrandController controller = Get.put(BrandController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Brand'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/tambah-brand');
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.brandLists.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.brandLists.length,
                itemBuilder: (context, index) {
                  var brand = controller.brandLists[index];

                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(brand.name),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Get.to(() => EditBrandView(brand: brand));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            Get.to(() => DetailBrandView(brand: brand));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // Show a confirmation dialog before deleting
                            showDeleteConfirmation(context, brand);
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      // Pass the 'isEditable' flag to indicate whether it's for editing or viewing // Set to false for 'Lihat Detail'
                      controller.showBrandDetails(brand);
                    },
                  );
                },
              ),
      ),
    );
  }

  void showDeleteConfirmation(BuildContext context, Brand brand) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Brand'),
          content: Text('Are you sure you want to delete ${brand.name}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the deletePasien method from the controller
                controller.deletBrand(brand);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
