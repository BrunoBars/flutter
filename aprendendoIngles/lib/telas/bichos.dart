//@dart=2.9
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class bichos extends StatefulWidget {
  const bichos({Key key}) : super(key: key);

  @override
  State<bichos> createState() => _bichosState();
}

class _bichosState extends State<bichos> {

  AudioCache _audioCache= AudioCache(prefix: 'assets/audios/');

  _executar(String nomeAudio){
    _audioCache.play( nomeAudio +'.mp3');
  }

  @override
  void initState() {
    super.initState();
    _audioCache.loadAll([
      "cao.mp3", 'gato.mp3', 'leao.mp3', 'macaco.mp3',
      'ovelha.mp3', 'vaca.mp3',
    ]);
  }

  @override
  Widget build(BuildContext context) {

    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.width;



    return GridView.count(
        
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio *2,
        children:[
              GestureDetector(
        onTap: (){
          _executar('cao');
        },
    child: Image.asset("assets/imagens/cao.png"),

    ),
    GestureDetector(
    onTap: (){
      _executar('gato');

    },
    child: Image.asset("assets/imagens/gato.png"),

    ),
    GestureDetector(
    onTap: (){
      _executar('leao');

    },
    child: Image.asset("assets/imagens/leao.png"),

    ),
    GestureDetector(
    onTap: (){
      _executar('macaco');

    },
    child: Image.asset("assets/imagens/macaco.png"),

    ),
    GestureDetector(
    onTap: (){
      _executar('ovelha');

    },
    child: Image.asset("assets/imagens/ovelha.png"),

    ),
    GestureDetector(
    onTap: (){
      _executar('vaca');

    },
    child: Image.asset("assets/imagens/vaca.png"),

    ),

      ],
    );
  }
}
