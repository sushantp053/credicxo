
import 'package:credicxo/models/repository.dart';
import 'package:credicxo/models/track_model.dart';
import 'package:rxdart/rxdart.dart';

class TracksBloc {
  final _repository = Repository();
  final _tracksFetcher = PublishSubject<TrackModel>();

  get allTrack => _tracksFetcher.stream;

  fetchAllTracks() async {
    TrackModel itemModel = await _repository.fetchAllTrack();
    _tracksFetcher.sink.add(itemModel);
  }

  dispose() {
    _tracksFetcher.close();
  }
}

final bloc = TracksBloc();