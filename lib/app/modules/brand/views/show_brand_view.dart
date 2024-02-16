// detail_pasien_view.dart
import 'package:flutter/material.dart';
import 'package:belajar_getx/app/data/models/brand_model.dart';

class DetailBrandView extends StatelessWidget {
  final Brand brand;

  DetailBrandView({required this.brand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Brand'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Id: ${brand.id}'),
            Text('Nama: ${brand.name}'),
          ],
        ),
      ),
    );
  }
}
