import 'dart:async';
import 'package:credicxo/models/detail_track_model.dart';
import 'package:credicxo/models/lyrics_model.dart';
import 'package:credicxo/models/track_model.dart';
import 'package:credicxo/resources/track_api_provider.dart';


class Repository {
  final trackApiProvider = TrackApiProvider();
  Future<TrackModel> fetchAllTrack() => trackApiProvider.fetchTrackList();
  Future<DetailTrackModel> fetchDetailTrack(trackId) => trackApiProvider.fetchTrackDetails(trackId);
  Future<LyricsTrackModel> fetchTrackLyrics(trackId) => trackApiProvider.fetchTrackLyrics(trackId);

}