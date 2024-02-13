import 'package:get/get.dart';

class BottomMenuController extends GetxController {
  //TODO: Implement BottomMenuController

  final currentIndex = 0.obs;
  @override
  void changePage(int index) {
    currentIndex.value = index;
  }
}
