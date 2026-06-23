import 'package:flutter/material.dart';
import 'package:traductor_tseltal/colores/paleta_de_colores.dart';
import 'package:traductor_tseltal/src/vistas/cabecera.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messages = [
      {'content': 'B\'atzi lek me? ¿Cómo estás?', 'isTseltal': true},
      {'content': 'Blen y to como estos?, Lek, q\'e\'et san?', 'isTseltal': false},
      {'content': 'Lek xan, wokoi\' t-at Bien también gracias', 'isTseltal': true},
      {'content': '¡Bonti b\'at ye\'e!, ¡A dónde vas?', 'isTseltal': true},
      {'content': 'Voy a la milpa Bi\'un te c\'slhk', 'isTseltal': false},
      {'content': '¡let ayi! Te k\'an jal jbaths J\'bel c\'met Ao\' nos vemos. Goypnet!', 'isTseltal': true},
    ];

    return Column(
      children: [
        AppHeader(
          title: 'Conversación voz a voz\nK\'opojel',
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildChatBubble(
                  messages[index]['content'] as String,
                  messages[index]['isTseltal'] as bool,
                );
              },
            ),
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
          color: Colors.white,
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
      color: Colors.transparent, // Toma el fondo beige claro general
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Botón completamente centrado
        children: [
          _buildMicrophoneButton(), 
        ],
      ),
    );
  }

  Widget _buildMicrophoneButton() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: kPrimaryColor, // Botón con el verde principal del logo
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: Icon(Icons.mic, color: kTextPrimary, size: 36)),
    );
  }
}