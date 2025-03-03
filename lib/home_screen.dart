import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:radio/player_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // late AudioPlayer player = AudioPlayer();

  @override
  // void initState() {
  //   super.initState();
  //
  //   // Create the audio player.
  //   player = AudioPlayer();
  //
  //   // Set the release mode to keep the source after playback has completed.
  //   player.setReleaseMode(ReleaseMode.stop);
  //
  //   // Start the player as soon as the app is displayed.
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     // await player.setSource(AssetSource('ambient_c_motion.mp3'));
  //     player.setSourceUrl("https://27873.live.streamtheworld.com/RADIO_MAKAN.mp3");
  //     // await player.resume();
  //   });
  // }
  @override
  // void dispose() {
  //   // Release all sources and dispose the player.
  //   player.dispose();
  //
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Player')),
      body: ElevatedButton(
        onPressed: () async {
          final player = AudioPlayer();
          String url = 'https://3vh.liveradiu.com:8000/192kp.mp3?1740680734195';
          Source source = UrlSource(url);
          try {
            await player.play(source);
            print("run");
          } catch (e) {
            print(e);
            print("xxxxx");
          }
        },
        child: Text("play"),
      ),
    );
  }
}

// The PlayerWidget is a copy of "/lib/components/player_widget.dart".
//#region PlayerWidget

//#endregion
