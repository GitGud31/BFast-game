import 'dart:math';
import 'dart:ui';

import 'package:BFast/components/credits-button.dart';
import 'package:BFast/components/how-to-play-button.dart';
import 'package:BFast/components/long-grass-background.dart';
import 'package:BFast/components/play-again-button.dart';
import 'package:BFast/components/return-home-button.dart';
import 'package:BFast/components/start-game-button.dart';
import 'package:BFast/controllers/random-timer-controller.dart';
import 'package:BFast/controllers/stopwatch-controller.dart';
import 'package:BFast/views/mode1%20views/click-view.dart';
import 'package:BFast/views/credits-view.dart';
import 'package:BFast/views/get-ready-view.dart';
import 'package:BFast/views/home-view.dart';
import 'package:BFast/components/mode1-button.dart';
import 'package:BFast/views/hot-to-play-view.dart';
import 'package:BFast/views/mode1%20views/too-soon-view.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/gestures.dart';

import 'components/background.dart';
import 'components/mode2-button.dart';
import 'components/mode3-button.dart';
import 'components/mode4-button.dart';
import 'components/wasp1.dart';
import 'components/wasp2.dart';
import 'components/wasp3.dart';
import 'components/wasp4.dart';
import 'components/wasp5.dart';
import 'controllers/wasp-spawner-controller.dart';
import 'views.dart';
import 'views/mode1 views/score-view.dart';
import 'views/mode1 views/wait-view.dart';
import 'views/mode2 views/wasp.dart';

class BFast extends Game {
  //Screen
  Size screenSize;
  double tileSize;

  Random random;
  int score;

  //Controllers
  RandomTimerController randomTimerController;
  StopwatchController stopwatchController;
  WaspSpawnerController waspSpawnerController;

  //
  List<Wasp> wasps;

  //Views
  //TODO: change back to home
  Views activeView = Views.home;
  Background background;
  HomeView homeView;
  GetReadyView getReadyView;
  WaitView waitView;
  ClickView clickView;
  TooSoonView tooSoonView;
  ScoreView scoreView;
  HowToPlayView howToPlayView;
  CreditsView creditsView;
  LongGrassBackground longGrassBackground;

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

  BFast() {
    initialize();
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
    //TODO: Tobe changed to playing view
    if (activeView == Views.playing) {
      longGrassBackground.render(canvas);
      wasps.forEach((Wasp wasp) => wasp.render(canvas));
    }
  }

  @override
  void update(double t) {
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
  }

  void initialize() async {
    random = Random();
    score = 0;
    wasps = List<Wasp>();

    resize(await Flame.util.initialDimensions());

    //init controllers
    randomTimerController = RandomTimerController(this);
    stopwatchController = StopwatchController(this);
    waspSpawnerController = WaspSpawnerController(this);

    //init views
    background = Background(this);
    longGrassBackground = LongGrassBackground(this);
    homeView = HomeView(this);
    getReadyView = GetReadyView(this);
    waitView = WaitView(this);
    clickView = ClickView(this);
    tooSoonView = TooSoonView(this);
    scoreView = ScoreView(this);
    howToPlayView = HowToPlayView(this);
    creditsView = CreditsView(this);

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
      case 3:
        wasps.add(Wasp4(this, x, y));
        break;
      case 4:
        wasps.add(Wasp5(this, x, y));
        break;
    }
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    // super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

    //Wasps
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

        activeView = Views.lost;
      }
    }

    //Dialog boxes view
    if (!isHandled) {
      if (activeView == Views.howToPlay || activeView == Views.credits) {
        activeView = Views.home;
        isHandled = true;
      }
    }

    //Click view
    if (!isHandled) {
      if (activeView == Views.click) {
        clickView.onTapDown();
        isHandled = true;
      }
    }

    //Wait view
    if (!isHandled) {
      if (activeView == Views.wait) {
        waitView.onTapDown();
        isHandled = true;
      }
    }

    //Mode 1 button
    if (!isHandled && mode1Button.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        mode1Button.onTapDown();
        isHandled = true;
      }
    }

    //Return Home button
    if (!isHandled && returnHomeButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.getReady ||
          activeView == Views.tooSoon ||
          activeView == Views.score) {
        returnHomeButton.onTapDown();
        isHandled = true;
      }
    }

    //Start Game button
    if (!isHandled && startGameButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.getReady) {
        startGameButton.onTapDown();
        isHandled = true;
      }
    }

    //Play again button
    if (!isHandled && playAgainButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.score || activeView == Views.tooSoon) {
        playAgainButton.onTapDown();
        stopwatchController.resetStopwatch();
        isHandled = true;
      }
    }

    //How To Play button
    if (!isHandled && howToPlayButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        howToPlayButton.onTapDown();
        isHandled = true;
      }
    }

    //Credits button
    if (!isHandled && creditsButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        creditsButton.onTapDown();
        isHandled = true;
      }
    }

    //Mode2 button
    if (!isHandled && mode2Button.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        mode2Button.onTapDown();
        isHandled = true;
      }
    }
  }
}
