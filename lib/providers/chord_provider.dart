// lib/providers/chord_provider.dart
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/chord.dart';

class ChordProvider with ChangeNotifier {
  List<Chord> _chords = [];
  AudioPlayer _audioPlayer = AudioPlayer();
  Duration _currentPosition = Duration.zero;

  List<Chord> get chords => _chords;
  Duration get currentPosition => _currentPosition;

  void loadChords(List<Chord> chords) {
    _chords = chords;
    notifyListeners();
  }

  void playSong(String songUrl) {
    _audioPlayer.play(songUrl);
    _audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      _currentPosition = duration;
      notifyListeners();
    });
  }

  void stopSong() {
    _audioPlayer.stop();
    _currentPosition = Duration.zero;
    notifyListeners();
  }
}
