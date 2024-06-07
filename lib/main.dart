import 'package:chodify/screen/song_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/chord_provider.dart';
import 'providers/song_provider.dart';
import 'models/song.dart';
import 'models/chord.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChordProvider()),
        ChangeNotifierProvider(create: (context) => SongProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  void _loadSongs() {
    final List<Song> songs = [
      Song(
        title: 'Song 1',
        url: 'https://www.example.com/song1.mp3',
        chords: [
          Chord(name: 'C', startTime: Duration(seconds: 0), endTime: Duration(seconds: 4)),
          Chord(name: 'G', startTime: Duration(seconds: 4), endTime: Duration(seconds: 8)),
        ],
      ),
      // Add more songs as needed
    ];

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final songProvider = Provider.of<SongProvider>(context, listen: false);
      songProvider.loadSongs(songs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chord Player',
      home: SongListScreen(),
    );
  }
}