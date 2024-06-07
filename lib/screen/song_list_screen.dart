// lib/song_list_screen.dart
import 'package:chodify/providers/chord_provider.dart';
import 'package:chodify/providers/song_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SongListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);
    final chordProvider = Provider.of<ChordProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Song List')),
      body: ListView.builder(
        itemCount: songProvider.songs.length,
        itemBuilder: (context, index) {
          final song = songProvider.songs[index];
          return ListTile(
            title: Text(song.title),
            onTap: () {
              chordProvider.loadChords(song.chords);
              chordProvider.playSong(song.url);
            },
          );
        },
      ),
    );
  }
}
