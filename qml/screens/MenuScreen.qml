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

BlankScreen {
    id: menuScreen

    Controls.RoundButton {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 20 * settings.scaleFactor
        icon: settings.musicEnabled ? "\uf028" : "\uf026"
        color: "#d76241"
        onClicked:
            settings.musicEnabled = !settings.musicEnabled
    }

    Controls.Sprite {
        width: 250 * settings.scaleFactor
        height: 250 * settings.scaleFactor
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 100 * settings.scaleFactor
        source: "../../resources/images/logo.svg"
    }

    Column {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 100 * settings.scaleFactor
        spacing: 20 * settings.scaleFactor

        Controls.Button {
            text: "Play"
            color: "#d76241"
            onClicked:
                stackView.push(Qt.resolvedUrl("GameScreen.qml"))
        }

        Controls.Button {
            text: "About"
            color: "#d76241"
            onClicked:
                stackView.push(Qt.resolvedUrl("AboutScreen.qml"))
        }
    }

    Controls.Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30 * settings.scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        text: "High score: %1".arg(settings.highScore)
        color: "#d76241"
        font.pixelSize: 60 * settings.scaleFactor
    }
}
