import 'package:get/get.dart';

class NavigationController extends GetxController {
  // Índice de la pestaña activa (0: Traducir, 1: Cámara, 2: Conversar...)
  var currentTabIndex = 0.obs;

  // Método para cambiar de pestaña
  void changeTab(int index) {
    currentTabIndex.value = index;
  }
}