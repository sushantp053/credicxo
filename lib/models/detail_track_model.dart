class DetailTrackModel {
  final Message message;

  DetailTrackModel({this.message});

  factory DetailTrackModel.fromJson(Map<String, dynamic> parsedJson){
    return DetailTrackModel(message: Message.fromJson(parsedJson["message"]));
  }
}

class Message {
  final TrackDetails trackBody;

  Message({this.trackBody});

  factory Message.fromJson(Map<String, dynamic> parsedJson) {
    return Message(trackBody: TrackDetails.fromJson(parsedJson["body"]));
  }
}

class TrackDetails {
  final TrackDescp track;

  TrackDetails({
    this.track,
  });

  factory TrackDetails.fromJson(Map<String, dynamic> parsedJson) {
    return TrackDetails( track: TrackDescp.fromJson(parsedJson["track"]));
  }
}
class TrackDescp{
  final int track_id;
  final int track_rating;
  final String track_name;
  final int commontrack_id;
  final int instrumental;
  final int explicit;
  final int artist_id;
  final String album_name;
  final String artist_name;
  final String track_share_url;

  TrackDescp({this.track_id, this.track_rating, this.track_name, this.commontrack_id, this.instrumental, this.explicit, this.artist_id, this.album_name, this.artist_name, this.track_share_url});

  factory TrackDescp.fromJson(Map<String, dynamic> parsedJson) {
    return TrackDescp(
        track_id: parsedJson['track_id'],
        track_name: parsedJson['track_name'],
        commontrack_id: parsedJson['commontrack_id'],
        instrumental: parsedJson['instrumental'],
        explicit: parsedJson['explicit'],
        artist_id: parsedJson['artist_id'],
        album_name: parsedJson['album_name'],
        artist_name: parsedJson['artist_name'],
        track_share_url: parsedJson['track_share_url'],
        track_rating: parsedJson['track_rating']);
  }

}