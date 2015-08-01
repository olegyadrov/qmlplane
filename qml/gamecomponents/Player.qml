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
import "../controls" as Controls

Item {
    id: player
    width: 87 * settings.scaleFactor
    height: 73 * settings.scaleFactor

    property bool running: true
    property alias world: body.world

    function start() {
        body.linearVelocity.x = 10 * settings.scaleFactor
        accelerate()
    }

    function accelerate() {
        body.linearVelocity.y = -12 * settings.scaleFactor
    }

    signal crash()

    onXChanged: animation.rotation = body.linearVelocity.y / settings.scaleFactor * 0.6

    Controls.Animation {
        id: animation
        width: 87 * settings.scaleFactor
        height: 73 * settings.scaleFactor

        sourcePath: "../../resources/images/plane"
        frameCount: 3
        running: player.running
        frameDuration: 80
        antialiasing: true

        Behavior on rotation {
            enabled: player.running

            NumberAnimation {
                duration: 100
            }
        }
    }

    Body {
        id: body
        target: player
        bodyType: Body.Dynamic
        fixtures: [
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(23 * settings.scaleFactor, 17 * settings.scaleFactor),
                    Qt.point(18 * settings.scaleFactor, 13 * settings.scaleFactor),
                    Qt.point(8 * settings.scaleFactor, 11 * settings.scaleFactor),
                    Qt.point(3 * settings.scaleFactor, 12 * settings.scaleFactor),
                    Qt.point(0 * settings.scaleFactor, 16 * settings.scaleFactor),
                    Qt.point(1 * settings.scaleFactor, 24 * settings.scaleFactor),
                    Qt.point(5 * settings.scaleFactor, 31 * settings.scaleFactor),
                    Qt.point(11 * settings.scaleFactor, 33 * settings.scaleFactor)
                ]
            },
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(11 * settings.scaleFactor, 33 * settings.scaleFactor),
                    Qt.point(21 * settings.scaleFactor, 45 * settings.scaleFactor),
                    Qt.point(28 * settings.scaleFactor, 17 * settings.scaleFactor),
                    Qt.point(23 * settings.scaleFactor, 17 * settings.scaleFactor)
                ]
            },
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(22 * settings.scaleFactor, 49 * settings.scaleFactor),
                    Qt.point(19 * settings.scaleFactor, 52 * settings.scaleFactor),
                    Qt.point(19 * settings.scaleFactor, 60 * settings.scaleFactor),
                    Qt.point(22 * settings.scaleFactor, 64 * settings.scaleFactor),
                    Qt.point(28 * settings.scaleFactor, 64 * settings.scaleFactor),
                    Qt.point(33 * settings.scaleFactor, 60 * settings.scaleFactor)
                ]
            },
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(48 * settings.scaleFactor, 65 * settings.scaleFactor),
                    Qt.point(53 * settings.scaleFactor, 71 * settings.scaleFactor),
                    Qt.point(58 * settings.scaleFactor, 72 * settings.scaleFactor),
                    Qt.point(64 * settings.scaleFactor, 70 * settings.scaleFactor),
                    Qt.point(68 * settings.scaleFactor, 64 * settings.scaleFactor)
                ]
            },
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(78 * settings.scaleFactor, 56 * settings.scaleFactor),
                    Qt.point(83 * settings.scaleFactor, 60 * settings.scaleFactor),
                    Qt.point(86 * settings.scaleFactor, 56 * settings.scaleFactor),
                    Qt.point(86 * settings.scaleFactor, 27 * settings.scaleFactor),
                    Qt.point(82 * settings.scaleFactor, 23 * settings.scaleFactor),
                    Qt.point(78 * settings.scaleFactor, 26 * settings.scaleFactor)
                ]
            },
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(65 * settings.scaleFactor, 13 * settings.scaleFactor),
                    Qt.point(72 * settings.scaleFactor, 12 * settings.scaleFactor),
                    Qt.point(75 * settings.scaleFactor, 7 * settings.scaleFactor),
                    Qt.point(70 * settings.scaleFactor, 0 * settings.scaleFactor)
                ]
            },
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(70 * settings.scaleFactor, 0 * settings.scaleFactor),
                    Qt.point(57 * settings.scaleFactor, 0 * settings.scaleFactor),
                    Qt.point(30 * settings.scaleFactor, 14 * settings.scaleFactor),
                    Qt.point(63 * settings.scaleFactor, 17 * settings.scaleFactor),
                    Qt.point(65 * settings.scaleFactor, 13 * settings.scaleFactor)
                ]
            },
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(30 * settings.scaleFactor, 14 * settings.scaleFactor),
                    Qt.point(28 * settings.scaleFactor, 17 * settings.scaleFactor),
                    Qt.point(21 * settings.scaleFactor, 45 * settings.scaleFactor),
                    Qt.point(22 * settings.scaleFactor, 49 * settings.scaleFactor),
                    Qt.point(33 * settings.scaleFactor, 60 * settings.scaleFactor),
                    Qt.point(48 * settings.scaleFactor, 65 * settings.scaleFactor),
                    Qt.point(68 * settings.scaleFactor, 64 * settings.scaleFactor)
                ]
            },
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(68 * settings.scaleFactor, 64 * settings.scaleFactor),
                    Qt.point(74 * settings.scaleFactor, 62 * settings.scaleFactor),
                    Qt.point(78 * settings.scaleFactor, 56 * settings.scaleFactor),
                    Qt.point(78 * settings.scaleFactor, 26 * settings.scaleFactor),
                    Qt.point(71 * settings.scaleFactor, 18 * settings.scaleFactor),
                    Qt.point(63 * settings.scaleFactor, 17 * settings.scaleFactor),
                    Qt.point(30 * settings.scaleFactor, 14 * settings.scaleFactor)
                ]
            },
            Polygon {
                restitution: 0
                categories: Box.Category1
                collidesWith: Box.Category2 | Box.Category3
                onBeginContact: player.crash()
                vertices: [
                    Qt.point(57 * settings.scaleFactor, 0 * settings.scaleFactor),
                    Qt.point(25 * settings.scaleFactor, 0 * settings.scaleFactor),
                    Qt.point(22 * settings.scaleFactor, 3 * settings.scaleFactor),
                    Qt.point(21 * settings.scaleFactor, 7 * settings.scaleFactor),
                    Qt.point(25 * settings.scaleFactor, 12 * settings.scaleFactor),
                    Qt.point(30 * settings.scaleFactor, 14 * settings.scaleFactor)
                ]
            }
        ]
    }
}
