/****************************************************************************
**
** Copyright (C) 2013-2015 Oleg Yadrov
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
** http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
**
****************************************************************************/

import QtQuick 2.5
import QtMultimedia 5.5
import Box2D 2.0
import "../controls" as Controls
import "../gamecomponents"

Item {
    id: gameScene
    anchors.fill: parent

    property int score: 0
    signal goToMenu()
    signal playAgain()

    states: [
        State { name: "GetReady" },
        State { name: "Game" },
        State { name: "Pause" },
        State { name: "GameOver" }
    ]
    state: "GetReady"

    SoundEffect {
        id: tapSound
        source: "../../resources/sounds/tap.wav"
        muted: !settings.musicEnabled || Qt.application.state !== Qt.ApplicationActive
    }

    SoundEffect {
        id: crashSound
        source: "../../resources/sounds/crash.wav"
        muted: !settings.musicEnabled || Qt.application.state !== Qt.ApplicationActive
    }

    World {
        id: world
        running: gameScene.state === "Game" ||
                 gameScene.state === "GameOver"
        gravity: Qt.point(0, 20 * settings.scaleFactor)
        onStepped:
            updateWorld()
    }

    Flickable {
        anchors.fill: parent
        interactive: false
        contentX: player.x - 100 * settings.scaleFactor

        Player {
            id: player
            world: world
            x: 100 * settings.scaleFactor
            y: 200 * settings.scaleFactor
            running: gameScene.state === "Game"
            onCrash: {
                crashSound.play()
                if (gameScene.state === "Game")
                {
                    if (gameScene.score > settings.highScore)
                        settings.highScore = gameScene.score
                    gameOverLayout.score = gameScene.score

                    gameScene.state = "GameOver"
                }
            }
        }

        WorldPrefab {
            id: patternA
            anchors.leftMargin: -2
            world: world
        }

        WorldPrefab {
            id: patternB
            anchors.leftMargin: -2
            anchors.left: patternA.right
            world: world
        }

        DebugDraw {
            anchors.fill: parent
            world: world
            visible: false
            opacity: 0.6
        }
    }

    property double nextUpdate: 908 * settings.scaleFactor

    function updateWorld() {
        gameScene.score = Math.max(score, player.x / settings.scaleFactor * 0.01)
        if (player.x > nextUpdate) {
            nextUpdate += 808 * settings.scaleFactor
            var firstPattern = patternA
            var secondPattern = patternB
            if (patternB.x < patternA.x) {
                firstPattern = patternB
                secondPattern = patternA
            }
            secondPattern.anchors.left = undefined
            firstPattern.anchors.left = secondPattern.right
            firstPattern.update()
        }
    }

    GetReadyLayout {
        visible: gameScene.state === "GetReady"
        onClicked: {
            tapSound.play()
            gameScene.state = "Game"
            player.start()
        }
    }

    GameLayout {
        visible: gameScene.state === "Game"
        score: gameScene.score

        onPressed: {
            tapSound.play()
            player.accelerate()
        }

        onPauseClicked: {
            pauseLayout.score = gameScene.score
            gameScene.state = "Pause"
        }
    }

    PauseLayout {
        id: pauseLayout
        visible: gameScene.state === "Pause"

        onContinueClicked:
            gameScene.state = "Game"

        onMenuClicked:
            gameScene.goToMenu()
    }

    GameOverLayout {
        id: gameOverLayout
        visible: gameScene.state === "GameOver"

        onPlayAgainClicked:
            gameScene.playAgain()

        onMenuClicked:
            gameScene.goToMenu()
    }
}
