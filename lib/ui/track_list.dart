import 'package:credicxo/blocs/track_bloc.dart';
import 'package:credicxo/models/track_model.dart';
import 'package:credicxo/ui/track_details.dart';
import 'package:flutter/material.dart';

class TrackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllTracks();
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.allTrack,
        builder: (context, AsyncSnapshot<TrackModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<TrackModel> snapshot) {
    return  ListView.builder(
        itemCount: snapshot.data.message.trackBody.trackList.length,
        itemBuilder: (BuildContext context, int index) {
          // return Text("${snapshot.data.message.trackBody.trackList[index].trackItem.track_name}");
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackDetails(trackData: snapshot.data.message.trackBody.trackList[index].trackItem,)),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: const Icon(
                          Icons.library_music,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data.message.trackBody.trackList[index].trackItem.track_name}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            Text(
                              "${snapshot.data.message.trackBody.trackList[index].trackItem.album_name}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "${snapshot.data.message.trackBody.trackList[index].trackItem.artist_name}",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          );
        });
  }
}
