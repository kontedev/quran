// import 'package:coran/models/sourate.dart';
// import 'package:coran/screens/detail_hijb.dart';
// import 'package:coran/screens/globales.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HijbTab extends StatelessWidget {
//   const HijbTab({super.key});

//   Future<List<Sourate>> _getSourateListe() async {
//     String data = await rootBundle.loadString("assets/api/coran.json");
//     return sourateFromJson(data);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Sourate>>(
//       future: _getSourateListe(),
//       initialData:const [],
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text("Error loading data"));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text("No data available"));
//         } else {
//           // Group sourates by juz and calculate verses per sourate in each juz
//           Map<int, List<Map<String, dynamic>>> souratesByJuz = {};

//           for (var sourate in snapshot.data!) {
//             if (sourate.verset != null) {
//               for (var verset in sourate.verset!) {
//                 if (!souratesByJuz.containsKey(verset.juz)) {
//                   souratesByJuz[verset.juz] = [];
//                 }

//                 var sourateInJuz = souratesByJuz[verset.juz]!.firstWhere(
//                   (s) => s['sourate'].number == sourate.number,
//                   orElse: () => {},
//                 );

//                 if (sourateInJuz.isEmpty) {
//                   souratesByJuz[verset.juz]!.add({
//                     'sourate': sourate,
//                     'verseCount': 1,
//                   });
//                 } else {
//                   sourateInJuz['verseCount'] =
//                       (sourateInJuz['verseCount'] as int) + 1;
//                 }
//               }
//             }
//           }

//           return ListView.builder(
//             itemCount: souratesByJuz.keys.length,
//             itemBuilder: (context, index) {
//               int juz = souratesByJuz.keys.elementAt(index);
//               List<Map<String, dynamic>> souratesInJuz = souratesByJuz[juz]!;

//               int totalVersesInJuz = souratesInJuz.fold<int>(
//                   0, (sum, s) => sum + (s['verseCount'] as int));

//               return _juzCard(
//                 juz: juz,
//                 sourates: souratesInJuz,
//                 totalVerses: totalVersesInJuz,
//                 context: context,
//               );
//             },
//           );
//         }
//       },
//     );
//   }

//   Widget _juzCard({
//     required int juz,
//     required List<Map<String, dynamic>> sourates,
//     required int totalVerses,
//     required BuildContext context,
//   }) {
//     return Card(
//       elevation: 10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                 color: primary,
//               ),
//               width: MediaQuery.of(context).size.width,
//               child: Center(
//                 child: Text(
//                   'Juz $juz',
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),
//             ...sourates
//                 .map((s) => _sourateInfo(s['sourate'], s['verseCount'] as int, context))
//                 .toList(),
//           ],
//         ),
//       ),
//     );
//   }
// Widget _sourateInfo(Sourate sourate, int verseCount, BuildContext context) {
//   return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailHijb(sourate: sourate),
//           ),
//         );
//       },
 
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 7),
//       child: Row(
//         children: [

//             Stack(
//                 children: [
//                   SvgPicture.asset('assets/svg/numero_sourate.svg'),
//                   SizedBox(
//                     height: 36,
//                     width: 36,
//                     child: Center(
//                       child: Text("${sourate.number}",
//                           style: GoogleFonts.poppins(
//                               color: Colors.black, fontWeight: FontWeight.w500)),
//                     ),
//                   ),
//                 ],
//               ),
//                  SizedBox(
//                 width: 5,
//               ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 sourate.englishName,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Text(sourate.revelationType,                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),),
//                   const SizedBox(width: 5),
//                   Text('$verseCount versets',                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                 ),),
//                 ],
//               ),
//             ],
//           ),
//           Spacer(),
//           Text(
//             sourate.name,
//             style: GoogleFonts.amiri(
//               color: primary, 
//               fontSize: 22, 
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }

import 'package:coran/models/sourate.dart';
import 'package:coran/screens/detail_hijb.dart';
import 'package:coran/screens/globales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HijbTab extends StatelessWidget {
  const HijbTab({super.key});

  Future<List<Sourate>> _getSourateListe() async {
    String data = await rootBundle.loadString("assets/api/coran.json");
    return sourateFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sourate>>(
      future: _getSourateListe(),
      initialData: const [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading data"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No data available"));
        } else {
          // Group sourates by juz and calculate verses per sourate in each juz
          Map<int, List<Map<String, dynamic>>> souratesByJuz = {};

          for (var sourate in snapshot.data!) {
            if (sourate.verset != null) {
              for (var verset in sourate.verset!) {
                if (!souratesByJuz.containsKey(verset.juz)) {
                  souratesByJuz[verset.juz] = [];
                }

                var sourateInJuz = souratesByJuz[verset.juz]!.firstWhere(
                  (s) => s['sourate'].number == sourate.number,
                  orElse: () => {},
                );

                if (sourateInJuz.isEmpty) {
                  souratesByJuz[verset.juz]!.add({
                    'sourate': sourate,
                    'verseCount': 1,
                  });
                } else {
                  sourateInJuz['verseCount'] =
                      (sourateInJuz['verseCount'] as int) + 1;
                }
              }
            }
          }

          return ListView.builder(
            itemCount: souratesByJuz.keys.length,
            itemBuilder: (context, index) {
              int juz = souratesByJuz.keys.elementAt(index);
              List<Map<String, dynamic>> souratesInJuz = souratesByJuz[juz]!;

              int totalVersesInJuz = souratesInJuz.fold<int>(
                  0, (sum, s) => sum + (s['verseCount'] as int));

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailHijb(
                        juz: juz,
                      ),
                    ),
                  );
                },
                child: _juzCard(
                  juz: juz,
                  sourates: souratesInJuz,
                  totalVerses: totalVersesInJuz,
                  context: context,
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _juzCard({
    required int juz,
    required List<Map<String, dynamic>> sourates,
    required int totalVerses,
    required BuildContext context,
  }) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: primary,
              ),
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'Juz $juz',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ...sourates
                .map((s) => _sourateInfo(s['sourate'], s['verseCount'] as int, context))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _sourateInfo(Sourate sourate, int verseCount, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Stack(
            children: [
              SvgPicture.asset('assets/svg/numero_sourate.svg'),
              SizedBox(
                height: 36,
                width: 36,
                child: Center(
                  child: Text("${sourate.number}",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sourate.englishName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(sourate.revelationType, style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(width: 5),
                  Text('$verseCount versets', style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            sourate.name,
            style: GoogleFonts.amiri(
              color: primary,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
