import 'package:flutter/material.dart';
import 'package:traductor_tseltal/colores/paleta_de_colores.dart';

class AppHeader extends StatelessWidget {
  final String title;

  AppHeader({this.title = ''});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false, // Solo protegemos la parte superior (la barra de estado)
      child: Container(
        height: 70,
        color: kPrimaryColor, // El verde de las hojas de tu logo
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kTextPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}