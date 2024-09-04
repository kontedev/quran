import 'package:coran/models/sourate.dart';
import 'package:coran/screens/detail_screen.dart';
import 'package:coran/screens/globales.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SourateTab extends StatelessWidget {
  const SourateTab({super.key});

  Future<List<Sourate>> _getSourateListe() async {
    String data = await rootBundle.loadString("assets/api/coran.json");
    return sourateFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sourate>>(
      future: _getSourateListe(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error loading data"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No data available"));
        } else {
          return ListView.separated(
            itemBuilder: (context, index) =>
                _sourateItem(context: context, sourate: snapshot.data![index]),
            separatorBuilder: (context, index) => Divider(
                                  color: const Color(0xFF7B80AD).withOpacity(.35),

            ),
            itemCount: snapshot.data!.length,
          );
        }
      },
    );
  }

  Widget _sourateItem({required Sourate sourate, required BuildContext context}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(numeroSourate: sourate.number,)));
    },
    child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
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
                              color: Colors.white, fontWeight: FontWeight.w500)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(


                  child: 
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sourate.englishName,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        sourate.revelationType,
                        style: GoogleFonts.poppins(
                            color: text,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2), color: text),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${sourate.numberOfAyahs} versets",
                        style: GoogleFonts.poppins(
                            color: text,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ],
                  )
                ],
              )
              ),
              Text(
                sourate.name,
                style: GoogleFonts.amiri(
                    color: primary, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
  );

}



















// import 'dart:convert';

// import 'package:coran/models/qari.dart';
// import 'package:coran/models/sourates.dart';
// import 'package:coran/screens/audios_screen.dart';
// import 'package:coran/screens/globales.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import 'package:google_fonts/google_fonts.dart';

// // Function to convert JSON string into List<Sourate>
// List<Sourate> sourateFromJson(String str) =>
//     List<Sourate>.from(json.decode(str).map((x) => Sourate.fromJson(x)));

// class SourateTab extends StatelessWidget {
//   const SourateTab({super.key});

//   Future<List<Sourate>> _getSourateListe() async {
//     String data = await rootBundle.loadString("assets/api/coran.json");
//     return sourateFromJson(data); // Use the defined sourateFromJson function
//   }

//   Future<List<Qari>> _getQariList() async {
//     String url = "https://quranicaudio.com/api/qaris";
//     final res = await http.get(Uri.parse(url));
//     if (res.statusCode == 200) {
//       final List<dynamic> data = jsonDecode(res.body);
//       return data.map((json) => Qari.fromjson(json)).toList();
//     } else {
//       throw Exception('Failed to load Qari list');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Sourate>>(
//       future: _getSourateListe(),
//       initialData: [],
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(child: Text("Error loading data"));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text("No data available"));
//         } else {
//           return FutureBuilder<List<Qari>>(
//             future: _getQariList(),
//             builder: (context, qariSnapshot) {
//               if (qariSnapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (qariSnapshot.hasError) {
//                 return Center(child: Text("Error loading Qari data"));
//               } else if (!qariSnapshot.hasData || qariSnapshot.data!.isEmpty) {
//                 return Center(child: Text("No Qari data available"));
//               } else {
//                 final qariList = qariSnapshot.data!;
//                 return ListView.separated(
//                   itemBuilder: (context, index) => _sourateItem(
//                     context: context,
//                     sourate: snapshot.data![index],
//                     qari: qariList[index % qariList.length],
//                   ),
//                   separatorBuilder: (context, index) => Divider(
//                     color: const Color(0xFF7B80AD).withOpacity(.35),
//                   ),
//                   itemCount: snapshot.data!.length,
//                 );
//               }
//             },
//           );
//         }
//       },
//     );
//   }
// Widget _sourateItem({
//   required Sourate sourate,
//   required BuildContext context,
//   required Qari qari,
// }) {
//   print('Building Sourate Item: ${sourate.englishName}'); // Debugging line
//   return GestureDetector(
//     behavior: HitTestBehavior.opaque,
//     onTap: () {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => AudiosScreen(
//           index: sourate.number,
//           list: [sourate], 
//           qari: qari, 
//         ),
//       ));
//     },
//     child: Padding(
//       padding: EdgeInsets.symmetric(vertical: 16),
//       child: Row(
//         children: [
//           Stack(
//             children: [
//               SvgPicture.asset('assets/svg/numero_sourate.svg'),
//               SizedBox(
//                 height: 36,
//                 width: 36,
//                 child: Center(
//                   child: Text(
//                     "${sourate.number}",
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   sourate.englishName,
//                   style: GoogleFonts.poppins(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Text(
//                       sourate.revelationType,
//                       style: GoogleFonts.poppins(
//                         color: text,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                       ),
//                     ),
//                     SizedBox(width: 5),
//                     Container(
//                       width: 4,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(2),
//                         color: text,
//                       ),
//                     ),
//                     SizedBox(width: 5),
//                     Text(
//                       "${sourate.numberOfAyahs} versets",
//                       style: GoogleFonts.poppins(
//                         color: text,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             sourate.name,
//             style: GoogleFonts.amiri(
//               color: primary,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
