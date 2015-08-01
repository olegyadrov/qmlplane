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

Item {
    id: button
    width: 240 * settings.scaleFactor
    height: 80 * settings.scaleFactor
    scale: mouseArea.pressed ? 0.9 : 1.0

    property color color: "#000000"
    property alias text: buttonText.text

    signal clicked()
    Behavior on scale { NumberAnimation { duration: 100 } }

    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0)
        border.color: button.color
        border.width: 5 * settings.scaleFactor
        antialiasing: true
        radius: height / 2
    }

    Label {
        id: buttonText
        anchors.centerIn: parent
        font.pixelSize: 60 * settings.scaleFactor
        color: button.color
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: button.clicked()
    }
}
