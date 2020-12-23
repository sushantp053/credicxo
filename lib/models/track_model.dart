class TrackModel {
  final Message message;

  TrackModel({this.message});

  factory TrackModel.fromJson(Map<String, dynamic> parsedJson){
    return TrackModel(message: Message.fromJson(parsedJson["message"]));
  }
}

class Message {
  final TrackBody trackBody;

  Message({this.trackBody});

  factory Message.fromJson(Map<String, dynamic> parsedJson) {
    return Message(trackBody: TrackBody.fromJson(parsedJson["body"]));
  }
}

class TrackBody {
  final List<Track> trackList;

  TrackBody({
    this.trackList,
  });

  factory TrackBody.fromJson(Map<String, dynamic> parsedJson) {
    return TrackBody( trackList: parseTrack(parsedJson));
  }

  static List<Track> parseTrack(imagesJson) {
    var list = imagesJson['track_list'] as List;
    List<Track> imagesList =
    list.map((data) => Track.fromJson(data)).toList();
    return imagesList;
  }
}
class Track{
  final TrackData trackItem;

  Track({this.trackItem});

  factory Track.fromJson(Map<String, dynamic> parsedJson) {
    return Track(trackItem: TrackData.fromJson(parsedJson["track"]));
  }
}
class TrackData{
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

  TrackData({this.track_id, this.track_rating, this.track_name, this.commontrack_id, this.instrumental, this.explicit, this.artist_id, this.album_name, this.artist_name, this.track_share_url});

  factory TrackData.fromJson(Map<String, dynamic> parsedJson) {
    return TrackData(
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