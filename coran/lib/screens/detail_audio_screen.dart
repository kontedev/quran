// import 'dart:convert';

//  import 'package:coran/models/sourate.dart';
// //import 'package:coran/models/sourates.dart';
// import 'package:coran/models/versets.dart';
// import 'package:coran/screens/globales.dart';
// //import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class DetailScreen extends StatelessWidget {
//   final int numeroSourate;
//   const DetailScreen({super.key, required this.numeroSourate});

//   // Future<Sourate> _getDetailSourate() async {
//   //   var response =
//   //       await Dio().get("http://api.alquran.cloud/v1/surah/$numeroSourate");
//   //   return Sourate.fromJson(
//   //       response.data['data']); // Correctly parse the response
//   // }
//   //   Future<Sourate> _getDetailSourate() async {
//   //   final String response = await rootBundle.loadString('assets/api/detail-sourate.json');
//   //   print(response);
//   //   final Map<String, dynamic> data = jsonDecode(response);

//   //   final sourates = (data['data'] as List)
//   //       .map((sourateJson) => Sourate.fromJson(sourateJson))
//   //       .toList();

//   //   return sourates.firstWhere((sourate) => sourate.number == numeroSourate);
//   // }
// Future<Sourate> _getDetailSourate() async {
//   final String response = await rootBundle.loadString('assets/api/detail-sourate.json');
//   print(response);
//   final Map<String, dynamic> data = jsonDecode(response);

//   final sourates = (data['data'] as List)
//       .map((sourateJson) => Sourate.fromJson(sourateJson))
//       .toList();

//   return sourates.firstWhere((sourate) => sourate.number == numeroSourate);
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
//               // enabled: _enabled,
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
//         Sourate sourate = snapshot.data!;
//         return Scaffold(
//           backgroundColor: background,
//           appBar: _appBar(context: context, sourate: sourate),

//           body: NestedScrollView(
//               headerSliverBuilder: (context, innerBoxIsScrolled) => [
//                     SliverPadding(
//                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
//                       sliver: SliverToBoxAdapter(
//                         child: _details(sourate: sourate),
//                       ),
//                     )
//                   ],
//               body:
// Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24),
//                 child: ListView.separated(
//                   itemCount: sourate.numberOfAyahs + (numeroSourate == 1 ? -1 : 0 )  ,
//                   itemBuilder: (context, index) => _versetItem(verset: sourate.verset!.elementAt(index + (numeroSourate == 1 ? 1 : 0 ))),
//                   separatorBuilder: (context, index) => Container(),
//                 ),
//               )
// //               body: ListView.separated(
// //   itemCount: sourate.numberOfAyahs + (numeroSourate == 1 ? 1 : 0),
// //   itemBuilder: (context, index) {
// //     if (index == 0 && numeroSourate == 1) {
// //       // Ajoutez un verset spécial au début si c'est la sourate numéro 1
// //       return _versetItem(verset: Verset(number: 0, text: "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ"));
// //     }
// //     // Utilisez un index ajusté pour accéder aux versets
// //     int adjustedIndex = numeroSourate == 1 ? index - 1 : index;
// //     return _versetItem(verset: sourate.verset![adjustedIndex]);
// //   },
// //   separatorBuilder: (context, index) => Container(),
// // ),

//               ),
//         );
//       },
//     );
//   }

//   Widget _versetItem({required Verset verset }) => Column(
//     children: [
//       Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//       decoration: BoxDecoration(color: gray,
//             borderRadius: BorderRadius.circular(10)),
//       child: Row(children: [
//         Container(
//           width: 27,
//           height: 27,
//           decoration: BoxDecoration(
//             color: primary,
//             borderRadius: BorderRadius.circular(13.5)
//           ),
//         )
//       ],),),
//     Text(verset.text, style: GoogleFonts.amiri(color: Colors.white),),
//   ],);

//   Widget _details({required Sourate sourate}) => Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Stack(
//         children: [
//           Container(
//             height: 257,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 gradient: const LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomLeft,
//                     stops: [
//                       0,
//                       .6,
//                       1
//                     ],
//                     colors: [
//                       Color(0xFFDF98FA),
//                       Color(0xFFB070FD),
//                       Color(0xFF9055FF)
//                     ])),
//           ),
//           Positioned(
//               bottom: 0,
//               right: 0,
//               child: Opacity(
//                 opacity: .2,
//                 child: Image.asset(
//                   'assets/images/coran.png',
//                   width: 324 - 55,
//                   // height: 140,
//                 ),
//               )),
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   sourate.englishName,
//                   style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 26),
//                 ),
//                const SizedBox(
//                   height: 2,
//                 ),
//                 Text(
//                   sourate.englishNameTranslation,
//                   style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16),
//                 ),
//                 Divider(
//                   color: Colors.white.withOpacity(.35),
//                   thickness: 2,
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       sourate.revelationType,
//                       style: GoogleFonts.poppins(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Container(
//                       width: 4,
//                       height: 4,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(2),
//                           color: Colors.white),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       "${sourate.numberOfAyahs} versets",
//                       style: GoogleFonts.poppins(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15),
//                     ),
//                   ],
//                 ),
//          const SizedBox(
//                   height: 32,
//                 ),
//                 SvgPicture.asset("assets/svg/bismillahi.svg")
//               ],
//             ),
//           )
//         ],
//       ));

//   AppBar _appBar({required BuildContext context, required Sourate sourate}) {
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
//             sourate.englishName,
//             style: GoogleFonts.poppins(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const Spacer(),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:coran/models/sourates.dart';
// import 'package:coran/screens/globales.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class DetailScreen extends StatelessWidget {
//   final int numeroSourate;
//   const DetailScreen({super.key, required this.numeroSourate});

//   Future<Sourate> _getDetailSourate() async {
//     final String response =
//         await rootBundle.loadString('assets/api/coran.json');
//     final Map<String, dynamic> data = jsonDecode(response);

//     final sourates = (data['data'] as List)
//         .map((sourateJson) => Sourate.fromJson(sourateJson))
//         .toList();

//     return sourates.firstWhere(
//       (sourate) => sourate.number == numeroSourate,
//       orElse: () => throw Exception('Sourate not found'),
//     );
//   }

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
//         return Scaffold(
//           backgroundColor: background,
//           appBar: _appBar(context: context, sourate: sourate),
//           body: DefaultTabController(
//             length: 3,
//             child: Column(
//               children: [
//                 _tab(),
//                 Expanded(
//                   child: TabBarView(
//                     children: [
//                       _sourateDetailTab(sourate: sourate),
//                       Center(child: Text('Arabe', style: TextStyle(color: Colors.red))),
//                       Center(child: Text('Audio', style: TextStyle(color: Colors.red))),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   TabBar _tab() {
//     return TabBar(
//       unselectedLabelColor: text,
//       labelColor: Colors.white,
//       indicatorColor: primary,
//       indicatorWeight: 3,
//       tabs: [
//         _tabItem(label: "Détails"),
//         _tabItem(label: "Arabe"),
//         _tabItem(label: "Audio"),
//       ],
//     );
//   }

//   Tab _tabItem({required String label}) => Tab(
//     child: Text(
//       label,
//       style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600),
//     ),
//   );

//   Widget _sourateDetailTab({required Sourate sourate}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: ListView.separated(
//         itemCount: sourate.numberOfAyahs,
//         itemBuilder: (context, index) {
//           return _versetItem(verset: sourate.ayahs[index]);
//         },
//         separatorBuilder: (context, index) => Divider(),
//       ),
//     );
//   }

//   Widget _versetItem({required Verset verset}) => Padding(
//     padding: const EdgeInsets.only(top: 24),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
        
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//           decoration: BoxDecoration(
//             color: gray,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             children: [
              
//               Container(
//                 width: 27,
//                 height: 27,
//                 decoration: BoxDecoration(
//                   color: primary,
//                   borderRadius: BorderRadius.circular(13.5),
//                 ),
//                 child: Center(
//                   child: Text(
//                     '${verset.number}',
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               const Icon(Icons.share_outlined, color: Colors.white),
//               const SizedBox(width: 16),
//               const Icon(Icons.play_arrow_outlined, color: Colors.white),
//               const SizedBox(width: 16),
//               const Icon(Icons.bookmark_outlined, color: Colors.white),
//             ],
//           ),
//         ),
//         const SizedBox(height: 24),
//         Text(
//           verset.text_arabe,
//           style: GoogleFonts.amiri(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.right,
//         ),
//         const SizedBox(height: 16),
//         Text(
//           verset.text,
//           style: GoogleFonts.amiri(color: text, fontSize: 18),
//         ),
        
//       ],
//     ),
    
//   );

//   Widget _details({required Sourate sourate}) => SvgPicture.asset("assets/svg/bismillahi.svg");


// import 'package:coran/models/sourates.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:skeletonizer/skeletonizer.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'dart:convert';

// class DetailScreen extends StatefulWidget {
//   final int numeroSourate;
//   const DetailScreen({super.key, required this.numeroSourate});

//   @override
//   _DetailScreenState createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   late AudioPlayer _audioPlayer;
//   Duration _position = Duration();
//   Duration _duration = Duration();

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();
//     _audioPlayer.onPositionChanged.listen((position) {
//       setState(() {
//         _position = position;
//       });
//     });
//     _audioPlayer.onDurationChanged.listen((duration) {
//       setState(() {
//         _duration = duration;
//       });
//     });
//   }

//   Future<Sourate> _getDetailSourate() async {
//     final String response =
//         await rootBundle.loadString('assets/api/coran.json');
//     final Map<String, dynamic> data = jsonDecode(response);

//     final sourates = (data['data'] as List)
//         .map((sourateJson) => Sourate.fromJson(sourateJson))
//         .toList();

//     return sourates.firstWhere(
//       (sourate) => sourate.number == widget.numeroSourate,
//       orElse: () => throw Exception('Sourate not found'),
//     );
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Sourate>(
//       future: _getDetailSourate(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             backgroundColor: Colors.white,
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
//             backgroundColor: Colors.white,
//             body: Center(child: Text('Erreur de chargement des données')),
//           );
//         }

//         if (!snapshot.hasData) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             body: Center(child: Text('Aucune donnée trouvée')),
//           );
//         }

//         Sourate sourate = snapshot.data!;
//         return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: _appBar(context: context, sourate: sourate),
//           body: DefaultTabController(
//             length: 3,
//             child: Column(
//               children: [
//                 _tab(),
//                 Expanded(
//                   child: TabBarView(
//                     children: [
//                       _sourateDetailTab(sourate: sourate),
//                       _arabeDetail(sourate: sourate),
//                       _audioPlayerTab(sourate: sourate),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _arabeDetail({required Sourate sourate}) => SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: ListView.separated(
//             itemCount: sourate.numberOfAyahs + (widget.numeroSourate != 9 ? 1 : 0), // +1 for the Bismillahi image for sourates other than 9
//             itemBuilder: (context, index) {
//               if (index == 0 && widget.numeroSourate != 9) {
//                 return SvgPicture.asset('assets/bismillahi.svg');
//               } else {
//                 return _versetItemArabe(
//                   verset: sourate.ayahs.elementAt(
//                     index - (widget.numeroSourate != 9 ? 1 : 0),
//                   ),
//                 );
//               }
//             },
//             separatorBuilder: (context, index) {
//               if (index == 0 && widget.numeroSourate != 9) {
//                 return const SizedBox.shrink(); // No separator for the first item if it's the Bismillahi image
//               }
//               return const Divider();
//             },
//           ),
//         ),
//       );

//   Widget _versetItemArabe({required Verset verset}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: RichText(
//               textAlign: TextAlign.right,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: verset.text_arabe,
//                     style: GoogleFonts.amiri(
//                       fontSize: 24,
//                       color: Colors.black,
//                     ),
//                   ),
//                   WidgetSpan(
//                     alignment: PlaceholderAlignment.middle,
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                       child: Text(
//                         '(${verset.number})',
//                         style: GoogleFonts.amiri(
//                           fontSize: 18,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.play_arrow),
//             onPressed: () async {
//               try {
//                 // Replace with the correct URL or path to your audio file
//                 String url = 'https://api.alquran.cloud/v1/surah/${verset.number}/en.asad';

//                 await _audioPlayer.play(url as Source);
//                 // Success
//               } catch (e) {
//                 // Handle error
//                 print("Error playing audio: $e");
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _audioPlayerTab({required Sourate sourate}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'Audio Player',
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         Slider(
//           value: _position.inSeconds.toDouble(),
//           min: 0.0,
//           max: _duration.inSeconds.toDouble(),
//           onChanged: (double value) {
//             setState(() {
//               _audioPlayer.seek(Duration(seconds: value.toInt()));
//             });
//           },
//         ),
//         Text('${_position.inMinutes}:${_position.inSeconds.remainder(60)} / ${_duration.inMinutes}:${_duration.inSeconds.remainder(60)}'),
//         IconButton(
//           icon: Icon(Icons.play_arrow),
//           onPressed: () async {
//             try {
//               String url = 'https://api.alquran.cloud/v1/surah/${sourate.number}/en.asad';
//               await _audioPlayer.play(url as Source);
//             } catch (e) {
//               print("Error playing audio: $e");
//             }
//           },
//         ),
//       ],
//     );
//   }

//   AppBar _appBar({required BuildContext context, required Sourate sourate}) {
//     return AppBar(
//       backgroundColor: Colors.green,
//       title: Text(
//         sourate.name,
//         style: GoogleFonts.amiri(
//           fontSize: 24,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   Widget _tab() {
//     return TabBar(
//       tabs: [
//         Tab(text: 'Details'),
//         Tab(text: 'Arabe'),
//         Tab(text: 'Audio'),
//       ],
//     );
//   }

//   Widget _sourateDetailTab({required Sourate sourate}) {
//     return ListView(
//       padding: EdgeInsets.all(15.0),
//       children: [
//         Text(
//           sourate.revelationType,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 10),
//         Text(
//           sourate.englishName,
//           style: GoogleFonts.amiri(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 10),
//         Text(
//           sourate.englishNameTranslation,
//           style: TextStyle(fontSize: 16),
//         ),
//         SizedBox(height: 10),
//         Text(
//           sourate.revelationType,
//           style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//         ),
//       ],
//     );
//   }
// }

import 'package:coran/models/sourates.dart';
import 'package:coran/screens/audio_players_screen.dart';
import 'package:coran/screens/globales.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:convert';

class DetailScreen extends StatelessWidget {
  final int numeroSourate;
  const DetailScreen({super.key, required this.numeroSourate});

  Future<Sourate> _getDetailSourate() async {
    final String response = await rootBundle.loadString('assets/api/coran.json');
    final Map<String, dynamic> data = jsonDecode(response);

    final sourates = (data['data'] as List).map((sourateJson) => Sourate.fromJson(sourateJson)).toList();

    return sourates.firstWhere(
      (sourate) => sourate.number == numeroSourate,
      orElse: () => throw Exception('Sourate not found'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Sourate>(
      future: _getDetailSourate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: background,
            body: Skeletonizer(
              enableSwitchAnimation: true,
              child: ListView.builder(
                itemCount: 6,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return const Card(
                    child: ListTile(
                      title: Text('Chargement'),
                      subtitle: Text('Merci pour votre patience'),
                      trailing: Icon(
                        Icons.ac_unit,
                        size: 32,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: background,
            body: Center(child: Text('Erreur de chargement des données')),
          );
        }

        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: background,
            body: Center(child: Text('Aucune donnée trouvée')),
          );
        }

        Sourate sourate = snapshot.data!;
        return Scaffold(
          backgroundColor: background,
          appBar: _appBar(context: context, sourate: sourate),
          body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                _tab(),
                Expanded(
                  child: TabBarView(
                    children: [
                      _sourateDetailTab(sourate: sourate),
                      _arabeDetail(sourate: sourate),
                      Center(child: Text('Audio', style: TextStyle(color: Colors.red))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: AudioPlayerWidget(
            audioUrl: 'https://api.alquran.cloud/v1/surah/${numeroSourate}/en.asad',
            verseText: 'Your verse text here',
            verseNumber: '$numeroSourate',
          ),
        );
      },
    );
  }

  Widget _arabeDetail({required Sourate sourate}) => SafeArea(
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: ListView.separated(
        itemCount: sourate.numberOfAyahs + (numeroSourate != 9 ? 1 : 0), // +1 for the Bismillahi image for sourates other than 9
        itemBuilder: (context, index) {
          if (index == 0 && numeroSourate != 9) {
            return SvgPicture.asset('assets/bismillahi.svg');
          } else {
            return _versetItemArabe(
              verset: sourate.ayahs.elementAt(
                index - (numeroSourate != 9 ? 1 : 0),
              ),
            );
          }
        },
        separatorBuilder: (context, index) {
          if (index == 0 && numeroSourate != 9) {
            return const SizedBox.shrink(); // No separator for the first item if it's the Bismillahi image
          }
          return const Divider();
        },
      ),
    ),
  );

  Widget _versetItemArabe({required Verset verset}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: VersetItemArabe(verset: verset),
    );
  }

  AppBar _appBar({required BuildContext context, required Sourate sourate}) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(
        sourate.name,
        style: GoogleFonts.amiri(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _tab() {
    return TabBar(
      tabs: [
        Tab(text: 'Details'),
        Tab(text: 'Arabe'),
        Tab(text: 'Audio'),
      ],
    );
  }

  Widget _sourateDetailTab({required Sourate sourate}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.separated(
        itemCount: sourate.numberOfAyahs + (numeroSourate != 9 ? 1 : 0), // +1 for the Bismillahi image for sourates other than 9
        itemBuilder: (context, index) {
          if (index == 0 && numeroSourate != 9) {
            return _details(sourate: sourate);
          } else {
            return _versetItem(
              verset: sourate.ayahs.elementAt(
                index - (numeroSourate != 9 ? 1 : 0),
              ),
            );
          }
        },
        separatorBuilder: (context, index) {
          if (index == 0 && numeroSourate != 9) {
            return const SizedBox.shrink(); // No separator for the first item if it's the Bismillahi image
          }
          return const Divider();
        },
      ),
    );
  }

  Widget _versetItem({required Verset verset}) => Padding(
    padding: const EdgeInsets.only(top: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: gray,
            borderRadius: BorderRadius.circular(10),
          ),
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
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
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
          style: GoogleFonts.amiri(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 16),
        Text(
          verset.transcription,
          style: GoogleFonts.amiri(color: text, fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          verset.text,
          style: GoogleFonts.amiri(color: text, fontSize: 18),
        ),
      ],
    ),
  );

  Widget _details({required Sourate sourate}) {
    return Column(
      children: [
        if (sourate.number != 9)
          SvgPicture.asset("assets/svg/bismillahi.svg"),
        // Add other details here if needed
      ],
    );
  }
}

class VersetItemArabe extends StatefulWidget {
  final Verset verset;

  const VersetItemArabe({required this.verset});

  @override
  _VersetItemArabeState createState() => _VersetItemArabeState();
}

class _VersetItemArabeState extends State<VersetItemArabe> {
  late AudioPlayer player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await player.pause();
    } else {
      try {
        // Replace with the correct URL or path to your audio file
        String url = 'https://api.alquran.cloud/v1/surah/${widget.verset.number}/en.asad';
        await player.play(UrlSource(url));
      } catch (e) {
        print('Error playing audio: $e');
      }
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 27,
                  height: 27,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(13.5),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.verset.number}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                SizedBox(width: 16),
                Icon(Icons.bookmark_outlined, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 24),
          Text(
            widget.verset.text_arabe,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}


// import 'dart:convert';
// import 'package:coran/models/sourates.dart';
// import 'package:coran/screens/globales.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class DetailScreen extends StatelessWidget {
//   final int numeroSourate;
//   const DetailScreen({super.key, required this.numeroSourate});

//   Future<Sourate> _getDetailSourate() async {
//     final String response =
//         await rootBundle.loadString('assets/api/coran.json');
//     final Map<String, dynamic> data = jsonDecode(response);

//     final sourates = (data['data'] as List)
//         .map((sourateJson) => Sourate.fromJson(sourateJson))
//         .toList();

//     return sourates.firstWhere(
//       (sourate) => sourate.number == numeroSourate,
//       orElse: () => throw Exception('Sourate not found'),
//     );
//   }

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
//         return Scaffold(
//           backgroundColor: background,
//           appBar: _appBar(context: context, sourate: sourate),
//           body: DefaultTabController(
//             length: 3,
//             child: Column(
//               children: [
//                 _tab(),
//                 Expanded(
//                   child: TabBarView(
//                     children: [
//                       _sourateDetailTab(sourate: sourate),
//                       _arabeDetail(sourate: sourate),
//                       Center(child: Text('Audio', style: TextStyle(color: Colors.red))),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

// // Widget _arabeDetail({required Sourate sourate}) => SafeArea(
// //       child: Padding(
// //         padding: EdgeInsets.all(15.0),
// //         child: 
        
// //         ListView.separated(
// //       itemCount: sourate.numberOfAyahs + (numeroSourate == 1 ? 1 : 0), // +1 for the Bismillahi image
// //       itemBuilder: (context, index) {
// //         if (index == 0) {
// //           return _details(sourate: sourate);
// //         } else {
// //           if (numeroSourate == 1) {
// //             // Start from the second verse for Sourate 1
// //             return _versetItemArabe(verset: sourate.ayahs.elementAt(index));
// //           } else {
// //             // Start from the first verse for other sourates
// //             return _versetItemArabe(verset: sourate.ayahs.elementAt(index - 1));
// //           }
// //         }
// //       },
// //       separatorBuilder: (context, index) {
// //         if (index == 0) {
// //           return const SizedBox.shrink(); // No separator for the first item
// //         }
// //         return const Divider();
// //       },
// //     ),
      
// //       ),
// //     );
// Widget _arabeDetail({required Sourate sourate}) => SafeArea(
//       child: Padding(
//         padding: EdgeInsets.all(15.0),
//         child: 
//         ListView.separated(
//           itemCount: sourate.numberOfAyahs + (numeroSourate != 9 ? 1 : 0), // +1 for the Bismillahi image for sourates other than 9
//           itemBuilder: (context, index) {
//             if (index == 0 && numeroSourate != 9) {
//               return SvgPicture.asset('assets/bismillahi.svg');
//             } else {
//               return _versetItemArabe(
//                 verset: sourate.ayahs.elementAt(
//                   index - (numeroSourate != 9 ? 1 : 0),
//                 ),
//               );
//             }
//           },
//           separatorBuilder: (context, index) {
//             if (index == 0 && numeroSourate != 9) {
//               return const SizedBox.shrink(); // No separator for the first item if it's the Bismillahi image
//             }
//             return const Divider();
//           },
//         ),
//       ),
//     );

// // Widget _versetItemArabe({required Verset verset}) => Padding(
// //       padding: EdgeInsets.symmetric(vertical: 10.0),
// //       child: RichText(
// //         textAlign: TextAlign.right,
// //         text: TextSpan(
// //           children: [
// //             TextSpan(
// //               text: verset.text_arabe,
// //               style: GoogleFonts.amiri(
// //                 fontSize: 24,
// //                 color: Colors.white,
// //               ),
// //             ),
// //             WidgetSpan(
// //               alignment: PlaceholderAlignment.middle,
// //               child: Container(
// //                 margin: const EdgeInsets.symmetric(horizontal: 5.0),
// //                 child: Text(
// //                   '(${verset.number})',
// //                   style: GoogleFonts.amiri(
// //                     fontSize: 18,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );

// Widget _versetItemArabe({required Verset verset}) => 

// // Padding(
// //       padding: EdgeInsets.all(15.0),
// //       child: ListTile(
// //         leading: CircleAvatar(
// //           backgroundColor: Colors.blue,
// //           child: Text(
// //             verset.number.toString(),
// //             style: TextStyle(color: Colors.white),
// //           ),
// //         ),
// //         title: Text(
// //           verset.text_arabe,
// //           textAlign: TextAlign.right,
// //           style: GoogleFonts.amiri(
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //     );


// Padding(
//     padding: const EdgeInsets.only(top: 24),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//           decoration: BoxDecoration(
//             color: gray,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Row(
//             children: [
//               Container(
//                 width: 27,
//                 height: 27,
//                 decoration: BoxDecoration(
//                   color: primary,
//                   borderRadius: BorderRadius.circular(13.5),
//                 ),
//                 child: Center(
//                   child: Text(
//                     '${verset.number}',
//                     style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               // const Spacer(),
//               // const Icon(Icons.share_outlined, color: Colors.white),
//               // const SizedBox(width: 16),
//               // const Icon(Icons.play_arrow_outlined, color: Colors.white),
//               // const SizedBox(width: 16),
//               // const Icon(Icons.bookmark_outlined, color: Colors.white),
//             ],
//           ),
//         ),
//         const SizedBox(height: 24),
//         Text(
//           verset.text_arabe,
//           style: GoogleFonts.amiri(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.right,
//         ),
//         // const SizedBox(height: 16),
//         // Text(
//         //   verset.transcription,
//         //   style: GoogleFonts.amiri(color: text, fontSize: 18),
//         // ),
//         // const SizedBox(height: 16),
//         // Text(
//         //   verset.text,
//         //   style: GoogleFonts.amiri(color: text, fontSize: 18),
//         // ),
        
//       ],
//     ),
//   );
//   TabBar _tab() {
//     return TabBar(
//       unselectedLabelColor: text,
//       labelColor: Colors.white,
//       indicatorColor: primary,
//       indicatorWeight: 3,
//       tabs: [
//         _tabItem(label: "Transcription"),
//         _tabItem(label: "Arabe"),
//         _tabItem(label: "Audio"),
//       ],
//     );
//   }

//   Tab _tabItem({required String label}) => Tab(
//     child: Text(
//       label,
//       style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600),
//     ),
//   );

//   // Widget _sourateDetailTab({required Sourate sourate}) {
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(horizontal: 24),
//   //     child: ListView.separated(
//   //       itemCount: sourate.numberOfAyahs + (numeroSourate == 1 ? 1 : 0 ), // +1 for the Bismillahi image
//   //       itemBuilder: (context, index) 
//   //       {
//   //         if (index == 0) {
//   //           return _details(sourate: sourate);
//   //         } else {

//   //           return _versetItem(verset: sourate.ayahs.elementAt(index + (numeroSourate == 1 ? 0 : 0 )));
//   //         }
//   //       },
//   //               separatorBuilder: (context, index) {
//   //         if (index == 0) {
//   //           return const SizedBox.shrink(); // No separator for the first item
//   //         }
//   //         return const Divider();
//   //       },
//   //     ),
//   //   );
//   // }
// Widget _sourateDetailTab({required Sourate sourate}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 24),
//     child:ListView.separated(
//           itemCount: sourate.numberOfAyahs + (numeroSourate != 9 ? 1 : 0), // +1 for the Bismillahi image for sourates other than 9
//           itemBuilder: (context, index) {
//             if (index == 0 && numeroSourate != 9) {
//               return _details(sourate: sourate);
//             } else {
//               return _versetItem(
//                 verset: sourate.ayahs.elementAt(
//                   index - (numeroSourate != 9 ? 1 : 0),
//                 ),
//               );
//             }
//           },
//           separatorBuilder: (context, index) {
//             if (index == 0 && numeroSourate != 9) {
//               return const SizedBox.shrink(); // No separator for the first item if it's the Bismillahi image
//             }
//             return const Divider();
//           },
//         ),
//     //  ListView.separated(
//     //   itemCount: sourate.numberOfAyahs + (numeroSourate == 1 ? 1 : 0), // +1 for the Bismillahi image
//     //   itemBuilder: (context, index) {
//     //     if (index == 0) {
//     //       return _details(sourate: sourate);
//     //     } else {
//     //       if (numeroSourate == 1) {
//     //         // Start from the second verse for Sourate 1
//     //         return _versetItem(verset: sourate.ayahs.elementAt(index));
//     //       } else {
//     //         // Start from the first verse for other sourates
//     //         return _versetItem(verset: sourate.ayahs.elementAt(index - 1));
//     //       }
//     //     }
//     //   },
//     //   separatorBuilder: (context, index) {
//     //     if (index == 0) {
//     //       return const SizedBox.shrink(); // No separator for the first item
//     //     }
//     //     return const Divider();
//     //   },
//     // ),
//   );
// }

  // Widget _versetItem({required Verset verset}) => Padding(
  //   padding: const EdgeInsets.only(top: 24),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.stretch,
  //     children: [
  //       Container(
  //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  //         decoration: BoxDecoration(
  //           color: gray,
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         child: Row(
  //           children: [
  //             Container(
  //               width: 27,
  //               height: 27,
  //               decoration: BoxDecoration(
  //                 color: primary,
  //                 borderRadius: BorderRadius.circular(13.5),
  //               ),
  //               child: Center(
  //                 child: Text(
  //                   '${verset.number}',
  //                   style: GoogleFonts.poppins(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             const Spacer(),
  //             const Icon(Icons.share_outlined, color: Colors.white),
  //             const SizedBox(width: 16),
  //             const Icon(Icons.play_arrow_outlined, color: Colors.white),
  //             const SizedBox(width: 16),
  //             const Icon(Icons.bookmark_outlined, color: Colors.white),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(height: 24),
  //       Text(
  //         verset.text_arabe,
  //         style: GoogleFonts.amiri(
  //           color: Colors.white,
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //         ),
  //         textAlign: TextAlign.right,
  //       ),
  //       const SizedBox(height: 16),
  //       Text(
  //         verset.transcription,
  //         style: GoogleFonts.amiri(color: text, fontSize: 18),
  //       ),
  //       const SizedBox(height: 16),
  //       Text(
  //         verset.text,
  //         style: GoogleFonts.amiri(color: text, fontSize: 18),
  //       ),
        
  //     ],
  //   ),
  // );

  // Widget _details({required Sourate sourate}) {
  //   return Column(
  //     children: [
  //       if (sourate.number != 9)
  //         SvgPicture.asset("assets/svg/bismillahi.svg"),
  //       // Add other details here if needed
  //     ],
  //   );
  // }

// //   AppBar _appBar({required BuildContext context, required Sourate sourate}) {
// //     return AppBar(
// //       title: Text(
// //         sourate.name,
// //         style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
// //       ),
// //       backgroundColor: background,
// //       elevation: 0,
// //     );
// //   }
// // }
//   // Padding(
//   //       padding: const EdgeInsets.symmetric(horizontal: 24),
//   //       child: Stack(
//   //         children: [
//   //           Container(
//   //             height: 257,
//   //             decoration: BoxDecoration(
//   //               borderRadius: BorderRadius.circular(10),
//   //               gradient: const LinearGradient(
//   //                 begin: Alignment.topLeft,
//   //                 end: Alignment.bottomLeft,
//   //                 stops: [0, .6, 1],
//   //                 colors: [
//   //                   Color(0xFFDF98FA),
//   //                   Color(0xFFB070FD),
//   //                   Color(0xFF9055FF)
//   //                 ],
//   //               ),
//   //             ),
//   //           ),
//   //           Positioned(
//   //             bottom: 0,
//   //             right: 0,
//   //             child: Opacity(
//   //               opacity: .2,
//   //               child: Image.asset(
//   //                 'assets/images/coran.png',
//   //                 width: 324 - 55,
//   //               ),
//   //             ),
//   //           ),
//   //           Container(
//   //             width: double.infinity,
//   //             padding: const EdgeInsets.all(20),
//   //             child: Column(
//   //               children: [
//   //                 Text(
//   //                   sourate.englishName,
//   //                   style: GoogleFonts.poppins(
//   //                       color: Colors.white,
//   //                       fontWeight: FontWeight.w500,
//   //                       fontSize: 26),
//   //                 ),
//   //                 const SizedBox(height: 2),
//   //                 Text(
//   //                   sourate.englishNameTranslation,
//   //                   style: GoogleFonts.poppins(
//   //                       color: Colors.white,
//   //                       fontWeight: FontWeight.w500,
//   //                       fontSize: 16),
//   //                 ),
//   //                 Divider(
//   //                   color: Colors.white.withOpacity(.35),
//   //                   thickness: 2,
//   //                   height: 30,
//   //                 ),
//   //                 Row(
//   //                   mainAxisAlignment: MainAxisAlignment.center,
//   //                   children: [
//   //                     Text(
//   //                       sourate.revelationType,
//   //                       style: GoogleFonts.poppins(
//   //                           color: Colors.white, fontWeight: FontWeight.w500),
//   //                     ),
//   //                     const SizedBox(width: 5),
//   //                     Container(
//   //                       width: 4,
//   //                       height: 4,
//   //                       decoration: BoxDecoration(
//   //                           borderRadius: BorderRadius.circular(2),
//   //                           color: Colors.white),
//   //                     ),
//   //                     const SizedBox(width: 5),
//   //                     Text(
//   //                       "${sourate.numberOfAyahs} versets",
//   //                       style: GoogleFonts.poppins(
//   //                           color: Colors.white,
//   //                           fontWeight: FontWeight.w500,
//   //                           fontSize: 15),
//   //                     ),
//   //                   ],
//   //                 ),
//   //                 const SizedBox(height: 32),
//   //                 SvgPicture.asset("assets/svg/bismillahi.svg"),
//   //               ],
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     );

//   AppBar _appBar({required BuildContext context, required Sourate sourate}) {
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
//           // Text(
//           //   sourate.englishName,
            
//           //   style:
//           //       GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
//           // ),
//            Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     sourate.englishName,
//                     style: GoogleFonts.poppins(
//                          fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         sourate.revelationType,
//                         style: GoogleFonts.poppins(
//                             color: text,
//                             fontWeight: FontWeight.w800,
//                             fontSize: 15),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Container(
//                         width: 4,
//                         height: 4,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2), color: text),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "${sourate.numberOfAyahs} versets",
//                         style: GoogleFonts.poppins(
//                             color: text,
//                             fontWeight: FontWeight.w800,
//                             fontSize: 15),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//           const Spacer(),
//           IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
//         ],
//       ),
//     );
//   }
// }
