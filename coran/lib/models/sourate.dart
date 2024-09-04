import 'dart:convert';

import 'package:coran/models/versets.dart';

List<Sourate> sourateFromJson(String str) => List<Sourate>.from(json.decode(str)['data'].map((x) => Sourate.fromJson(x)));

String sourateToJson(List<Sourate> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sourate {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String frenchNameTranslation;
  final int numberOfAyahs;
  final String revelationType;
  final String? description; // Optional
  final String? audio;
  final List<Verset>? verset;

  Sourate({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.frenchNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
    this.description,
    this.audio,
    this.verset,
  });

  factory Sourate.fromJson(Map<String, dynamic> json) => Sourate(
        number: json["number"] ?? 0,
        name: json["name"] ?? '',
        englishName: json["englishName"] ?? '',
        englishNameTranslation: json["englishNameTranslation"] ?? '',
        frenchNameTranslation: json["frenchNameTranslation"] ?? '',
        numberOfAyahs: json["numberOfAyahs"] ?? 0,
        revelationType: json["revelationType"] ?? '',
        description: json["description"],
        audio: json["audio"],
        verset: json["verset"] != null
            ? List<Verset>.from(json["verset"].map((x) => Verset.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "frenchNameTranslation": frenchNameTranslation,
        "numberOfAyahs": numberOfAyahs,
        "revelationType": revelationType,
        "description": description,
        "audio": audio,
        "verset": verset != null ? List<dynamic>.from(verset!.map((x) => x.toJson())) : [],
      };
}

// class Sourate {
//   final int number;
//   final String name;
//   final String englishName;
//   final String englishNameTranslation;
//   final int numberOfAyahs;
//   final String revelationType;
//   final List<Verset> ayahs;

//   Sourate({
//     required this.number,
//     required this.name,
//     required this.englishName,
//     required this.englishNameTranslation,
//     required this.numberOfAyahs,
//     required this.revelationType,
//     required this.ayahs,
//   });

//   factory Sourate.fromJson(Map<String, dynamic> json) {
//     var ayatsJson = json['ayahs'] as List;
//     List<Verset> ayatsList = ayatsJson.map((ayatJson) => Verset.fromJson(ayatJson)).toList();

//     return Sourate(
//       number: json['number'],
//       name: json['name'],
//       englishName: json['englishName'],
//       englishNameTranslation: json['englishNameTranslation'],
//       numberOfAyahs: json['numberOfAyahs'],
//       revelationType: json['revelationType'],
//       ayahs: ayatsList,
//     );
//   }
// }



// import 'dart:convert';

// List<Sourate> sourateFromJson(String str) => List<Sourate>.from(json.decode(str));

// String sourateToJson(Sourate data) => json.encode(data.toJson());
// class Sourate {
//   final int number;
//   final String name;
//   final String englishName;
//   final String englishNameTranslation;
//   final String frenchNameTranslation;
//   final int numberOfAyahs;
//   final String revelationType;
//   final String description;
//   final String audio;

//   Sourate({
//     required this.number,
//     required this.name,
//     required this.englishName,
//     required this.englishNameTranslation,
//     required this.frenchNameTranslation,
//     required this.numberOfAyahs,
//     required this.revelationType,
//     required this.description,
//     required this.audio
//   });

//   factory Sourate.fromJson(Map<String, dynamic> json) {
//     return Sourate(
//       number: json['number'],
//       name: json['name'],
//       englishName: json['englishName'],
//       englishNameTranslation: json['englishNameTranslation'],
//       frenchNameTranslation: json['frenchNameTranslation'],
//       numberOfAyahs: json['numberOfAyahs'],
//       revelationType: json['revelationType'],
//       description: json['description'],
//       audio: json['audio'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'number': number,
//       'name': name,
//       'englishName': englishName,
//       'englishNameTranslation': englishNameTranslation,
//       'frenchNameTranslation': frenchNameTranslation,
//       'numberOfAyahs': numberOfAyahs,
//       'revelationType': revelationType,
//       'description': description,
//       'audio': audio,
//     };
//   }
// }

// class ApiResponse {
//   final int code;
//   final String status;
//   final List<Sourate> data;

//   ApiResponse({
//     required this.code,
//     required this.status,
//     required this.data,
//   });

//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     var list = json['data'] as List;
//     List<Sourate> dataList = list.map((i) => Sourate.fromJson(i)).toList();

//     return ApiResponse(
//       code: json['code'],
//       status: json['status'],
//       data: dataList,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'code': code,
//       'status': status,
//       'data': data.map((sourate) => sourate.toJson()).toList(),
//     };
//   }
// }
