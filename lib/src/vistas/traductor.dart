import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traductor_tseltal/colores/paleta_de_colores.dart';
import 'package:traductor_tseltal/src/controladores/traductor_controller.dart';
import 'package:traductor_tseltal/src/vistas/cabecera.dart';

class TranslationView extends StatelessWidget {
  final TraductorController controller = Get.put(TraductorController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(title: 'Traductor de Texto'),
        Expanded(
          // LayoutBuilder nos permite conocer el tamaño disponible en la pantalla
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  // Forzamos a que el contenido mínimo sea del alto de la pantalla restante
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(() => Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical absoluto
                      children: [
                        _buildInputBox(
                          title: controller.isTseltalToSpanish.value ? 'Tseltal' : 'Español',
                        ),
                        SizedBox(height: 16),
                        _buildLanguageSwitcher(),
                        SizedBox(height: 16),
                        _buildResultBox(
                          title: controller.isTseltalToSpanish.value ? 'Español' : 'Tseltal',
                        ),
                      ],
                    )),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInputBox({required String title}) {
    return Container(
      width: double.infinity, // Asegura que ocupe todo el ancho
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kAccentColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            controller: TextEditingController.fromValue(
              TextEditingValue(
                text: controller.sourceText.value,
                selection: TextSelection.collapsed(offset: controller.sourceText.value.length),
              ),
            ),
            onChanged: (text) => controller.translateText(text),
            maxLines: 4,
            minLines: 2,
            decoration: InputDecoration(
              hintText: 'Ingresa el texto aquí...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey.shade400),
            ),
            style: TextStyle(color: kTextDark, fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildActionIcon(Icons.mic_outlined, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResultBox({required String title}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kAccentColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 12),
          controller.isLoading.value
              ? Center(child: CircularProgressIndicator(color: kPrimaryColor))
              : Text(
                  controller.translatedText.value.isEmpty
                      ? 'La traducción aparecerá aquí...'
                      : controller.translatedText.value,
                  style: TextStyle(
                    color: controller.translatedText.value.isEmpty ? Colors.grey.shade400 : kTextDark, 
                    fontSize: 16
                  ),
                ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Condición: Aparece solo si es Español a Tseltal y hay texto
              if (!controller.isTseltalToSpanish.value && controller.translatedText.value.isNotEmpty) ...[
                _buildActionIcon(Icons.lightbulb_outline, onTap: controller.showGrammarExplanation),
                SizedBox(width: 8),
              ],
              _buildActionIcon(Icons.volume_up, onTap: () {}),
              SizedBox(width: 8),
              _buildActionIcon(Icons.content_copy_outlined, onTap: controller.copyToClipboard),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kAccentColor.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: kAccentColor, size: 20),
      ),
    );
  }

  Widget _buildLanguageSwitcher() {
    return GestureDetector(
      onTap: controller.swapLanguages,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              controller.isTseltalToSpanish.value ? 'Tseltal' : 'Español',
              style: TextStyle(color: kTextPrimary, fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 16),
            Icon(Icons.swap_horiz, color: kTextPrimary, size: 20),
            SizedBox(width: 16),
            Text(
              controller.isTseltalToSpanish.value ? 'Español' : 'Tseltal',
              style: TextStyle(color: kTextPrimary, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}