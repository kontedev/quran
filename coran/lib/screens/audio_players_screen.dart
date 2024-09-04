import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;
  final String verseText;
  final String verseNumber;

  AudioPlayerWidget({
    required this.audioUrl,
    required this.verseText,
    required this.verseNumber,
  });

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
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
      _audioPlayer.play(UrlSource(widget.audioUrl));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Verse ${widget.verseNumber}',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 5),
          Text(
            widget.verseText,
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.replay_10, color: Colors.white),
                onPressed: () {
                  final newPosition = position - Duration(seconds: 10);
                  _audioPlayer.seek(newPosition);
                },
              ),
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white),
                onPressed: _playPause,
              ),
              IconButton(
                icon: Icon(Icons.forward_10, color: Colors.white),
                onPressed: () {
                  final newPosition = position + Duration(seconds: 10);
                  _audioPlayer.seek(newPosition);
                },
              ),
            ],
          ),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) {
              final newPosition = Duration(seconds: value.toInt());
              _audioPlayer.seek(newPosition);
              setState(() {
                position = newPosition;
              });
            },
          ),
        ],
      ),
    );
  }
}
