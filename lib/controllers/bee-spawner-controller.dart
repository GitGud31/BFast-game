import 'package:BFast/components/bees-models/bee.dart';
import 'package:BFast/components/wasps-models/wasp.dart';

import '../bfast-game.dart';

class BeeSpawnerController {
  final BFast game;

  //The upper limit on when to spawn bees.
  final int maxSpawnInterval = 1700;

  //The lower limit on when to spawn bees.
  final int minSpawnInterval = 350;
  final int intervalChange = 3;
  final int maxBeesOnScreen = 4;
  int currentInterval;
  int nextSpawn;

  BeeSpawnerController(this.game) {
    start();
    game.spawnBee();
  }

  void start() {
    // killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    game.bees.forEach((Bee bee) => bee.isDead = true);
  }

  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    int livingBees = 0;
    game.bees.forEach((Bee bee) {
      if (!bee.isDead) livingBees += 1;
    });

    if (nowTimestamp >= nextSpawn && livingBees < maxBeesOnScreen) {
      game.spawnBee();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .04).toInt();
      }
      nextSpawn = nowTimestamp + currentInterval;
    }
  }
}
