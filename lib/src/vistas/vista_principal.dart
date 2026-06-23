import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traductor_tseltal/colores/paleta_de_colores.dart';
import 'package:traductor_tseltal/src/controladores/navegacion_controller.dart';
import 'package:traductor_tseltal/src/vistas/conversacion.dart';
import 'package:traductor_tseltal/src/vistas/traductor.dart';
import 'package:traductor_tseltal/src/vistas/traductor_camera.dart';

class MainScreen extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

  // Solo se mantienen los 3 módulos solicitados
  final List<Widget> pages = [
    TranslationView(),
    CameraView(),
    ChatView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor, 
      body: Stack(
        children: [
          Container(
            color: kLightColor,
            width: double.infinity,
            height: double.infinity,
          ),
          Obx(() => IndexedStack(
            index: navController.currentTabIndex.value,
            children: pages,
          )),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => BottomNavigationBar(
      backgroundColor: kWineColor, // Aplicando el color vino a la barra de navegación
      selectedItemColor: kYellowAccent, // Resalte con el amarillo del logo
      unselectedItemColor: kIconInactive,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      type: BottomNavigationBarType.fixed, 
      currentIndex: navController.currentTabIndex.value,
      onTap: (index) => navController.changeTab(index),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.translate), label: 'Traducir'),
        BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: 'Cámara'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Conversar'),
      ],
    ));
  }
}