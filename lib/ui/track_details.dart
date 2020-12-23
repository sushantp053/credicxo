import 'package:credicxo/blocs/detail_track_block.dart';
import 'package:credicxo/blocs/network_bloc.dart';
import 'package:credicxo/models/detail_track_model.dart';
import 'package:credicxo/models/lyrics_model.dart';
import 'package:credicxo/models/track_model.dart';
import 'package:credicxo/state_event/network_event.dart';
import 'package:credicxo/state_event/network_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackDetails extends StatelessWidget {
  final TrackData trackData;

  const TrackDetails({Key key, this.trackData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Track Details',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocProvider(
          create: (context) => NetworkBloc()..add(ListenConnection()),
          child: TrackScreen(
            trackData: trackData,
          ),
        ),
      ),
    );
  }
}
class TrackScreen extends StatelessWidget {

  final TrackData trackData;

  const TrackScreen({Key key, this.trackData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if (state is ConnectionFailure) return Text("No Internet Connection");
         else
            return TrackfDetailsScreen(trackData: trackData,);
        },
      ),
    );
  }
}
class TrackfDetailsScreen extends StatelessWidget {
  final TrackData trackData;

  const TrackfDetailsScreen({Key key, this.trackData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    detailBloc.fetchDetailTracks(trackData.track_id);
    detailBloc.fetchTracksLyrics(trackData.track_id);
    return Scaffold(
      body: StreamBuilder(
        stream: detailBloc.detailTrack,
        builder: (context, AsyncSnapshot<DetailTrackModel> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text("${snapshot.data.message.trackBody.track.track_name}",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Artist",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text("${snapshot.data.message.trackBody.track.artist_name}",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Album Name",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text("${snapshot.data.message.trackBody.track.album_name}",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Explicit",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text("${snapshot.data.message.trackBody.track.explicit}",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Rating",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text("${snapshot.data.message.trackBody.track.track_rating}",
                    style: TextStyle(
                      fontSize: 18,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lyrics",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                StreamBuilder(
                    stream: detailBloc.lyricsTrack,
                    builder: (context, AsyncSnapshot<LyricsTrackModel> snap) {
                      if (snapshot.hasData) {
                        try {
                          return Text(
                              "${snap.data.message.trackBody.track.lyrics_body}",
                              style: TextStyle(
                                fontSize: 18,
                              ));
                        } catch (e) {
                          return Text("No Track Found");
                        }
                      } else {
                        return Text(snapshot.error.toString());
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
