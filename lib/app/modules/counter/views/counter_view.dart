import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends StatelessWidget {
  CounterView({Key? key}) : super(key: key);
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(
            'Count : ${controller.count}',
            style: TextStyle(fontSize: controller.count.toDouble()),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (controller.count > 0) {
                controller.decrement();
              } else {
                Get.snackbar('Peringatan', 'Nilai Minimum 0',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.deepOrange,
                    colorText: Colors.white,
                    icon: const Icon(Icons.warning));
              }
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              if (controller.count < 100) {
                controller.increment();
              } else {
                Get.snackbar('Peringatan', 'Nilai Maksimal (100)',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.deepOrange,
                    colorText: Colors.white,
                    icon: const Icon(Icons.warning));
              }
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
