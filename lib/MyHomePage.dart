import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:sqlite/dataBase/datos_model.dart';
import 'package:sqlite/dataBase/db_provider.dart';
export  'package:sqlite/dataBase/datos_model.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController valor1 = new TextEditingController();
  TextEditingController valor2 = new TextEditingController();
  TextEditingController valor3 = new TextEditingController();
  var nombre = "";
  var direccion = "";
  var telefono = "";

  obtenerDatos() async {
    final DatosModel datosModel = await DBProvider.db.getDatoById(1);
    nombre = datosModel.nombre;
    direccion = datosModel.direccion;
    telefono = datosModel.telefono;

    valor1.text=this.nombre;
    valor2.text=this.direccion;
    valor3.text=this.telefono;
    // valor2 = new TextEditingController(text: this.direccion);
    // valor3 = new TextEditingController(text: this.telefono);
    // print("jeisy prueba = "+nombre);
  }

  @override
  void initState() {
    super.initState();

    DBProvider.db.database;
    DBProvider.db.nuevoDato(new DatosModel(nombre: "Juan",direccion: "calle 2",telefono: "7599453"));

    obtenerDatos();


    //
    // DBProvider.db.getDatoById(1).then((value) => valor1 = new TextEditingController(text: value.nombre.toString()));
    // DBProvider.db.getDatoById(1).then((value) => valor2 = new TextEditingController(text: value.direccion.toString()));
    // DBProvider.db.getDatoById(1).then((value) => valor3 = new TextEditingController(text: value.telefono.toString()));




  }

  void datos(){
    setState(() {
      DBProvider.db.updateDatos(new DatosModel(id: 1,nombre: valor1.text,direccion: valor2.text,telefono: valor3.text));
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          color: Colors.white,
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Container(

            padding: const EdgeInsets.symmetric(
              // vertical: 8.0,
              horizontal: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: valor1,
                  keyboardType: TextInputType.text,

                  decoration: new InputDecoration(labelText: "Nombre",fillColor: Colors.black),

                ),
                TextField(
                  controller: valor2,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(labelText: "Direccion",fillColor: Colors.black),

                ),
                TextField(
                  controller: valor3,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(labelText: "Telefono",fillColor: Colors.black),

                ),

                FlatButton(
                  color: Colors.black12,
                  hoverColor: Colors.white54,
                  child: Text("Actualizar"),
                  onPressed:() {
                    datos();

                  },
                )
              ],
            ),
          ),
        )


    );
  }
}