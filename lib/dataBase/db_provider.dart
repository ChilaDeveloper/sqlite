
import "dart:io";

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

import 'package:sqlite/dataBase/datos_model.dart';
// export  'package:sqlite/dataBase/datos_model.dart';


class DBProvider{

  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async{
    if(_database != null) return _database;
    _database =await initDB();
    //solo por ahora
    // nuevoDato(new DatosModel(nombre: "juan",direccion: "calle 2",telefono: "7667654"));
    return _database;
  }

  Future<Database> initDB() async{

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Datos');

    print("path de init: "+path);

    return await openDatabase(path,
    version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version ) async{
      await db.execute('''CREATE TABLE datos(
                            id INTEGER PRIMARY KEY,
                            nombre TEXT,
                            direccion TEXT,
                            telefono TEXT)''');
      }
    );
    // Director documentsDirectory = await getAplica
  }

  Future<int> nuevoDato(DatosModel nuevoDato) async {
    final db = await database;
    final res = await db.insert('datos', nuevoDato.toJson());
    print("nuevo dato "+res.toString());
    return res;

  }

  Future<DatosModel> getDatoById(int id) async{
    final db = await database;
    final res = await db.query('datos', where: 'id = ?',whereArgs: [id]);
    print("obtener datos :"+res.toString());
    return res.isNotEmpty
          ? DatosModel.fromJson(res.first):null;
  }

  Future<int> updateDatos(DatosModel nuevoDato) async{
    final db = await database;
    final res = await db.update("datos", nuevoDato.toJson(),where: 'id = ?', whereArgs: [nuevoDato.id]);
    print("actualizando dato: "+res.toString());
    return res;
  }

}