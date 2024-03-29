

//@dart=2.9

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/Anotacao.dart';

class AnotacaoHelper {
  static final String nomeTabela = 'anotacao';
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database _db;

  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal(){

  }

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }

    _onCreate( Database db, int version) async{
      /*
      id titulo descricao data
      01 teste teste      02/10/2020
      */

      String sql = "Create Table $nomeTabela "
          "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
          " titulo VARCHAR,"
          " descricao TEXT,"
          " data DATETIME )";
      await db.execute(sql);
    }



  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco_minhas_anotacoes.db");

    var db = await openDatabase(localBancoDados, version: 1, onCreate:  _onCreate );
    return db;
  }
  Future<int> salvarAnotacao(Anotacao anotacao) async{
    var bancoDados = await db;



  int resultado = await bancoDados.insert(nomeTabela, anotacao.tomap());
  return resultado;


  }
  recuperarAnotacoes() async{
    var bancoDados = await db;
    String sql = 'SELECT * FROM $nomeTabela ORDER BY data DESC'; // poder ser ordenado por qualquer cois, não só a data
    List anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;



  }
}