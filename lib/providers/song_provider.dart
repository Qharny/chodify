import 'package:flutter/material.dart';
import '../models/song.dart';

class SongProvider with ChangeNotifier {
  List<Song> _songs = [];

  List<Song> get songs => _songs;

  void loadSongs(List<Song> songs) {
    _songs = songs;
    notifyListeners();
  }
}
