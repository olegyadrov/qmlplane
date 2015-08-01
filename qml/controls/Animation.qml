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
    id: animation
    property string sourcePath: ""
    property int currentFrame: 0
    property int frameCount: 1
    property int frameDuration: 1000
    property bool running: true
    property bool antialiasing: false

    Image {
        source: animation.sourcePath + animation.currentFrame + ".svg"
        sourceSize.width: animation.width
        sourceSize.height: animation.height
        antialiasing: animation.antialiasing
    }

    Timer {
        interval: animation.frameDuration
        running: animation.running
        repeat: true
        onTriggered: {
            var nextFrame = currentFrame + 1
            if (nextFrame === animation.frameCount) nextFrame = 0
            currentFrame = nextFrame
        }
    }
}
