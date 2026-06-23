import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traductor_tseltal/colores/paleta_de_colores.dart';
import 'package:traductor_tseltal/src/controladores/conversacion_controller.dart';
import 'package:traductor_tseltal/src/vistas/cabecera.dart';

class ChatView extends StatelessWidget {
  final ConversacionController controller = Get.put(ConversacionController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeader(title: 'Conversación Médica\nK\'opojel'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Obx(() => ListView.builder(
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                return _buildChatBubble(
                  controller.messages[index]['content'] as String,
                  controller.messages[index]['isTseltal'] as bool,
                );
              },
            )),
          ),
        ),
        _buildVoiceControlArea(),
      ],
    );
  }

  Widget _buildChatBubble(String content, bool isTseltal) {
    return Align(
      alignment: isTseltal ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isTseltal ? Colors.white : kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Text(content, style: TextStyle(color: kTextDark, fontSize: 14)),
      ),
    );
  }

  Widget _buildVoiceControlArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: controller.toggleListening,
            child: Obx(() => Container(
              height: controller.isListening.value ? 90 : 80,
              width: controller.isListening.value ? 90 : 80,
              decoration: BoxDecoration(
                // Cambia de color a magenta cuando está escuchando
                color: controller.isListening.value ? kAccentColor : kPrimaryColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
                ],
              ),
              child: Center(
                child: Icon(
                  controller.isListening.value ? Icons.graphic_eq : Icons.mic, 
                  color: kTextPrimary, 
                  size: 36
                )
              ),
            )),
          ),
        ],
      ),
    );
  }
}