import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final int version = 1;
  Database? db;

  static final DbHelper _dbHelper = DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database?> openDb() async {
    if (db == null) {
      db = await openDatabase(
          join(await getDatabasesPath(), 'agendamentosserv.db'),
          onCreate: (database, version) {
        database.execute('''
            CREATE TABLE agendamentos (
              id INTEGER PRIMARY KEY,
              nomeCliente TEXT,
              sobrenomeCliente TEXT
            )
          ''');

      }, version: version);

      return db;
    } else {
      return db;
    }
  }

  // método responsável por testar se a conexão com o banco de dados foi criada corretamente
  // verificar se podemos fazer a inserção com o inser e com o sql padrão
  Future testDb() async {
    db = await openDb();


    /* 
      a cada execução do seu applicativo, o código acima tentava inserir um classificação com id 0, isso não é possivel
      pois, não pode-se repetir chave primaria no banco durante a inserção
      o autoincrement na criação da tabela ajuda a resolver isso, e também, o conflict algorithm, que vai atualizar as infos no banco ao invés
      de inseri-las novamente
    */
    db!.delete('agendamentos'); // pra evitar que o banco fique com lixo
    //db!.delete('conselho'); // pra evitar que o banco fique com lixo
    db!.insert('agendamentos',
        {'id': 1, 'nomeCliente': "João", 'sobrenomeCliente': "teste"},
        conflictAlgorithm: ConflictAlgorithm.replace);

    List classificacao = await db!.rawQuery('SELECT * FROM agendamentos');
    //List items = await db.
    List<Map<String, Object?>> agendamento = await db!.query('agendamentos');

    print("Testando o Banco");
    print(classificacao.toString());
    print(agendamento.first.toString());
  }


}
