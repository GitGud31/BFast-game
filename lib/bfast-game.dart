import 'dart:math';
import 'dart:ui';

//TODO: Make one export file of each folder
import 'package:BFast/components/buttons/credits-button.dart';
import 'package:BFast/components/buttons/how-to-play-button.dart';
import 'package:BFast/components/displays/lives-display.dart';
import 'package:BFast/components/background-models/mode2background.dart.dart';
import 'package:BFast/components/buttons/play-again-button.dart';
import 'package:BFast/components/buttons/return-home-button.dart';
import 'package:BFast/components/buttons/start-game-button.dart';
import 'package:BFast/controllers/bee-spawner-controller.dart';
import 'package:BFast/controllers/random-timer-controller.dart';
import 'package:BFast/controllers/stopwatch-controller.dart';
import 'package:BFast/modes.dart';
import 'package:BFast/views/mode1%20views/mode1-click-view.dart';
import 'package:BFast/views/credits-view.dart';
import 'package:BFast/views/get-ready-view.dart';
import 'package:BFast/views/home-view.dart';
import 'package:BFast/components/buttons/mode1-button.dart';
import 'package:BFast/views/how-to-play-view.dart';
import 'package:BFast/views/mode1%20views/mode1-too-soon-view.dart';
import 'package:BFast/views/mode2%20views/lost-view.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/background-models/background.dart';
import 'components/background-models/mode3background.dart';
import 'components/bees-models/bee.dart';
import 'components/bees-models/bee1.dart';
import 'components/bees-models/bee2.dart';
import 'components/bees-models/bee3.dart';
import 'components/bees-models/bee4.dart';
import 'components/bees-models/bee5.dart';
import 'components/displays/display-highscore.dart';
import 'components/buttons/mode2-button.dart';
import 'components/buttons/mode3-button.dart';
import 'components/buttons/mode4-button.dart';
import 'components/displays/score-display.dart';
import 'components/wasps-models/wasp1.dart';
import 'components/wasps-models/wasp2.dart';
import 'components/wasps-models/wasp3.dart';
import 'components/wasps-models/wasp4.dart';
import 'components/wasps-models/wasp5.dart';
import 'controllers/wasp-spawner-controller.dart';
import 'views.dart';
import 'views/mode1 views/mode1-score-view.dart';
import 'views/mode1 views/mode1-wait-view.dart';
import 'components/wasps-models/wasp.dart';

class BFast extends Game {
  //Screen
  Size screenSize;
  double tileSize;

  Random random;
  int scoreMode2;
  int scoreMode3;
  int lives;
  bool isHandled = false;

  //Controllers
  RandomTimerController randomTimerController;
  StopwatchController stopwatchController;
  WaspSpawnerController waspSpawnerController;
  BeeSpawnerController beeSpawnerController;

  //
  List<Wasp> wasps;
  List<Bee> bees;

  //Shared preferences
  final SharedPreferences scoreSaveMode2;
  final SharedPreferences scoreSaveMode3;

  //Views
  //TODO: change back to home
  Views activeView = Views.home;
  Modes activeMode = Modes.mode0;
  Background background;
  HomeView homeView;
  GetReadyView getReadyView;
  WaitView waitView;
  ClickView clickView;
  TooSoonView tooSoonView;
  ScoreView scoreView;
  HowToPlayView howToPlayView;
  CreditsView creditsView;
  Mode2background mode2Background;
  Mode3Background mode3Background;
  LostView lostView;

  //buttons
  Mode1Button mode1Button;
  Mode2Button mode2Button;
  Mode3Button mode3Button;
  Mode4Button mode4Button;
  ReturnHomeButton returnHomeButton;
  StartGameButton startGameButton;
  PlayAgainButton playAgainButton;
  HowToPlayButton howToPlayButton;
  CreditsButton creditsButton;

  //score
  ScoreDisplay scoreDisplay;
  HighscoreDisplay highscoreDisplay;
  LivesDisplay livesDisplay;

  BFast(this.scoreSaveMode2, this.scoreSaveMode3) {
    initialize();
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    // super.resize(size);
  }

  void spawnWasp() {
    double x = random.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y =
        (random.nextDouble() * (screenSize.height - (tileSize * 2.025))) +
            (tileSize * 1.5);

    switch (random.nextInt(5)) {
      case 0:
        wasps.add(Wasp1(this, x, y));
        break;
      case 1:
        wasps.add(Wasp2(this, x, y));
        break;
      case 2:
        wasps.add(Wasp3(this, x, y));
        break;
      case 1:
        wasps.add(Wasp4(this, x, y));
        break;
      case 4:
        wasps.add(Wasp5(this, x, y));
        break;
    }
  }

  void spawnBee() {
    double x = random.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y =
        (random.nextDouble() * (screenSize.height - (tileSize * 2.025))) +
            (tileSize * 1.5);

    switch (random.nextInt(5)) {
      case 0:
        bees.add(Bee1(this, x, y));
        break;
      case 1:
        bees.add(Bee2(this, x, y));
        break;
      case 2:
        bees.add(Bee3(this, x, y));
        break;
      case 1:
        bees.add(Bee4(this, x, y));
        break;
      case 4:
        bees.add(Bee5(this, x, y));
        break;
    }
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);

    //HOME
    if (activeView == Views.home) {
      homeView.render(canvas);

      mode1Button.render(canvas);
      mode2Button.render(canvas);
      mode3Button.render(canvas);
      mode4Button.render(canvas);
      howToPlayButton.render(canvas);
      creditsButton.render(canvas);
    }

    //GET READY
    if (activeView == Views.getReady) {
      getReadyView.render(canvas);
      returnHomeButton.render(canvas);
      startGameButton.render(canvas);
    }

    //WAIT
    if (activeView == Views.wait) waitView.render(canvas);

    //CLICK
    if (activeView == Views.click) {
      stopwatchController.startStopwatch();
      clickView.render(canvas);
    }

    //TOO SOON
    if (activeView == Views.tooSoon) {
      tooSoonView.render(canvas);
      returnHomeButton.render(canvas);
      playAgainButton.render(canvas);
    }

    //SCORE
    if (activeView == Views.score) {
      scoreView.render(canvas);
      returnHomeButton.render(canvas);
      playAgainButton.render(canvas);
    }

    //HOW TO PLAY
    if (activeView == Views.howToPlay) howToPlayView.render(canvas);

    //CREDITS
    if (activeView == Views.credits) creditsView.render(canvas);

    //PLAYING
    if (activeView == Views.playing) {
      if (activeMode == Modes.mode2) {
        mode2Background.render(canvas);
        wasps.forEach((Wasp wasp) => wasp.render(canvas));
        scoreDisplay.render(canvas);
        highscoreDisplay.render(canvas);
        livesDisplay.render(canvas);
      }
      if (activeMode == Modes.mode3) {
        mode3Background.render(canvas);
        bees.forEach((Bee bee) => bee.render(canvas));
        wasps.forEach((Wasp wasp) => wasp.render(canvas));
        scoreDisplay.render(canvas);
        highscoreDisplay.render(canvas);
        livesDisplay.render(canvas);
      }
    }

    //LOST
    if (activeView == Views.lost) {
      lostView.render(canvas);
      returnHomeButton.render(canvas);
      playAgainButton.render(canvas);
    }
  }

  @override
  void update(double t) {
    //SCORE
    if (activeView == Views.playing) {
      scoreDisplay.update(t);
      livesDisplay.update(t);
      //TODO: investigate for mode 3
    }

    //WAIT
    if (activeView == Views.wait) waitView.update(t);

    //CLICK
    if (activeView == Views.click) clickView.update(t);

    //GET READY
    if (activeView == Views.getReady) getReadyView.update(t);

    //TOO SOON
    if (activeView == Views.tooSoon) tooSoonView.update(t);

    //SCORE
    if (activeView == Views.score) scoreView.update(t);

    //HOW TO PLAY
    if (activeView == Views.howToPlay) howToPlayView.update(t);

    //CREDITS
    if (activeView == Views.credits) creditsView.update(t);

    //RANDOM TIMER
    randomTimerController.update(t);

    //STOPWATCH
    stopwatchController.update(t);

    //PLAYING (MODE 2)
    if (activeView == Views.playing) {
      waspSpawnerController.update(t);
      wasps.forEach((Wasp wasp) => wasp.update(t));
      wasps.removeWhere((Wasp wasp) => wasp.isOffScreen);
    }

    //LOST (MODE 2)
    if (activeView == Views.lost) {
      lostView.update(t);
      wasps.forEach((Wasp wasp) => wasp.isDead = true);
      wasps.removeWhere((Wasp wasp) => wasp.isOffScreen);
    }

    //PLAYING (MODE 3)
    if (activeView == Views.playing) {
      beeSpawnerController.update(t);
      bees.forEach((Bee bees) => bees.update(t));
      bees.removeWhere((Bee bees) => bees.isOffScreen);
    }

    //LOST (MODE 3)
    if (activeView == Views.lost) {
      lostView.update(t);
      bees.forEach((Bee bee) => bee.isDead = true);
      bees.removeWhere((Bee bee) => bee.isOffScreen);
      //TODO: kill all bees
    }
  }

  void initialize() async {
    random = Random();
    scoreMode2 = 0;
    scoreMode3 = 0;
    lives = 3;
    wasps = List<Wasp>();
    bees = List<Bee>();

    resize(await Flame.util.initialDimensions());

    //score
    scoreDisplay = ScoreDisplay(this);
    highscoreDisplay = HighscoreDisplay(this);
    livesDisplay = LivesDisplay(this);

    //init controllers
    randomTimerController = RandomTimerController(this);
    stopwatchController = StopwatchController(this);
    waspSpawnerController = WaspSpawnerController(this);
    beeSpawnerController = BeeSpawnerController(this);

    //init views
    background = Background(this);
    mode2Background = Mode2background(this);
    mode3Background = Mode3Background(this);
    homeView = HomeView(this);
    getReadyView = GetReadyView(this);
    waitView = WaitView(this);
    clickView = ClickView(this);
    tooSoonView = TooSoonView(this);
    scoreView = ScoreView(this);
    howToPlayView = HowToPlayView(this);
    creditsView = CreditsView(this);
    lostView = LostView(this);

    //init buttons
    mode1Button = Mode1Button(this);
    mode2Button = Mode2Button(this);
    mode3Button = Mode3Button(this);
    mode4Button = Mode4Button(this);
    returnHomeButton = ReturnHomeButton(this);
    startGameButton = StartGameButton(this);
    playAgainButton = PlayAgainButton(this);
    howToPlayButton = HowToPlayButton(this);
    creditsButton = CreditsButton(this);
  }

  void onTapDown(TapDownDetails d) {
    isHandled = false;

    //Wasps
    waspOnTapDownHandler(d);

    //Dialog boxes view
    dialBoxOnTapDownHandler(d);

    //Click view
    clickViewOnTapDownHandler(d);

    //Wait view
    waitViewOnTapDownHandler(d);

    //Mode 1 button
    mode1ButtonOnTapDownHandler(d);

    //Mode 2 button
    mode2ButtonOnTapDownHandler(d);

    //Mode 3 button
    mode3ButtonOnTapDownHandler(d);

    //Mode 4 button
    mode4ButtonOnTapDownHandler(d);

    //Return Home button
    returnHomeButtonOnTapDownHandler(d);

    //Start Game button
    startGameButtonOnTapDownHandler(d);

    //Play again button
    playAgainButtonOnTapDownHandler(d);

    //How To Play button
    howToPlayButtonOnTapDownHandler(d);

    //Credits button
    creditsButtonOnTapDownHandler(d);
  }

  void waspOnTapDownHandler(TapDownDetails d) {
    if (!isHandled) {
      bool didHitWasp = false;
      wasps.forEach((Wasp wasp) {
        if (wasp.waspRect.contains(d.globalPosition)) {
          wasp.onTapDown();
          isHandled = true;
          didHitWasp = true;
        }
      });
      if (activeView == Views.playing && !didHitWasp) {
        //TODO: Implement SOUND

        //TODO: add life loss check for mode3
        lives -= 1;
        if (lives == 0) activeView = Views.lost;
      }
    }
  }

  void dialBoxOnTapDownHandler(TapDownDetails d) {
    if (!isHandled) {
      if (activeView == Views.howToPlay || activeView == Views.credits) {
        activeView = Views.home;
        isHandled = true;
      }
    }
  }

  void clickViewOnTapDownHandler(TapDownDetails d) {
    if (!isHandled) {
      if (activeView == Views.click) {
        clickView.onTapDown();
        isHandled = true;
      }
    }
  }

  void waitViewOnTapDownHandler(TapDownDetails d) {
    if (!isHandled) {
      if (activeView == Views.wait) {
        waitView.onTapDown();
        isHandled = true;
      }
    }
  }

  void mode1ButtonOnTapDownHandler(TapDownDetails d) {
    if (!isHandled && mode1Button.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        activeMode = Modes.mode1;
        mode1Button.onTapDown();
        isHandled = true;
      }
    }
  }

  void mode2ButtonOnTapDownHandler(TapDownDetails d) {
    if (!isHandled && mode2Button.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        activeMode = Modes.mode2;
        mode2Button.onTapDown();
        isHandled = true;
      }
    }
  }

  void mode3ButtonOnTapDownHandler(TapDownDetails d) {
    if (!isHandled && mode3Button.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        activeMode = Modes.mode3;
        mode3Button.onTapDown();
        isHandled = true;
      }
    }
  }

  void mode4ButtonOnTapDownHandler(TapDownDetails d) {
    if (!isHandled && mode4Button.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        activeMode = Modes.mode4;
        mode4Button.onTapDown();
        isHandled = true;
      }
    }
  }

  void returnHomeButtonOnTapDownHandler(TapDownDetails d) {
    if (!isHandled && returnHomeButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.getReady ||
          activeView == Views.tooSoon ||
          activeView == Views.score ||
          activeView == Views.lost) {
        returnHomeButton.onTapDown();
        isHandled = true;
      }
    }
  }

  void startGameButtonOnTapDownHandler(TapDownDetails d) {
    if (!isHandled && startGameButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.getReady) {
        startGameButton.onTapDown();
        isHandled = true;
      }
    }
  }

  void playAgainButtonOnTapDownHandler(TapDownDetails d) {
    //TODO: add mode check
    if (!isHandled && playAgainButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.score ||
          activeView == Views.tooSoon ||
          activeView == Views.lost) {
        playAgainButton.onTapDown();
        isHandled = true;
      }
    }
  }

  void howToPlayButtonOnTapDownHandler(TapDownDetails d) {
    if (!isHandled && howToPlayButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        howToPlayButton.onTapDown();
        isHandled = true;
      }
    }
  }

  void creditsButtonOnTapDownHandler(TapDownDetails d) {
    if (!isHandled && creditsButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        creditsButton.onTapDown();
        isHandled = true;
      }
    }
  }

  //
}
