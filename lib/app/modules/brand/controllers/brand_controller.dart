import 'dart:convert';

import 'package:belajar_getx/app/modules/brand/controllers/brand_controller.dart';
import 'package:belajar_getx/app/data/models/brand_model.dart';
import 'package:belajar_getx/app/providers/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:belajar_getx/app/routes/app_pages.dart';
import 'package:belajar_getx/app/modules/brand/views/show_brand_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrandController extends GetxController {
  var brandLists = <Brand>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

// Function Get
  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/brands';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['data'];
        brandLists
            .assignAll(jsonResponse.map((model) => Brand.fromJson(model)));
      } else {
        throw Exception('Failed to load brands');
      }
    } catch (e) {
      print('Error during fetching brand: $e');
    }
  }

// Function Add
  Future<void> tambahBrand(
    String name,
  ) async {
    try {
      if (name.isEmpty) {
        Get.snackbar('Error', 'Brand name must be exists');
        return;
      }

      var apiUrl = '${Api.baseUrl}/brands';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {'name': name},
      );

      if (response.statusCode == 201) {
        Get.snackbar('Succses', 'Brand added');
        fetchData();
        Get.offAndToNamed(Routes.BOTTOM_MENU); // Redirect ke halaman brand
      } else {
        throw Exception('Failed to add brand');
      }
    } catch (e) {
      print('Error during tambah brand: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  Future<void> editBrand(
    Brand brand,
    String name,
  ) async {
    try {
      if (name.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}/brands/${brand.id}';
      var headers = await Api.getHeaders();

      var response = await http.patch(
        Uri.parse(apiUrl),
        headers: headers,
        body: {'name': name},
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'brand berhasil diubah');
        fetchData(); // Refresh the brandList
        Get.offAndToNamed(Routes.BOTTOM_MENU);
      } else {
        throw Exception('Failed to edit brand');
      }
    } catch (e) {
      print('Error during edit brand: $e');
    }
  }

  void showBrandDetails(Brand brand) {
    Get.to(() => DetailBrandView(brand: brand));
  }

  Future<void> deletBrand(Brand brand) async {
    try {
      var apiUrl = '${Api.baseUrl}/brands/${brand.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Brand berhasil dihapus');
        fetchData();
        // Optionally, you can navigate to a different page after deletion
      } else {
        throw Exception('Failed to delete brand');
      }
    } catch (e) {
      print('Error during delete brand: $e');
    }
  }
}
