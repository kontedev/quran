import 'dart:convert';

import 'package:coran/models/sourate.dart';

Verset versetFromJson(String str) => Verset.fromJson(json.decode(str));

String versetToJson(Verset data) => json.encode(data.toJson());



class Verset {
  int code;
  String status;
  Data data;

  Verset({
    required this.code,
    required this.status,
    required this.data,
  });

  factory Verset.fromJson(Map<String, dynamic> json) => Verset(
        code: json["code"] ?? 0,
        status: json["status"] ?? '',
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  int numero;
  String text;
  Edition edition;
  Sourate sourate;
  int numeroSourate;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;
  bool sajda;

  Data({
    required this.numero,
    required this.text,
    required this.edition,
    required this.sourate,
    required this.numeroSourate,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        numero: json["numero"] ?? 0,
        text: json["text"] ?? '',
        edition: Edition.fromJson(json["edition"] ?? {}),
        sourate: Sourate.fromJson(json["sourate"] ?? {}),
        numeroSourate: json["numeroSourate"] ?? 0,
        juz: json["juz"] ?? 0,
        manzil: json["manzil"] ?? 0,
        page: json["page"] ?? 0,
        ruku: json["ruku"] ?? 0,
        hizbQuarter: json["hizbQuarter"] ?? 0,
        sajda: json["sajda"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "numero": numero,
        "text": text,
        "edition": edition.toJson(),
        "sourate": sourate.toJson(),
        "numeroSourate": numeroSourate,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
      };
}

class Edition {
  String identifier;
  String language;
  String name;
  String englishName;
  String format;
  String type;
  String direction;

  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
    required this.direction,
  });

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json["identifier"] ?? '',
        language: json["language"] ?? '',
        name: json["name"] ?? '',
        englishName: json["englishName"] ?? '',
        format: json["format"] ?? '',
        type: json["type"] ?? '',
        direction: json["direction"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "language": language,
        "name": name,
        "englishName": englishName,
        "format": format,
        "type": type,
        "direction": direction,
      };
}

// // import 'dart:convert';

// // import 'package:coran/models/sourate.dart';

// // Verset versetFromJson(String str) => Verset.fromJson(json.decode(str));

// // String versetToJson(Verset data) => json.encode(data.toJson());

// // class Verset {
// //     int code;
// //     String status;
// //     Data data;

// //     Verset({
// //         required this.code,
// //         required this.status,
// //         required this.data,
// //     });

// //     factory Verset.fromJson(Map<String, dynamic> json) => Verset(
// //         code: json["code"],
// //         status: json["status"],
// //         data: Data.fromJson(json["data"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "code": code,
// //         "status": status,
// //         "data": data.toJson(),
// //     };
// // }

// // class Data {
// //     int numero;
// //     String text;
// //     Edition edition;
// //     Sourate sourate;
// //     int numeroSourate;
// //     int juz;
// //     int manzil;
// //     int page;
// //     int ruku;
// //     int hizbQuarter;
// //     bool sajda;

// //     Data({
// //         required this.numero,
// //         required this.text,
// //         required this.edition,
// //         required this.sourate,
// //         required this.numeroSourate,
// //         required this.juz,
// //         required this.manzil,
// //         required this.page,
// //         required this.ruku,
// //         required this.hizbQuarter,
// //         required this.sajda,
// //     });

// //     factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         numero: json["numero"],
// //         text: json["text"],
// //         edition: Edition.fromJson(json["edition"]),
// //         sourate: Sourate.fromJson(json["sourate"]),
// //         numeroSourate: json["numeroSourate"],
// //         juz: json["juz"],
// //         manzil: json["manzil"],
// //         page: json["page"],
// //         ruku: json["ruku"],
// //         hizbQuarter: json["hizbQuarter"],
// //         sajda: json["sajda"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "numero": numero,
// //         "text": text,
// //         "edition": edition.toJson(),
// //         "sourate": sourate.toJson(),
// //         "numeroSourate": numeroSourate,
// //         "juz": juz,
// //         "manzil": manzil,
// //         "page": page,
// //         "ruku": ruku,
// //         "hizbQuarter": hizbQuarter,
// //         "sajda": sajda,
// //     };
// // }

// // class Edition {
// //     String identifier;
// //     String language;
// //     String name;
// //     String englishName;
// //     String format;
// //     String type;
// //     String direction;

// //     Edition({
// //         required this.identifier,
// //         required this.language,
// //         required this.name,
// //         required this.englishName,
// //         required this.format,
// //         required this.type,
// //         required this.direction,
// //     });

// //     factory Edition.fromJson(Map<String, dynamic> json) => Edition(
// //         identifier: json["identifier"],
// //         language: json["language"],
// //         name: json["name"],
// //         englishName: json["englishName"],
// //         format: json["format"],
// //         type: json["type"],
// //         direction: json["direction"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "identifier": identifier,
// //         "language": language,
// //         "name": name,
// //         "englishName": englishName,
// //         "format": format,
// //         "type": type,
// //         "direction": direction,
// //     };
// // }
