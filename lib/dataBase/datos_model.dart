// To parse this JSON data, do
//
//     final datosModel = datosModelFromJson(jsonString);

import 'dart:convert';

DatosModel datosModelFromJson(String str) => DatosModel.fromJson(json.decode(str));

String datosModelToJson(DatosModel data) => json.encode(data.toJson());

class DatosModel {
    DatosModel({
        this.id,
        this.nombre,
        this.direccion,
        this.telefono,
    });

    int id;
    String nombre;
    String direccion;
    String telefono;

    factory DatosModel.fromJson(Map<String, dynamic> json) => DatosModel(
        id: json["id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "direccion": direccion,
        "telefono": telefono,
    };
}
