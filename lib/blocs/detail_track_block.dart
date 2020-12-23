import 'package:credicxo/models/detail_track_model.dart';
import 'package:credicxo/models/lyrics_model.dart';
import 'package:credicxo/models/repository.dart';
import 'package:rxdart/rxdart.dart';

class DetailTracksBloc {
  final _repository = Repository();
  final _tracksDetailFetcher = PublishSubject<DetailTrackModel>();
  final _lyricsFetcher = PublishSubject<LyricsTrackModel>();

  get detailTrack => _tracksDetailFetcher.stream;
  get lyricsTrack => _lyricsFetcher.stream;

  fetchDetailTracks(int trackId) async {
    DetailTrackModel itemModel = await _repository.fetchDetailTrack(trackId);
    _tracksDetailFetcher.sink.add(itemModel);
  }

  fetchTracksLyrics(int trackId) async {
    LyricsTrackModel itemModel = await _repository.fetchTrackLyrics(trackId);
    _lyricsFetcher.sink.add(itemModel);
  }

  dispose() {
    _tracksDetailFetcher.close();
    _lyricsFetcher.close();
  }
}

final detailBloc = DetailTracksBloc();
