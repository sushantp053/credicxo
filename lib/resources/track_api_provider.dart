import 'dart:async';
import 'package:credicxo/models/detail_track_model.dart';
import 'package:credicxo/models/lyrics_model.dart';
import 'package:credicxo/models/track_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class TrackApiProvider {
  Client client = Client();

  Future<TrackModel> fetchTrackList() async {
    final response = await client
        .get("https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
    if (response.statusCode == 200) {
      return TrackModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<DetailTrackModel> fetchTrackDetails(int trackId) async {
    print("Track finding $trackId");
    final response = await client
        .get("https://api.musixmatch.com/ws/1.1/track.get?track_id=$trackId&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
    if (response.statusCode == 200) {
      return DetailTrackModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
  Future<LyricsTrackModel> fetchTrackLyrics(int trackId) async {
    print("Track finding $trackId");
    final response = await client
        .get("https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=2d782bc7a52a41ba2fc1ef05b9cf40d7");
    if (response.statusCode == 200) {
      return LyricsTrackModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}