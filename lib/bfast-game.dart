import 'dart:ui';

import 'package:BFast/components/return-home-button.dart';
import 'package:BFast/components/start-game-button.dart';
import 'package:BFast/views/get-ready-view.dart';
import 'package:BFast/views/home-view.dart';
import 'package:BFast/components/mode1-button.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/gestures.dart';

import 'components/background.dart';
import 'components/mode2-button.dart';
import 'components/mode3-button.dart';
import 'components/mode4-button.dart';
import 'views.dart';
import 'views/wait-view.dart';

class BFast extends Game {
  //screen
  Size screenSize;
  double tileSize;

  //Views
  //TODO: change back to home
  Views activeView = Views.home;
  Background background;
  HomeView homeView;
  GetReadyView getReadyView;
  WaitView waitView;

  //buttons
  Mode1Button mode1Button;
  Mode2Button mode2Button;
  Mode3Button mode3Button;
  Mode4Button mode4Button;
  ReturnHomeButton returnHomeButton;
  StartGameButton startGameButton;

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
    }

    //GET READY
    if (activeView == Views.getReady) {
      getReadyView.render(canvas);
      returnHomeButton.render(canvas);
      startGameButton.render(canvas);
    }

    //WAIT
    if(activeView == Views.wait) waitView.render(canvas);
  }

  @override
  void update(double t) {}

  void initialize() async {
    resize(await Flame.util.initialDimensions());

    //init views
    background = Background(this);
    homeView = HomeView(this);
    getReadyView = GetReadyView(this);
    waitView = WaitView(this);

    //init buttons
    mode1Button = Mode1Button(this);
    mode2Button = Mode2Button(this);
    mode3Button = Mode3Button(this);
    mode4Button = Mode4Button(this);
    returnHomeButton = ReturnHomeButton(this);
    startGameButton = StartGameButton(this);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    // super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

    //Mode 1
    if (!isHandled && mode1Button.rect.contains(d.globalPosition)) {
      if (activeView == Views.home) {
        mode1Button.onTapDown();
        isHandled = true;
      }
    }

    //Return Home
    if (!isHandled && returnHomeButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.getReady) {
        returnHomeButton.onTapDown();
        isHandled = true;
      }
    }

    //Start Game
    if (!isHandled && startGameButton.rect.contains(d.globalPosition)) {
      if (activeView == Views.getReady) {
        startGameButton.onTapDown();
        isHandled = true;
      }
    }
  }
}
