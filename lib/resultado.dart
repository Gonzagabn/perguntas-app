import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 9) {
      return 'Parabéns! (score < 9)';
    } else if (pontuacao < 21) {
      return 'Você é bom! (8 < score < 21)';
    } else if (pontuacao < 30) {
      return 'Muito bom! (20 < score < 30)';
    } else {
      return 'Excelente! (score = 30)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text('Reiniciar?'),
          style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            textStyle: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ],
    );
  }
}
