class LyricsTrackModel {
  final Message message;

  LyricsTrackModel({this.message});

  factory LyricsTrackModel.fromJson(Map<String, dynamic> parsedJson){
    return LyricsTrackModel(message: Message.fromJson(parsedJson["message"]));
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
  final Lyrics track;

  TrackDetails({
    this.track,
  });

  factory TrackDetails.fromJson(Map<String, dynamic> parsedJson) {
    return TrackDetails( track: Lyrics.fromJson(parsedJson["lyrics"]));
  }
}
class Lyrics{
  final int lyrics_id;
  final String lyrics_body;
  final int explicit;
  final String script_tracking_url;
  final String pixel_tracking_url;
  final String lyrics_copyright;

  Lyrics({this.lyrics_id, this.lyrics_body,this.explicit, this.script_tracking_url, this.pixel_tracking_url, this.lyrics_copyright});

  factory Lyrics.fromJson(Map<String, dynamic> parsedJson) {
    return Lyrics(
        lyrics_id: parsedJson['lyrics_id'],
        lyrics_body: parsedJson['lyrics_body'],
        explicit: parsedJson['explicit'],
        script_tracking_url: parsedJson['script_tracking_url'],
        pixel_tracking_url: parsedJson['pixel_tracking_url'],
        lyrics_copyright: parsedJson['lyrics_copyright'],);
  }

}