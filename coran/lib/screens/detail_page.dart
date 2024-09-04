// import 'dart:convert';
// import 'package:coran/models/sourates.dart';
// import 'package:coran/screens/globales.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

// class DetailPage extends StatelessWidget {
//   final int page;
//   final int numeroSourate;

//   const DetailPage({super.key, required this.page, required this.numeroSourate});

  
//   Future<List<Map<String, dynamic>>> _getVersetsForPage() async {
//     try {
//       final String response = await rootBundle.loadString('assets/api/coran.json');
//       final Map<String, dynamic> data = jsonDecode(response);

//       print("JSON Data: $data");

// if (data['data'] is List) {
//         final sourates = (data['data'] as List).map((sourateJson) => Sourate.fromJson(sourateJson)).toList();

//         final List<Map<String, dynamic>> souratesWithVerses = [];

//         for (var sourate in sourates) {
//           final versetsForPage = sourate.ayahs.where((verset) => verset.page == page).toList();
//           if (versetsForPage.isNotEmpty) {
//             souratesWithVerses.add({
//               'sourate': sourate,
//               'versets': versetsForPage,
//             });
//           }
//         }

//         return souratesWithVerses;
//       }

//       else {
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
//         title: Text("Page $page"),
//       ),
//                   backgroundColor: background,

//       body: 
//       // FutureBuilder<List<Verset>>
//        FutureBuilder<List<Map<String, dynamic>>>
//       (
//         future: _getVersetsForPage(),
        
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error loading data: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No data available"));
//           } else {
//             final souratesWithVerses = snapshot.data!;
//             return 
            
//             ListView.builder(
//               itemCount: souratesWithVerses.length,
//               itemBuilder: (context, index) {
//                 final sourate = souratesWithVerses[index]['sourate'] as Sourate;
//                 final versets = souratesWithVerses[index]['versets'] as List<Verset>;
//                 return _sourateSection(sourate, versets);
//               },
//             );

//           }
//         },
//       ),
//     );

    
//   }


//   Widget _sourateSection(Sourate sourate, List<Verset> versets) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//           color: primary,
//           child: Container(
//             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white,

//             ),
//             width: 100,
//             height: 60,
//             child:  Column(
//               children: [
//                 Text(
                
//                 '${sourate.englishName} (${sourate.name})',
//                 style: GoogleFonts.poppins(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//                           ),
//                Column(
//                  children: [
//                    Text(
                    
//                     '${sourate.revelationType} * ${sourate.numberOfAyahs} versets',
//                     style: GoogleFonts.poppins(
//                       color: Colors.black,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     textAlign: TextAlign.center,
//                               ),
            
                              
//                  ],
//                ),
//               ],
//             ),
//           )
         
//         ),

//         ListView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: versets.length,
//           itemBuilder: (context, index) {
//             final verset = versets[index];
//             return _versetItem(verset: verset);
//           },
//         ),
//       ],
//     );
//   }

// Widget _versetItem({required Verset verset}) =>
  
//    Padding(
//     padding: const EdgeInsets.only(top: 24),
//     child: Column(
//       crossAxisAlignment:CrossAxisAlignment.stretch ,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               decoration: BoxDecoration(color: gray, borderRadius: BorderRadius.circular(10)),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 27,
//                     height: 27,
//                     decoration: BoxDecoration(
//                       color: primary,
//                       borderRadius: BorderRadius.circular(13.5),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '${verset.number}',
//                         style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                 const Spacer(),
//               const Icon(Icons.share_outlined, color : Colors.white),
//               const SizedBox(
//                 width: 16,
//               ),
//                           const Icon(Icons.play_arrow_outlined, color : Colors.white),
    
//                 const SizedBox(
//                 width: 16,
//               ),
//                           const Icon(Icons.bookmark_outlined, color : Colors.white),
    
//                 ]
//                 ,
//               ),
//             ),
//             const SizedBox(height: 24,),
//             Text(
//               verset.text_arabe,
//               style: GoogleFonts.poppins(
//                 color: Colors.white, fontSize: 18,),
//                 textAlign: TextAlign.right,
//             ),
//                       const SizedBox(height: 16,),
//             Text(
//               verset.text,
//               style: GoogleFonts.poppins(
//                 color: text, fontSize: 18),
//             ),

//           ],
//         ),
//   );

  
// }

import 'dart:convert';
import 'package:coran/models/sourates.dart';
import 'package:coran/screens/globales.dart';
import 'package:coran/services/coran_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final int page;
  final int numeroSourate;

  const DetailPage({super.key, required this.page, required this.numeroSourate});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page $page"),
      ),
      backgroundColor: background,
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future:  Provider.of<SourateProvider>(context, listen: false)
            .getVersetsForPage(page),
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
        if (versets.any((verset) => verset.page == page && verset.number == 1))
          _sourateTitle(sourate),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: versets.length,
          itemBuilder: (context, index) {
            final verset = versets[index];
            if (verset.page == page && verset.number == 1 && index != 0) {
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
                  '${sourate.revelationType} * ${sourate.numberOfAyahs} versets',
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
          ],
        ),
      );
}

// import 'dart:convert';

// import 'package:coran/models/sourates.dart';
// import 'package:coran/screens/globales.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class DetailPage extends StatelessWidget {
//     final int page;
//   //  final int numeroSourate;


//   const DetailPage({super.key, required this.page});
// Future<Sourate> _getDetailSourate() async {
//   final String response = await rootBundle.loadString('assets/api/coran.json');
//   final Map<String, dynamic> data = jsonDecode(response);
//   print("JSON Data: $data");

//   final sourates = (data['data'] as List)
//       .map((sourateJson) => Sourate.fromJson(sourateJson))
//       .toList();

//   print("Loaded Sourates: $sourates");

//   return sourates.firstWhere(
//     (sourate) => sourate.number == page,
//     orElse: () => throw Exception('Sourate not found'),
//   );
// }


//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Sourate>(
//       future: _getDetailSourate(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Scaffold(
//             backgroundColor: background,
//             body: Skeletonizer(
//               enableSwitchAnimation: true,
//               child: ListView.builder(
//                 itemCount: 6,
//                 padding: const EdgeInsets.all(20),
//                 itemBuilder: (context, index) {
//                   return const Card(
//                     child: ListTile(
//                       title: Text('Chargement'),
//                       subtitle: Text('Merci pour votre patience'),
//                       trailing: Icon(
//                         Icons.ac_unit,
//                         size: 32,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           );
//         }
//         if (snapshot.hasError) {
//           return Scaffold(
//             backgroundColor: background,
//             body: Center(child: Text('Erreur de chargement des données')),
//           );
//         }
//         Sourate sourate = snapshot.data!;
//         print("Sourate Data: $sourate");
//         return Scaffold(
//           backgroundColor: background,
//           appBar: _appBar(context: context, sourate: sourate),
//           body: NestedScrollView(
//               headerSliverBuilder: (context, innerBoxIsScrolled) => [
//                     SliverPadding(
//                       padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
//                       sliver: SliverToBoxAdapter(
//                         child: _details(sourate: sourate),
//                       ),
//                     ),
//                   ],
//               body: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: ListView.separated(
//                   itemCount:
//                       sourate.numberOfAyahs, // Assure-toi que c'est correct
//                   itemBuilder: (context, index) {
//                     return _versetItem(
//                         verset: sourate.ayahs[
//                             index] // Assure-toi que tu accèdes correctement aux versets
//                         );
//                   },
//                   separatorBuilder: (context, index) =>
//                       Divider(), // Utilise Divider pour séparer les items
//                 ),
//               )

//               //          Padding(
//               // padding: const EdgeInsets.symmetric(horizontal: 24),
//               // child: ListView.separated(
//               //   itemCount: sourate.numberOfAyahs + (numeroSourate == 1 ? -1 : 0 )  ,
//               //   itemBuilder: (context, index) => _versetItem(verset: sourate.ayahs.elementAt(index + (numeroSourate == 1 ? 1 : 0 ))),
//               //   separatorBuilder: (context, index) => Container(),
//               // ),
//               //          )
              //  Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 24),
              //   child: ListView.separated(
              //     itemCount: sourate.numberOfAyahs + (numeroSourate == 1 ? -1 : 0),
              //     itemBuilder: (context, index) {
              //       int adjustedIndex = (numeroSourate == 1 && index == 0) ? 0 : index + (numeroSourate == 1 ? 1 : 0);
              //       return _versetItem(verset: sourate.verset!.elementAt(adjustedIndex));
              //     },
              //     separatorBuilder: (context, index) => Container(),
              //   ),
              // ),
//               ),
//         );
//       },
//     );
//   }
// }
// Widget _versetItem({required Verset verset}) => Padding(
//     padding: const EdgeInsets.only(top: 24),
//     child: Column(
//       crossAxisAlignment:CrossAxisAlignment.stretch ,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               decoration: BoxDecoration(color: gray, borderRadius: BorderRadius.circular(10)),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 27,
//                     height: 27,
//                     decoration: BoxDecoration(
//                       color: primary,
//                       borderRadius: BorderRadius.circular(13.5),
//                     ),
//                     child: Center(
//                       child: Text(
//                         '${verset.number}',
//                         style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                 const Spacer(),
//               const Icon(Icons.share_outlined, color : Colors.white),
//               const SizedBox(
//                 width: 16,
//               ),
//                           const Icon(Icons.play_arrow_outlined, color : Colors.white),
    
//                 const SizedBox(
//                 width: 16,
//               ),
//                           const Icon(Icons.bookmark_outlined, color : Colors.white),
    
//                 ]
//                 ,
//               ),
//             ),
//             const SizedBox(height: 24,),
//             Text(
//               verset.text_arabe,
//               style: GoogleFonts.amiri(
//                 color: Colors.white, fontSize: 18, fontWeight:FontWeight.bold),
//                 textAlign: TextAlign.right,
//             ),
//                       const SizedBox(height: 16,),
//             Text(
//               verset.text,
//               style: GoogleFonts.amiri(
//                 color: text, fontSize: 18),
//             ),
//             // Text(
//             //   verset.text_arabe,
//             //   style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
//             // ),
//           ],
//         ),
//   );

//   Widget _details({required Sourate sourate}) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Stack(
//           children: [
//             Container(
//               height: 257,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 gradient: const LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomLeft,
//                   stops: [0, .6, 1],
//                   colors: [Color(0xFFDF98FA), Color(0xFFB070FD), Color(0xFF9055FF)],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               right: 0,
//               child: Opacity(
//                 opacity: .2,
//                 child: Image.asset(
//                   'assets/images/coran.png',
//                   width: 324 - 55,
//                 ),
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 children: [
//                   Text(
//                     sourate.englishName,
//                     style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 26),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     sourate.englishNameTranslation,
//                     style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
//                   ),
//                   Divider(
//                     color: Colors.white.withOpacity(.35),
//                     thickness: 2,
//                     height: 30,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         sourate.revelationType,
//                         style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
//                       ),
//                       const SizedBox(width: 5),
//                       Container(
//                         width: 4,
//                         height: 4,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.white),
//                       ),
//                       const SizedBox(width: 5),
//                       Text(
//                         "${sourate.numberOfAyahs} versets",
//                         style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 32),
//                   SvgPicture.asset("assets/svg/bismillahi.svg"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
// AppBar _appBar({required BuildContext context, required Sourate sourate}) {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       elevation: 0,
//       title: Row(
//         children: [
//           IconButton(
//             onPressed: () => Navigator.of(context).pop(),
//             icon: SvgPicture.asset("assets/svg/retour-icon.svg"),
//           ),
//           const SizedBox(width: 24),
//           Text(
//             sourate.ayahs.page,
//             style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const Spacer(),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
//         ],
//       ),
//     );
// }