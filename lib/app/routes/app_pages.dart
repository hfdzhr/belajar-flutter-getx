import 'package:belajar_getx/app/modules/brand/views/create_brand_view.dart';
import 'package:belajar_getx/app/modules/brand/views/edit_brand_view.dart';
import 'package:belajar_getx/app/modules/brand/views/show_brand_view.dart';
import 'package:get/get.dart';

import '../modules/bottom-menu/bindings/bottom_menu_binding.dart';
import '../modules/bottom-menu/views/bottom_menu_view.dart';
import '../modules/brand/bindings/brand_binding.dart';
import '../modules/brand/views/brand_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_MENU,
      page: () => const BottomMenuView(),
      binding: BottomMenuBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BRAND,
      page: () => BrandView(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: _Paths.TambahBrand,
      page: () => TambahBrandView(),
    ),
    GetPage(
      name: _Paths.EditBrand,
      page: () => EditBrandView(brand: Get.arguments),
    ),
    GetPage(
      name: _Paths.DetailBrand,
      page: () => DetailBrandView(brand: Get.arguments),
    ),
  ];
}
