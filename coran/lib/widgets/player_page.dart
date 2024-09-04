// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // class PlayerPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
    
// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       appBar: AppBar(),
// // body: Container(
// //   color: Colors.white,
// //   child: Column(
// //     mainAxisAlignment: MainAxisAlignment.start,
// //     children: [
// //       ImageAuthor(),
// //       PlayerControl(),
// //     ],
// //   ),
// // ),    );
// //   }
// // }

// // class ImageAuthor extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 550,
// //       decoration: BoxDecoration(
// //         image: DecorationImage(
// //           image: AssetImage('assets/images/coran.png'),
// //           fit: BoxFit.cover,
// //         ),
// //       ),
// //       child: Stack(children: [
// //         TitleSection(),
// //         ArtistPictureSection(),
// //       ]),
// //     );
// //   }
// // }


// // class TitleSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 220,
// //       width: double.infinity,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Text(
// //             'Artist',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w300,
// //               fontSize: 14.0,
// //               color: Colors.white,
// //             ),
// //           ),
// //           Text(
// //             'Ariana Grande',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w800,
// //               fontSize: 17.0,
// //               color: Colors.white,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class ArtistPictureSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(top: 200),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.only(
// //           topRight: Radius.circular(50),
// //         ),
// //       ),
// //       child: Stack(
// //         alignment: Alignment.center,
// //         children: [
// //           Positioned(
// //             top: 65.0,
// //             child: Container(
// //               height: 250,
// //               width: 300,
// //               decoration: BoxDecoration(
// //                 color: Colors.grey[350],
// //                 borderRadius: BorderRadius.only(
// //                   topRight: Radius.circular(50),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             top: 50.0,
// //             child: Container(
// //               height: 275,
// //               width: 250,
// //               decoration: BoxDecoration(
// //                 image: DecorationImage(
// //                   image: AssetImage('assets/images/coran.png'),
// //                   fit: BoxFit.cover,
// //                   colorFilter: ColorFilter.mode(
// //                       Colors.blue.withOpacity(1), BlendMode.darken),
// //                 ),
// //                 borderRadius: BorderRadius.only(
// //                   topRight: Radius.circular(50),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class PlayerControl extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(top: 30),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           PlayingMusicTitle(),
// //           MusicSliderSection(),
// //           DurationSection(),
// //           MusicControlButtonSection()
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class PlayingMusicTitle extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(bottom: 10),
// //       child: Column(
// //         children: [
// //           Text(
// //             'Imagine',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w700,
// //               fontSize: 25.0,
// //               color: Colors.black,
// //             ),
// //           ),
// //           SizedBox(width: 3),
// //           Text(
// //             'Ariana Grande',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w400,
// //               fontSize: 14.0,
// //               color: Colors.blue,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class MusicSliderSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(5),
// //       child: Slider(
// //         value: 19,
// //         min: 1.0,
// //         max: 100,
// //         divisions: 10,
// //         activeColor: Colors.blue,
// //         inactiveColor: Colors.grey,
// //         onChanged: (double newValue) {},
// //       ),
// //     );
// //   }
// // }

// // class DurationSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(left: 27, right: 27, bottom: 15),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(
// //             '1.08',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w400,
// //               fontSize: 14.0,
// //               color: Colors.grey,
// //             ),
// //           ),
// //           Text(
// //             '3.14',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w400,
// //               fontSize: 14.0,
// //               color: Colors.grey,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// // class MusicControlButtonSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(top: 10),
// //       padding: EdgeInsets.all(5),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           IconButton(
// //             icon: Icon(
// //               Icons.shuffle,
// //               color: Colors.grey,
// //               size: 35,
// //             ),
// //             onPressed: null,
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.skip_previous,
// //               color: Colors.black,
// //               size: 40,
// //             ),
// //             onPressed: null,
// //           ),
// //           ElevatedButton(
// //             onPressed: () {},
// //             child: Container(
// //               padding: EdgeInsets.all(10),
// //               child: Icon(
// //                 Icons.pause,
// //                 color: Colors.black,
// //                 size: 40.0,
// //               ),
// //             ),
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.white,
// //               shape: CircleBorder(),
// //               side: BorderSide(
// //                 width: 1.0,
// //                 color: Colors.grey,
// //               ),
// //             ),
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.skip_next,
// //               color: Colors.black,
// //               size: 40,
// //             ),
// //             onPressed: null,
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.repeat,
// //               color: Colors.grey,
// //               size: 35,
// //             ),
// //             onPressed: null,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:coran/models/sourates.dart';

// class PlayerPage extends StatefulWidget {
//   final Sourate sourate;

//   PlayerPage({required this.sourate});

//   @override
//   _PlayerPageState createState() => _PlayerPageState();
// }

// class _PlayerPageState extends State<PlayerPage> {
//   late AudioPlayer _audioPlayer;
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   void _playPause() {
//     if (isPlaying) {
//       _audioPlayer.pause();
//     } else {
//       _audioPlayer.play(UrlSource(widget.sourate.audio));
//     }
//     setState(() {
//       isPlaying = !isPlaying;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             ImageAuthor(sourate: widget.sourate),
//             PlayerControl(onPlayPause: _playPause, isPlaying: isPlaying),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ImageAuthor extends StatelessWidget {
//   final Sourate sourate;

//   ImageAuthor({required this.sourate});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 550,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/coran.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(children: [
//         TitleSection(sourate: sourate),
//         ArtistPictureSection(),
//       ]),
//     );
//   }
// }

// class TitleSection extends StatelessWidget {
//   final Sourate sourate;

//   TitleSection({required this.sourate});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 220,
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Sourate',
//             style: GoogleFonts.lato(
//               fontWeight: FontWeight.w300,
//               fontSize: 14.0,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             sourate.name,
//             style: GoogleFonts.lato(
//               fontWeight: FontWeight.w800,
//               fontSize: 17.0,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ArtistPictureSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 200),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(50),
//         ),
//       ),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Positioned(
//             top: 65.0,
//             child: Container(
//               height: 250,
//               width: 300,
//               decoration: BoxDecoration(
//                 color: Colors.grey[350],
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(50),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 50.0,
//             child: Container(
//               height: 275,
//               width: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/images/coran.png'),
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(
//                       Colors.blue.withOpacity(1), BlendMode.darken),
//                 ),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(50),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PlayerControl extends StatelessWidget {
//   final VoidCallback onPlayPause;
//   final bool isPlaying;

//   PlayerControl({required this.onPlayPause, required this.isPlaying});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 30),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           PlayingMusicTitle(),
//           MusicSliderSection(),
//           DurationSection(),
//           MusicControlButtonSection(
//             onPlayPause: onPlayPause,
//             isPlaying: isPlaying,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PlayingMusicTitle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 10),
//       child: Column(
//         children: [
//           Text(
//             'Imagine',
//             style: GoogleFonts.lato(
//               fontWeight: FontWeight.w700,
//               fontSize: 25.0,
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(width: 3),
//           Text(
//             'Ariana Grande',
//             style: GoogleFonts.lato(
//               fontWeight: FontWeight.w400,
//               fontSize: 14.0,
//               color: Colors.blue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MusicSliderSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5),
//       child: Slider(
//         value: 19,
//         min: 1.0,
//         max: 100,
//         divisions: 10,
//         activeColor: Colors.blue,
//         inactiveColor: Colors.grey,
//         onChanged: (double newValue) {},
//       ),
//     );
//   }
// }

// class DurationSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 27, right: 27, bottom: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             '1.08',
//             style: GoogleFonts.lato(
//               fontWeight: FontWeight.w400,
//               fontSize: 14.0,
//               color: Colors.grey,
//             ),
//           ),
//           Text(
//             '3.14',
//             style: GoogleFonts.lato(
//               fontWeight: FontWeight.w400,
//               fontSize: 14.0,
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MusicControlButtonSection extends StatelessWidget {
//   final VoidCallback onPlayPause;
//   final bool isPlaying;

//   MusicControlButtonSection({required this.onPlayPause, required this.isPlaying});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 10),
//       padding: EdgeInsets.all(5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.shuffle,
//               color: Colors.grey,
//               size: 35,
//             ),
//             onPressed: null,
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.skip_previous,
//               color: Colors.black,
//               size: 40,
//             ),
//             onPressed: null,
//           ),
//           ElevatedButton(
//             onPressed: onPlayPause,
//             child: Container(
//               padding: EdgeInsets.all(10),
//               child: Icon(
//                 isPlaying ? Icons.pause : Icons.play_arrow,
//                 color: Colors.black,
//                 size: 40.0,
//               ),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.white,
//               shape: CircleBorder(),
//               side: BorderSide(
//                 width: 1.0,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.skip_next,
//               color: Colors.black,
//               size: 40,
//             ),
//             onPressed: null,
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.repeat,
//               color: Colors.grey,
//               size: 35,
//             ),
//             onPressed: null,
//           ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:coran/models/sourates.dart';

// // class PlayerPage extends StatefulWidget {
// //   final Sourate sourate;

// //   PlayerPage({required this.sourate});

// //   @override
// //   _PlayerPageState createState() => _PlayerPageState();
// // }

// // class _PlayerPageState extends State<PlayerPage> {
// //   late AudioPlayer _audioPlayer;
// //   bool isPlaying = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _audioPlayer = AudioPlayer();
// //   }

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   void _playPause() {
// //     if (isPlaying) {
// //       _audioPlayer.pause();
// //     } else {
// //       _audioPlayer.play(widget.sourate.audio as Source);
// //     }
// //     setState(() {
// //       isPlaying = !isPlaying;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       appBar: AppBar(),
// //       body: Container(
// //         color: Colors.white,
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             ImageAuthor(),
// //             PlayerControl(onPlayPause: _playPause, isPlaying: isPlaying),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ImageAuthor extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 550,
// //       decoration: BoxDecoration(
// //         image: DecorationImage(
// //           image: AssetImage('assets/images/coran.png'),
// //           fit: BoxFit.cover,
// //         ),
// //       ),
// //       child: Stack(children: [
// //         TitleSection(),
// //         ArtistPictureSection(),
// //       ]),
// //     );
// //   }
// // }

// // class TitleSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       height: 220,
// //       width: double.infinity,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Text(
// //             'Sourate',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w300,
// //               fontSize: 14.0,
// //               color: Colors.white,
// //             ),
// //           ),
// //           Text(
// //             'Al-Fatiha', // Remplacer par le nom de la sourate
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w800,
// //               fontSize: 17.0,
// //               color: Colors.white,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class ArtistPictureSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(top: 200),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.only(
// //           topRight: Radius.circular(50),
// //         ),
// //       ),
// //       child: Stack(
// //         alignment: Alignment.center,
// //         children: [
// //           Positioned(
// //             top: 65.0,
// //             child: Container(
// //               height: 250,
// //               width: 300,
// //               decoration: BoxDecoration(
// //                 color: Colors.grey[350],
// //                 borderRadius: BorderRadius.only(
// //                   topRight: Radius.circular(50),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             top: 50.0,
// //             child: Container(
// //               height: 275,
// //               width: 250,
// //               decoration: BoxDecoration(
// //                 image: DecorationImage(
// //                   image: AssetImage('assets/images/coran.png'),
// //                   fit: BoxFit.cover,
// //                   colorFilter: ColorFilter.mode(
// //                       Colors.blue.withOpacity(1), BlendMode.darken),
// //                 ),
// //                 borderRadius: BorderRadius.only(
// //                   topRight: Radius.circular(50),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class PlayerControl extends StatelessWidget {
// //   final VoidCallback onPlayPause;
// //   final bool isPlaying;

// //   PlayerControl({required this.onPlayPause, required this.isPlaying});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(top: 30),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           PlayingMusicTitle(),
// //           MusicSliderSection(),
// //           DurationSection(),
// //           MusicControlButtonSection(
// //             onPlayPause: onPlayPause,
// //             isPlaying: isPlaying,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class PlayingMusicTitle extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(bottom: 10),
// //       child: Column(
// //         children: [
// //           Text(
// //             'Imagine',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w700,
// //               fontSize: 25.0,
// //               color: Colors.black,
// //             ),
// //           ),
// //           SizedBox(width: 3),
// //           Text(
// //             'Ariana Grande',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w400,
// //               fontSize: 14.0,
// //               color: Colors.blue,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class MusicSliderSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.all(5),
// //       child: Slider(
// //         value: 19,
// //         min: 1.0,
// //         max: 100,
// //         divisions: 10,
// //         activeColor: Colors.blue,
// //         inactiveColor: Colors.grey,
// //         onChanged: (double newValue) {},
// //       ),
// //     );
// //   }
// // }

// // class DurationSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(left: 27, right: 27, bottom: 15),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(
// //             '1.08',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w400,
// //               fontSize: 14.0,
// //               color: Colors.grey,
// //             ),
// //           ),
// //           Text(
// //             '3.14',
// //             style: GoogleFonts.lato(
// //               fontWeight: FontWeight.w400,
// //               fontSize: 14.0,
// //               color: Colors.grey,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class MusicControlButtonSection extends StatelessWidget {
// //   final VoidCallback onPlayPause;
// //   final bool isPlaying;

// //   MusicControlButtonSection({required this.onPlayPause, required this.isPlaying});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: EdgeInsets.only(top: 10),
// //       padding: EdgeInsets.all(5),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           IconButton(
// //             icon: Icon(
// //               Icons.shuffle,
// //               color: Colors.grey,
// //               size: 35,
// //             ),
// //             onPressed: null,
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.skip_previous,
// //               color: Colors.black,
// //               size: 40,
// //             ),
// //             onPressed: null,
// //           ),
// //           ElevatedButton(
// //             onPressed: onPlayPause,
// //             child: Container(
// //               padding: EdgeInsets.all(10),
// //               child: Icon(
// //                 isPlaying ? Icons.pause : Icons.play_arrow,
// //                 color: Colors.black,
// //                 size: 40.0,
// //               ),
// //             ),
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: Colors.white,
// //               shape: CircleBorder(),
// //               side: BorderSide(
// //                 width: 1.0,
// //                 color: Colors.grey,
// //               ),
// //             ),
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.skip_next,
// //               color: Colors.black,
// //               size: 40,
// //             ),
// //             onPressed: null,
// //           ),
// //           IconButton(
// //             icon: Icon(
// //               Icons.repeat,
// //               color: Colors.grey,
// //               size: 35,
// //             ),
// //             onPressed: null,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
