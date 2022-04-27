import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class jogo extends StatefulWidget {
  const jogo({Key? key}) : super(key: key);

  @override
  _jogoState createState() => _jogoState();
}

class _jogoState extends State<jogo> {
  var _imagemApp = AssetImage("imagens/mao.png",);
  var _mensagem = "escolha uma opção a baixo";

  void _opcaoSelecionada(String escolhaUsuario){

   var opcoes = ["pedra","papel","tesoura"];
   var numero= Random().nextInt(3);
   var escolhaApp = opcoes[numero];
print("escolha do App: "+ escolhaApp);
print("escolha do usuario: " + escolhaUsuario);

switch(escolhaApp){
  case "pedra":
    setState(() {
      this._imagemApp = AssetImage("imagens/pedra.png",);
    });
    break;
  case "papel":
    setState(() {
      this._imagemApp = AssetImage("imagens/papel.png",);
    });
    break;
  case "tesoura":
    setState(() {
      this._imagemApp = AssetImage("imagens/tesoura.png",);
    });
    break;
}
if (
(escolhaUsuario=="pedra" && escolhaApp == "tesoura")||
    (escolhaUsuario == "tesoura" && escolhaApp == "papel")||
    (escolhaUsuario == "papel" && escolhaApp == "pedra")

){
  setState(() {
    this._mensagem = "Parabens ! voçê ganhou :";
  });
//app ganhador
}else if (
    (escolhaApp=="pedra" && escolhaUsuario == "tesoura")||
    (escolhaApp=="tesoura" && escolhaUsuario == "papel")||
    (escolhaApp=="papel" && escolhaUsuario == "pedra")
){
  setState(() {
    this._mensagem = "Você perdeu :";
  });

}else {
  setState(() {
    this._mensagem = "Empate :";
  });
}


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("jokenpo" ),
        centerTitle: true,
        backgroundColor: Colors.red,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("imagens/jkp.png",height: 150,  ),
          Padding(
              padding: EdgeInsets.only(top: 1, bottom: 16),
          child: Text("escolha do App",
            textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple

          ),
          ),
          ),
          //Image.asset("imagens/mao.png",height: 150,),
          Image(image: this._imagemApp,),

          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 20),
            child: Text( this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple

              ),
            ),
          ),
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap:() => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100, ) ,
              ),
              GestureDetector(
                  onTap:() => _opcaoSelecionada("papel"),
                  child:Image.asset("imagens/papel.png", height: 100,)
              ),
              GestureDetector(
                  onTap:() => _opcaoSelecionada("tesoura"),
                  child:Image.asset("imagens/tesoura.png",height: 100,)
              ),
              /*
              Image.asset("imagens/pedra.png", height: 100,),
              Image.asset("imagens/papel.png", height: 100,),
              Image.asset("imagens/tesoura.png",height: 100,),
               */


            ],
          )
        ],
      ),

    );
  }
}
