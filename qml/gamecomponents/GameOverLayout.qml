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
import "../controls" as Controls

Item {
    id: gameOverLayout
    anchors.fill: parent

    property int score: 0

    signal playAgainClicked()
    signal menuClicked()

    Controls.Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30 * settings.scaleFactor
        font.pixelSize: 60 * settings.scaleFactor
        text: "Score: %1".arg(gameOverLayout.score)
    }

    Column {
        anchors.centerIn: parent
        spacing: 20 * settings.scaleFactor

        Controls.Button {
            text: "Play again"
            onClicked:
                gameOverLayout.playAgainClicked()
        }

        Controls.Button {
            text: "Menu"
            onClicked:
                gameOverLayout.menuClicked()
        }
    }

    Controls.Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30 * settings.scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        text: "High score: %1".arg(settings.highScore)
        font.pixelSize: 60 * settings.scaleFactor
    }
}
