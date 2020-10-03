import 'dart:ui';

import 'package:BFast/components/credits-button.dart';
import 'package:BFast/components/how-to-play-button.dart';
import 'package:BFast/components/play-again-button.dart';
import 'package:BFast/components/return-home-button.dart';
import 'package:BFast/components/start-game-button.dart';
import 'package:BFast/controllers/random-timer-controller.dart';
import 'package:BFast/views/click-view.dart';
import 'package:BFast/views/credits-view.dart';
import 'package:BFast/views/get-ready-view.dart';
import 'package:BFast/views/home-view.dart';
import 'package:BFast/components/mode1-button.dart';
import 'package:BFast/views/hot-to-play-view.dart';
import 'package:BFast/views/too-soon-view.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/gestures.dart';

import 'components/background.dart';
import 'components/mode2-button.dart';
import 'components/mode3-button.dart';
import 'components/mode4-button.dart';
import 'views.dart';
import 'views/score-view.dart';
import 'views/wait-view.dart';

class BFast extends Game {
  //Screen
  Size screenSize;
  double tileSize;

  //Controllers
  RandomTimerController randomTimerController;

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
    if (activeView == Views.click) clickView.render(canvas);

    //TOO SOON
    if (activeView == Views.tooSoon) {
      tooSoonView.render(canvas);
      playAgainButton.render(canvas);
    }

    //SCORE
    if (activeView == Views.score) {
      scoreView.render(canvas);
      playAgainButton.render(canvas);
    }

    //HOW TO PLAY
    if (activeView == Views.howToPlay) howToPlayView.render(canvas);

    //CREDITS
    if (activeView == Views.credits) creditsView.render(canvas);
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
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());

    //init controllers
    randomTimerController = RandomTimerController(this);

    //init views
    background = Background(this);
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

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    // super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

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
      if (activeView == Views.getReady) {
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

    //Start Game button
    if (!isHandled && playAgainButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.score || activeView == Views.tooSoon) {
        playAgainButton.onTapDown();
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
  }
}
