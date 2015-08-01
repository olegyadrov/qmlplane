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
import Box2D 2.0
import "../scripts/Functions.js" as Functions

Item {
    id: pattern
    width: 809 * settings.scaleFactor
    height: settings.defaultHeight * settings.scaleFactor
    property World world
    Component.onCompleted: update()

    Ceiling {
        id: ceiling
        anchors.bottom: parent.top
        parent: pattern.parent
        world: pattern.world
    }

    Ground {
        id: ground
        anchors.bottom: parent.bottom
        parent: pattern.parent
        world: pattern.world
    }

    Stalactite {
        id: stalactiteA
        parent: pattern.parent
        anchors.top: parent.top
        world: pattern.world
    }

    Stalagmite {
        id: stalagmiteA
        parent: pattern.parent
        anchors.bottom: parent.bottom
        world: pattern.world
    }

    Stalactite {
        id: stalactiteB
        parent: pattern.parent
        anchors.top: parent.top
        world: pattern.world
    }

    Stalagmite {
        id: stalagmiteB
        parent: pattern.parent
        anchors.bottom: parent.bottom
        world: pattern.world
    }

    function update() {
        ceiling.x = pattern.x
        ground.x = pattern.x

        if (pattern.x ===0) {
            stalactiteA.x = 0
            stalactiteA.anchors.topMargin = 0

            stalactiteB.x = 500 * settings.scaleFactor
            stalactiteB.anchors.topMargin = -60 * settings.scaleFactor

            stalagmiteA.x = 240 * settings.scaleFactor
            stalagmiteA.anchors.bottomMargin = -40 * settings.scaleFactor

            stalagmiteB.x = 700 * settings.scaleFactor
            stalagmiteB.anchors.bottomMargin = -40 * settings.scaleFactor
        } else {
            var xVariance = 100
            var yMax = 20
            var yMin = 100
            stalactiteA.x = pattern.x + Functions.randomInt(0, xVariance * settings.scaleFactor)
            stalactiteA.anchors.topMargin = Functions.randomInt(-yMin * settings.scaleFactor, -yMax * settings.scaleFactor)

            stalagmiteA.x = pattern.x + 200 * settings.scaleFactor + Functions.randomInt(0, xVariance * settings.scaleFactor)
            stalagmiteA.anchors.bottomMargin = Functions.randomInt(-yMin * settings.scaleFactor, -yMax * settings.scaleFactor)

            stalactiteB.x = pattern.x + 400 * settings.scaleFactor + Functions.randomInt(0, xVariance * settings.scaleFactor)
            stalactiteB.anchors.topMargin = Functions.randomInt(-yMin * settings.scaleFactor, -yMax * settings.scaleFactor)

            stalagmiteB.x = pattern.x + 600 * settings.scaleFactor + Functions.randomInt(0, xVariance * settings.scaleFactor)
            stalagmiteB.anchors.bottomMargin = Functions.randomInt(-yMin * settings.scaleFactor, -yMax * settings.scaleFactor)
        }
    }
}
