import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

class Music {
  Music._();
  static playBackgroundMusic() async {
    try {
      AudioPlayer audioPlayer = AudioPlayer();

      await audioPlayer.play(
        AssetSource('music/zelda_theme.mp3'),
        volume: 0.1,
        ctx: AudioContext(
          android: AudioContextAndroid(
            audioFocus: AndroidAudioFocus.gain,
            audioMode: AndroidAudioMode.normal,
            contentType: AndroidContentType.music,
          ),
        ),
      );
      await audioPlayer.setVolume(0.1);
    } catch (e) {
      log('error on MusicReproductor:$e');
    }
  }

  static touchButton() {
    AudioPlayer audioPlayer = AudioPlayer();
    audioPlayer.play(AssetSource('music/accetp_sound.mp3'));
  }
}
