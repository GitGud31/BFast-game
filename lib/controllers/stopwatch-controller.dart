import '../bfast-game.dart';

class StopwatchController {
  final BFast game;
  Stopwatch stopwatch;

  int get timeElapsed => stopwatch.elapsed.inMilliseconds;

  StopwatchController(this.game){
    stopwatch = Stopwatch();
  }

  void update(double timeDelta) {}

  void startStopwatch() {
    stopwatch.start();
  }

  void stopStopwatch() {
    stopwatch.stop();
  }

  void resetStopwatch(){
    stopwatch.reset();
  }

}
