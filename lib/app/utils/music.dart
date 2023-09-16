import 'package:audioplayers/audioplayers.dart';

class Music {
  static playBackgroundMusic() async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(
      AssetSource('music/zelda_theme.mp3'),
      volume: 0.1,
      ctx: const AudioContext(
          android: AudioContextAndroid(
        audioFocus: AndroidAudioFocus.gain,
        audioMode: AndroidAudioMode.normal,
        contentType: AndroidContentType.music,
      )),
    );
    await audioPlayer.setVolume(0.1);
  }

  static touchButton() {
    AudioPlayer audioPlayer = AudioPlayer();
    audioPlayer.play(AssetSource('music/accetp_sound.mp3'));
  }
}
