// import 'package:audioplayers/audioplayers.dart';
// import 'package:coran/models/sourates.dart';
// import 'package:coran/services/coran_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class AudioScreen extends StatelessWidget {
//   final Sourate selectedSourate;

//   const AudioScreen({super.key, required this.selectedSourate});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             HeaderSection(selectedSourate: selectedSourate),
//             PlayListSection(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomSection(),
//     );
//   }
// }

// class HeaderSection extends StatelessWidget {
//   final Sourate selectedSourate;

//   HeaderSection({required this.selectedSourate});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       decoration: BoxDecoration(
//         color: Colors.red,
//         image: DecorationImage(
//           image: AssetImage('assets/images/coran.png'),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(50),
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             left: 20,
//             bottom: 30,
//             child: Text(
//               selectedSourate.englishName,
//               style: GoogleFonts.arizonia(
//                 color: Colors.white,
//                 fontSize: 43,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//           ),
//           Positioned(
//             right: 0,
//             bottom: 20,
//             child: MaterialButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PlayerPage(sourate: selectedSourate),
//                   ),
//                 );
//               },
//               color: Colors.blue,
//               shape: CircleBorder(),
//               child: Padding(
//                 padding: EdgeInsets.all(17),
//                 child: Icon(
//                   Icons.play_arrow_rounded,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PlayListSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(30, 40, 20, 20),
//       child: FutureBuilder<List<Sourate>>(
//         future: Provider.of<SourateProvider>(context, listen: false).getAllSourates(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Erreur: ${snapshot.error}');
//           } else if (snapshot.hasData) {
//             final sourates = snapshot.data!;
//             return Column(
//               children: sourates.map((sourate) {
//                 return ListTile(
//                   title: Text(
//                     sourate.englishName,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   subtitle: Text('${sourate.numberOfAyahs} versets'),
//                   trailing: Icon(Icons.more_vert, color: Colors.grey),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AudioScreen(selectedSourate: sourate),
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             );
//           } else {
//             return Text('Aucune sourate trouvée');
//           }
//         },
//       ),
//     );
//   }
// }

// class BottomSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.blue,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.pause,
//             color: Colors.white,
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Text(
//             "Lecture en cours",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 13,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.arrow_circle_up,
//             color: Colors.white,
//           ),
//           label: '',
//         ),
//       ],
//     );
//   }
// }

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
//       // _audioPlayer.play(UrlSource(widget.sourate.audio));
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
//       child: Stack(
//         children: [
//           TitleSection(sourate: sourate),
//           ArtistPictureSection(),
//         ],
//       ),
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
//             sourate.englishName,
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
//                       Colors.blue.withOpacity(1), BlendMode.dstATop),
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
//       margin: EdgeInsets.symmetric(horizontal: 40),
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             // color: Colors.grey.withOpacity

//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             icon: Icon(
//               isPlaying ? Icons.pause : Icons.play_arrow,
//               size: 50,
//               color: Colors.blue,
//             ),
//             onPressed: onPlayPause,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:audioplayers/audioplayers.dart';
import 'package:coran/models/sourates.dart';
import 'package:coran/services/coran_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AudioScreen extends StatelessWidget {
  final Sourate selectedSourate;

  const AudioScreen({super.key, required this.selectedSourate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(selectedSourate: selectedSourate),
            PlayListSection(onSourateSelected: (sourate) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerPage(sourate: sourate),
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomSection(),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final Sourate selectedSourate;

  HeaderSection({required this.selectedSourate});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage('assets/images/coran.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            bottom: 30,
            child: Text(
              selectedSourate.englishName,
              style: GoogleFonts.arizonia(
                color: Colors.white,
                fontSize: 43,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerPage(sourate: selectedSourate),
                  ),
                );
              },
              color: Colors.blue,
              shape: CircleBorder(),
              child: Padding(
                padding: EdgeInsets.all(17),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayListSection extends StatelessWidget {
  final Function(Sourate) onSourateSelected;

  PlayListSection({required this.onSourateSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 40, 20, 20),
      child: FutureBuilder<List<Sourate>>(
        future:Provider.of<SourateProvider>(context, listen: false).getAllSourates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final sourates = snapshot.data!;
            return Column(
              children: sourates.map((sourate) {
                return ListTile(
                  title: Text(
                    sourate.englishName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text('${sourate.numberOfAyahs} versets'),
                  trailing: Icon(Icons.more_vert, color: Colors.grey),
                  onTap: () {
                    onSourateSelected(sourate);
                  },
                );
              }).toList(),
            );
          } else {
            return Text('Aucune sourate trouvée');
          }
        },
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.pause,
            color: Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text(
            "Lecture en cours",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.arrow_circle_up,
            color: Colors.white,
          ),
          label: '',
        ),
      ],
    );
  }
}

class PlayerPage extends StatefulWidget {
  final Sourate sourate;

  PlayerPage({required this.sourate});

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      // _audioPlayer.play(UrlSource(widget.sourate.));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Add the rest of your UI elements here
          // Text(
          //   widget.sourate.lecteur,  // Display the name of the reader
          //   style: TextStyle(fontSize: 24),
          // ),
          PlayerControl(
            onPlayPause: _playPause,
            isPlaying: isPlaying,
          ),
        ],
      ),
    );
  }
}

class PlayerControl extends StatelessWidget {
  final VoidCallback onPlayPause;
  final bool isPlaying;

  PlayerControl({required this.onPlayPause, required this.isPlaying});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 50,
              color: Colors.blue,
            ),
            onPressed: onPlayPause,
          ),
        ],
      ),
    );
  }
}

// import 'package:audioplayers/audioplayers.dart';
// import 'package:coran/models/sourates.dart';
// import 'package:coran/services/coran_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// class AudioScreen extends StatelessWidget {
//   final Sourate selectedSourate;

//   const AudioScreen({super.key, required this.selectedSourate});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             HeaderSection(selectedSourate: selectedSourate),
//             PlayListSection(onSourateSelected: (sourate) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PlayerPage(sourate: sourate),
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomSection(),
//     );
//   }
// }

// class HeaderSection extends StatelessWidget {
//   final Sourate selectedSourate;

//   HeaderSection({required this.selectedSourate});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       decoration: BoxDecoration(
//         color: Colors.red,
//         image: DecorationImage(
//           image: AssetImage('assets/images/coran.png'),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(50),
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             left: 20,
//             bottom: 30,
//             child: Text(
//               selectedSourate.englishName,
//               style: GoogleFonts.arizonia(
//                 color: Colors.white,
//                 fontSize: 43,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//           ),
//           Positioned(
//             right: 0,
//             bottom: 20,
//             child: MaterialButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PlayerPage(sourate: selectedSourate),
//                   ),
//                 );
//               },
//               color: Colors.blue,
//               shape: CircleBorder(),
//               child: Padding(
//                 padding: EdgeInsets.all(17),
//                 child: Icon(
//                   Icons.play_arrow_rounded,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PlayListSection extends StatelessWidget {
//   final Function(Sourate) onSourateSelected;

//   PlayListSection({required this.onSourateSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(30, 40, 20, 20),
//       child: FutureBuilder<List<Sourate>>(
//         future: Provider.of<SourateProvider>(context, listen: false).getAllSourates(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Erreur: ${snapshot.error}');
//           } else if (snapshot.hasData) {
//             final sourates = snapshot.data!;
//             return Column(
//               children: sourates.map((sourate) {
//                 return ListTile(
//                   title: Text(
//                     sourate.englishName,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   subtitle: Text('${sourate.numberOfAyahs} versets'),
//                   trailing: Icon(Icons.more_vert, color: Colors.grey),
//                   onTap: () {
//                     onSourateSelected(sourate);
//                   },
//                 );
//               }).toList(),
//             );
//           } else {
//             return Text('Aucune sourate trouvée');
//           }
//         },
//       ),
//     );
//   }
// }

// class BottomSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.blue,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.pause,
//             color: Colors.white,
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Text(
//             "Lecture en cours",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 13,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.arrow_circle_up,
//             color: Colors.white,
//           ),
//           label: '',
//         ),
//       ],
//     );
//   }
// }


// class PlayerPage extends StatefulWidget {
//   final Sourate sourate;

//   PlayerPage({required this.sourate});

//   @override
//   _PlayerPageState createState() => _PlayerPageState();
// }

// class _PlayerPageState extends State<PlayerPage> {
//   late AudioPlayer _audioPlayer;
//   bool isPlaying = false;
//   int selectedAudioIndex = 0;

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
//       // _audioPlayer.play(UrlSource(widget.sourate.audio[selectedAudioIndex]));
//     }
//     setState(() {
//       isPlaying = !isPlaying;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Your existing PlayerPage layout
//       body: Column(
//         children: [
//           // Other UI elements
//           DropdownButton<int>(
//             value: selectedAudioIndex,
//             items: List.generate(widget.sourate.audio.length, (index) {
//               return DropdownMenuItem<int>(
//                 value: index,
//                 child: Text('Lecteur ${index + 1}'),
//               );
//             }),
//             onChanged: (int? newIndex) {
//               if (newIndex != null) {
//                 setState(() {
//                   selectedAudioIndex = newIndex;
//                   isPlaying = false;
//                 });
//               }
//             },
//           ),
//           // Play/Pause button and other controls
//         ],
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
//       child: Stack(
//         children: [
//           TitleSection(sourate: sourate),
//           ArtistPictureSection(),
//         ],
//       ),
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
//             sourate.englishName,
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
//                       Colors.blue.withOpacity(1), BlendMode.dstATop),
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
//       margin: EdgeInsets.symmetric(horizontal: 40),
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           IconButton(
//             icon: Icon(
//               isPlaying ? Icons.pause : Icons.play_arrow,
//               size: 50,
//               color: Colors.blue,
//             ),
//             onPressed: onPlayPause,
//           ),
//         ],
//       ),
//     );
//   }
// }

