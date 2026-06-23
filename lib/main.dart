import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traductor_tseltal/colores/paleta_de_colores.dart';
import 'package:traductor_tseltal/src/vistas/vista_principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Usamos GetMaterialApp para la gestión MVC
      title: 'Traductor Tseltal',
      theme: ThemeData(
        fontFamily: 'Roboto', // O la fuente que prefieras
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kLightColor,
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}