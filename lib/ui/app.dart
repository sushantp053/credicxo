import 'package:credicxo/blocs/network_bloc.dart';
import 'package:credicxo/state_event/network_event.dart';
import 'package:credicxo/state_event/network_state.dart';
import 'package:credicxo/ui/track_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Trending',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: BlocProvider(
          create: (context) => NetworkBloc()..add(ListenConnection()),
          child: HomeScreen(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if (state is ConnectionFailure) return Text("No Internet Connection");
          if (state is ConnectionSuccess)
            return TrackList();
          else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}