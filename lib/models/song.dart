
import 'package:chodify/models/chord.dart';

class Song {
  final String title;
  final String url;
  final List<Chord> chords;

  Song({required this.title, required this.url, required this.chords});
}
