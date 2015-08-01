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
import QtQuick.Window 2.2
import "../controls" as Controls
import "../scripts/Functions.js" as Functions

BlankScreen {
    id: introScreen

    signal finished()

    Controls.Label {
        anchors.centerIn: parent
        color: "#74982b"
        text: Functions.getIntroTitle()
    }

    Controls.Animation {
        id: plane
        width: 87 * settings.scaleFactor
        height: 73 * settings.scaleFactor

        y: 120 * settings.scaleFactor

        sourcePath: "../../resources/images/plane"
        frameCount: 3
        running: true
        frameDuration: 80

        x: -width
    }

    NumberAnimation {
        target: plane
        properties: "x"
        from: -plane.width
        // Screen.width returns a wrong value in first few seconds after run on Nexus devices if application
        // is running in Fullscreen mode
        to: Screen.width * 2
        duration: 2500 * 2
        running: true
        loops: 1
    }

    Timer {
        interval: 3200
        running: true
        repeat: false
        onTriggered:
            introScreen.finished()
    }
}
