// class Sourate {
//   final int number;
//   final String name;
//   final String englishName;
//   final String englishNameTranslation;
//   final int numberOfAyahs;
//   final String revelationType;
//   final List<Verset> ayahs;
//   final String audio;

//   Sourate({
//     required this.number,
//     required this.name,
//     required this.englishName,
//     required this.englishNameTranslation,
//     required this.numberOfAyahs,
//     required this.revelationType,
//     required this.ayahs,
//     required this.audio,
//   });

//   factory Sourate.fromJson(Map<String, dynamic> json) {
//     var ayatsJson = json['verset'] as List?;
//     List<Verset> ayatsList =
//         ayatsJson?.map((ayatJson) => Verset.fromJson(ayatJson)).toList() ?? [];

//     return Sourate(
//       number: json['number'] ?? 0,
//       name: json['name'] ?? '',
//       englishName: json['englishName'] ?? '',
//       englishNameTranslation: json['englishNameTranslation'] ?? '',
//       numberOfAyahs: json['numberOfAyahs'] ?? 0,
//       revelationType: json['revelationType'] ?? '',
//       ayahs: ayatsList,
//       audio: json['audio']?? '',
//     );
//   }
// }
// class Sourate {
//   final int number;
//   final String name;
//   final String englishName;
//   final String englishNameTranslation;
//   final int numberOfAyahs;
//   final String revelationType;
//   final List<Verset> ayahs;
//   final List<String> audio;  // List of audio URLs

//   Sourate({
//     required this.number,
//     required this.name,
//     required this.englishName,
//     required this.englishNameTranslation,
//     required this.numberOfAyahs,
//     required this.revelationType,
//     required this.ayahs,
//     required this.audio,
//   });

//   factory Sourate.fromJson(Map<String, dynamic> json) {
//     var ayatsJson = json['verset'] as List?;
//     List<Verset> ayatsList =
//         ayatsJson?.map((ayatJson) => Verset.fromJson(ayatJson)).toList() ?? [];

//     var audioJson = json['audio'] as List?;
//     List<String> audioList = audioJson?.map((audio) => audio as String).toList() ?? [];

//     return Sourate(
//       number: json['number'] ?? 0,
//       name: json['name'] ?? '',
//       englishName: json['englishName'] ?? '',
//       englishNameTranslation: json['englishNameTranslation'] ?? '',
//       numberOfAyahs: json['numberOfAyahs'] ?? 0,
//       revelationType: json['revelationType'] ?? '',
//       ayahs: ayatsList,
//       audio: audioList,
//     );
//   }
// }

// class Verset {
//   final int number;
//   final String text_arabe;
//   final String text;
//   final int page;
//   final int juz;
//   final String transcription;
//   final int audio;

//   Verset({
//     required this.number,
//     required this.text_arabe,
//     required this.text,
//     required this.page,
//     required this.juz,
//     required this.transcription,
//     required this.audio,
//   });

//   factory Verset.fromJson(Map<String, dynamic> json) {
//     return Verset(
//       number: json['number'] ?? 0,
//       text_arabe: json['text_arabe'] ?? '',
//       text: json['text'] ?? '',
//       page: json['page'] ?? 0,
//       juz: json['juz'] ?? 0,
//       transcription: json['transcription'] ?? '',
//       audio: json['audio'] ?? 0,
//     );
//   }
// }

class Sourate {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final int numberOfAyahs;
  final String revelationType;
  final List<Verset> ayahs;
  // final List<Audio> audio;  // List of Audio objects

  Sourate({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.numberOfAyahs,
    required this.revelationType,
    required this.ayahs,
    // required this.audio,
  });

  factory Sourate.fromJson(Map<String, dynamic> json) {
    var ayatsJson = json['verset'] as List?;
    List<Verset> ayatsList =
        ayatsJson?.map((ayatJson) => Verset.fromJson(ayatJson)).toList() ?? [];

    // var audioJson = json['audio'] as List?;
    // List<Audio> audioList =
    //     audioJson?.map((audio) => Audio.fromJson(audio)).toList() ?? [];

    return Sourate(
      number: json['number'] ?? 0,
      name: json['name'] ?? '',
      englishName: json['englishName'] ?? '',
      englishNameTranslation: json['englishNameTranslation'] ?? '',
      numberOfAyahs: json['numberOfAyahs'] ?? 0,
      revelationType: json['revelationType'] ?? '',
      ayahs: ayatsList,
      // audio: audioList,
    );
  }
}

class Verset {
  final int number;
  final String text_arabe;
  final String text;
  final int page;
  final int juz;
  final String transcription;
  // final int audio;

  Verset({
    required this.number,
    required this.text_arabe,
    required this.text,
    required this.page,
    required this.juz,
    required this.transcription,
    // required this.audio,
  });

  factory Verset.fromJson(Map<String, dynamic> json) {
    return Verset(
      number: json['number'] ?? 0,
      text_arabe: json['text_arabe'] ?? '',
      text: json['text'] ?? '',
      page: json['page'] ?? 0,
      juz: json['juz'] ?? 0,
      transcription: json['transcription'] ?? '',
      // audio: json['audio'] ?? 0,
    );
  }
}

// class Audio {
//   final String url;
//   final String reader;  // Name of the reader

//   Audio({
//     required this.url,
//     required this.reader,
//   });

//   factory Audio.fromJson(Map<String, dynamic> json) {
//     return Audio(
//       url: json['url'] ?? '',
//       reader: json['reader'] ?? '',
//     );
//   }
// }


// import 'package:coran/models/versets.dart';

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
//   var ayatsJson = json['verset'] as List;
//   List<Verset> ayatsList = ayatsJson.map((ayatJson) => Verset.fromJson(ayatJson)).toList();

//   return Sourate(
//     number: json['number'],
//     name: json['nom'], // Assure-toi que la clé correspond à celle du JSON
//     englishName: json['englishName'],
//     englishNameTranslation: json['englishNameTranslation'],
//     numberOfAyahs: json['numberOfAyahs'],
//     revelationType: json['revelationType'],
//     ayahs: ayatsList, // Assure-toi que le nom est correct
//   );
// }


//   // factory Sourate.fromJson(Map<String, dynamic> json) {
//   //   var ayatsJson = json['verset'] as List;
//   //   List<Verset> ayatsList = ayatsJson.map((ayatJson) => Verset.fromJson(ayatJson)).toList();

//   //   return Sourate(
//   //     number: json['number'],
//   //     name: json['name'],
//   //     englishName: json['englishName'],
//   //     englishNameTranslation: json['englishNameTranslation'],
//   //     numberOfAyahs: json['numberOfAyahs'],
//   //     revelationType: json['revelationType'],
//   //     ayahs: ayatsList,
//   //   );
//   // }
// }

