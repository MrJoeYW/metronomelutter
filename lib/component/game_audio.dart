import 'package:audioplayers/audioplayers.dart';

class GameAudio {
  List<AudioPlayer> players = [];

  List<String>? files;
  int maxPlayers;

  GameAudio(this.maxPlayers, {this.files});

  Future init() async {
    for (int i = 0; i < maxPlayers; i++) {
      players.add(await _createNewPlayer());
    }
  }

  Future play(String file, {double volume = 1.0}) async {
    if (players.isNotEmpty) {
      if (players[0].state == PlayerState.playing) {
        await players[0].stop();
      }
      return players[0].play(AssetSource(file), volume: volume);
    }
  }

  Future stop() async {
    for (int i = 0; i < maxPlayers; i++) {
      await players[i].stop();
    }
  }

  Future<AudioPlayer> _createNewPlayer() async {
    final player = AudioPlayer();
    await player.setReleaseMode(ReleaseMode.stop);
    return player;
  }

  void clearAll() {
    players.forEach((player) {
      player.dispose();
    });
  }

  void disableLog() {
    // Logging is controlled at Library level in newer audioplayers
  }
}

