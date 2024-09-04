import 'dart:convert';
import 'package:coran/models/sourates.dart';
import 'package:coran/screens/globales.dart';
import 'package:coran/services/coran_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailHijb extends StatelessWidget {
  final int juz;

  const DetailHijb({super.key, required this.juz});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juz $juz"),
      ),
      backgroundColor: background,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: Provider.of<SourateProvider>(context, listen: false)
            .getVersetsForJuz(juz),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading data: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data available"));
          } else {
            final souratesWithVerses = snapshot.data!;
            return ListView.builder(
              itemCount: souratesWithVerses.length,
              itemBuilder: (context, index) {
                final sourate = souratesWithVerses[index]['sourate'] as Sourate;
                final versets = souratesWithVerses[index]['versets'] as List<Verset>;
                return _sourateSection(sourate, versets);
              },
            );
          }
        },
      ),
    );
  }

  Widget _sourateSection(Sourate sourate, List<Verset> versets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (versets.any((verset) => verset.number == 1))
          _sourateTitle(sourate),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: versets.length,
          itemBuilder: (context, index) {
            final verset = versets[index];
            if (verset.number == 1 && index != 0) {
              return Column(
                children: [
                  _sourateTitle(sourate),
                  _versetItem(verset: verset),
                ],
              );
            } else {
              return _versetItem(verset: verset);
            }
          },
        ),
      ],
    );
  }

  Widget _sourateTitle(Sourate sourate) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      color: primary,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: 100,
        height: 60,
        child: Column(
          children: [
            Text(
              '${sourate.englishName} (${sourate.name})',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                Text(
                  '${sourate.revelationType} - ${sourate.numberOfAyahs} versets',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _versetItem({required Verset verset}) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(color: gray, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(13.5),
                    ),
                    child: Center(
                      child: Text(
                        '${verset.number}',
                        style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.share_outlined, color: Colors.white),
                  const SizedBox(width: 16),
                  const Icon(Icons.play_arrow_outlined, color: Colors.white),
                  const SizedBox(width: 16),
                  const Icon(Icons.bookmark_outlined, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              verset.text_arabe,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16),
            Text(
              verset.text,
              style: GoogleFonts.poppins(color: text, fontSize: 18),
            ),
                        const SizedBox(height: 16),

          ],
        ),
      );
}



// class DetailHijb extends StatelessWidget {
//   final int hizbQuarter;
//   final int numeroSourate;

//   const DetailHijb({super.key, required this.hizbQuarter, required this.numeroSourate});

//   Future<List<Verset>> _getVersetsForHizb() async {
//     try {
//       final String response = await rootBundle.loadString('assets/api/coran.json');
//       final Map<String, dynamic> data = jsonDecode(response);

//       print("JSON Data: $data");

//       if (data['data'] is List) {
//         final sourates = (data['data'] as List).map((sourateJson) => Sourate.fromJson(sourateJson)).toList();

//         print("Loaded Sourates: $sourates");

//         final sourate = sourates.firstWhere(
//           (sourate) => sourate.number == numeroSourate,
//           orElse: () => throw Exception('Sourate not found'),
//         );

//         // Filter verses that belong to the specified hizbQuarter
//         final versetsForHizb = sourate.ayahs.where((verset) => verset.hizbQuarter == hizbQuarter).toList();

//         return versetsForHizb;
//       } else {
//         throw Exception('Invalid JSON format');
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to load verses');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hizb $hizbQuarter"),
//       ),
//       backgroundColor: background,
//       body: FutureBuilder<List<Verset>>(
//         future: _getVersetsForHizb(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error loading data: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No data available"));
//           } else {
//             final versets = snapshot.data!;
//             return ListView.builder(
//               itemCount: versets.length,
//               itemBuilder: (context, index) {
//                 final verset = versets[index];
//                 return _versetItem(verset: verset);
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _versetItem({required Verset verset}) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//             decoration: BoxDecoration(color: gray, borderRadius: BorderRadius.circular(10)),
//             child: Row(
//               children: [
//                 Container(
//                   width: 27,
//                   height: 27,
//                   decoration: BoxDecoration(
//                     color: primary,
//                     borderRadius: BorderRadius.circular(13.5),
//                   ),
//                   child: Center(
//                     child: Text(
//                       '${verset.number}',
//                       style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 const Icon(Icons.share_outlined, color: Colors.white),
//                 const SizedBox(width: 16),
//                 const Icon(Icons.play_arrow_outlined, color: Colors.white),
//                 const SizedBox(width: 16),
//                 const Icon(Icons.bookmark_outlined, color: Colors.white),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),
//           Text(
//             verset.text_arabe,
//             style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
//             textAlign: TextAlign.right,
//           ),
//           const SizedBox(height: 16),
//           Text(
//             verset.text,
//             style: GoogleFonts.poppins(color: text, fontSize: 18),
//           ),
//         ],
//       ),
//     );
//   }
// }
