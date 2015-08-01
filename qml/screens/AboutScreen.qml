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
import QtQuick.Layouts 1.1
import "../controls" as Controls

BlankScreen {
    id: aboutScreen

    Controls.Label {
        anchors.top: parent.top
        anchors.topMargin: 30 * settings.scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        text: Qt.application.name + " " + Qt.application.version
        font.pixelSize: 50 * settings.scaleFactor
        color: "#d76241"
    }

    GridLayout {
        anchors.centerIn: parent
        columns: 2
        rows: 4
        columnSpacing: 40 * settings.scaleFactor
        rowSpacing: 6 * settings.scaleFactor
        flow: GridLayout.TopToBottom

        Controls.Label {
            text: "Idea & Programming"
            color: "#d76241"
            font.pixelSize: 30 * settings.scaleFactor
        }
        Controls.Label {
            text: "Oleg Yadrov"
            color: "#d76241"
        }

        Controls.Label {
            text: "Game art"
            color: "#d76241"
            font.pixelSize: 30 * settings.scaleFactor
        }
        Controls.Label {
            text: "Kenney Vleugels"
            color: "#d76241"
        }

        Controls.Label {
            text: "Music"
            color: "#d76241"
            font.pixelSize: 30 * settings.scaleFactor
        }
        Controls.Label {
            text: "TwistBit"
            color: "#d76241"
        }

        Controls.Label {
            text: "Fonts"
            color: "#d76241"
            font.pixelSize: 30 * settings.scaleFactor
        }
        Controls.Label {
            text: "Jan Gerner"
            color: "#d76241"
        }
    }

    Controls.Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30 * settings.scaleFactor
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Copyright (c) 2014-2015 Oleg Yadrov"
        font.pixelSize: 40 * settings.scaleFactor
        color: "#d76241"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: stackView.pop()
    }
}
