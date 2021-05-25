import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

main() => runApp(
    PerguntaApp()); // O componente PerguntaApp que foi passado para o runApp é a raiz de toda a arvore de componentes

//A classe PerguntaApp se torna widget porque herdanda as características da classe StateLessWidget
class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Cinza (2)', 'pontuacao': 2},
        {'texto': 'Preto (10)', 'pontuacao': 10},
        {'texto': 'Azul (5)', 'pontuacao': 5},
        {'texto': 'Branco (1)', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Águia (10)', 'pontuacao': 10},
        {'texto': 'Pinguim (2)', 'pontuacao': 2},
        {'texto': 'Tigre (5)', 'pontuacao': 5},
        {'texto': 'Capivara (1)', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é a sua cidade favorita?',
      'respostas': [
        {'texto': 'Campo Grande (10)', 'pontuacao': 10},
        {'texto': 'Itabira (2)', 'pontuacao': 2},
        {'texto': 'Suzano (5)', 'pontuacao': 5},
        {'texto': 'São Paulo (1)', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override //O @override é uma anotação que sobrescreve o método build da classe mãe StateLessWidget
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Perguntas'),
            ),
            body: temPerguntaSelecionada
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    quandoResponder: _responder,
                  )
                : Resultado(
                    _pontuacaoTotal,
                    _reiniciarQuestionario,
                  )));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
