

import 'package:BFast/views/mode2%20views/wasp.dart';

import '../bfast-game.dart';

class WaspSpawnerController {
  final BFast game;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxWaspsOnScreen = 7;
  int currentInterval;
  int nextSpawn;

  WaspSpawnerController(this.game){
    start();
    game.spawnWasp();
  }

  void start() {
    // killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    game.wasps.forEach((Wasp wasp) => wasp.isDead = true);
  }

  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    int livingWasps = 0;
    game.wasps.forEach((Wasp wasp) {
      if (!wasp.isDead) livingWasps += 1;
    });

    if (nowTimestamp >= nextSpawn && livingWasps < maxWaspsOnScreen) {
      game.spawnWasp();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }
      nextSpawn = nowTimestamp + currentInterval;
    }
  }
}