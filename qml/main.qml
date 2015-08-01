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
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtMultimedia 5.5
import Qt.labs.settings 1.0
import "screens"
import "controls" as Controls

ApplicationWindow {
    id: appWindow
    width: Screen.width
    height: Screen.height
    visible: true
    visibility: Window.FullScreen
    title: "QML Plane"
    color: "#000000"

    QtObject {
        id: settings

        property int defaultWidth: 800
        property int defaultHeight: 480
        property double scaleFactor: Math.min(Math.min(width, height) / settings.defaultHeight, Math.max(width, height) / settings.defaultWidth)
        property bool musicEnabled: true
        property int highScore: 0
    }

    Settings {
        property alias musicEnabled: settings.musicEnabled
        property alias highScore: settings.highScore
    }

    StackView {
        id: stackView
        anchors.centerIn: parent
        width: settings.defaultWidth * settings.scaleFactor
        height: settings.defaultHeight * settings.scaleFactor
        rotation: parent.height > parent.width ? 90 : 0
        clip: true

        initialItem: IntroScreen {
            onFinished:
                stackView.push(Qt.resolvedUrl("screens/MenuScreen.qml"))
        }

        Controls.Sprite {
            anchors.fill: parent
            z: -1
            source: "../../resources/images/background.svg"
        }

        delegate: StackViewDelegate {
            function transitionFinished(properties)
            {
                properties.exitItem.opacity = 1
            }

            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                }
            }
        }
    }

    Audio {
        id: introMusic
        autoPlay: true
        muted: !settings.musicEnabled || Qt.application.state !== Qt.ApplicationActive
        loops: 1
        source: "../resources/music/intro.mp3"
        onStopped:
            backgroundMusic.play()
    }

    Audio {
        id: backgroundMusic
        muted: !settings.musicEnabled || Qt.application.state !== Qt.ApplicationActive
        loops: Audio.Infinite
        source: "../resources/music/theme.mp3"
    }
}
