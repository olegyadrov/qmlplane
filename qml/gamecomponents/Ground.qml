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
    id: ground
    width: 809 * settings.scaleFactor
    height: 71 * settings.scaleFactor

    property alias world: body.world

    Controls.Sprite {
        width: 809 * settings.scaleFactor
        height: 71 * settings.scaleFactor
        source: "../../resources/images/ground.svg"
    }

    Body {
        id: body
        target: ground
        bodyType: Body.Static

        fixtures: [
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(309 * settings.scaleFactor, 27 * settings.scaleFactor),
                    Qt.point(251 * settings.scaleFactor, 4 * settings.scaleFactor),
                    Qt.point(157 * settings.scaleFactor, 7 * settings.scaleFactor),
                    Qt.point(133 * settings.scaleFactor, 34 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(42 * settings.scaleFactor, 42 * settings.scaleFactor),
                    Qt.point(34 * settings.scaleFactor, 34 * settings.scaleFactor),
                    Qt.point(0 * settings.scaleFactor, 35 * settings.scaleFactor),
                    Qt.point(0 * settings.scaleFactor, 71 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(0 * settings.scaleFactor, 71 * settings.scaleFactor),
                    Qt.point(146 * settings.scaleFactor, 71 * settings.scaleFactor),
                    Qt.point(91 * settings.scaleFactor, 45 * settings.scaleFactor),
                    Qt.point(42 * settings.scaleFactor, 42 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(146 * settings.scaleFactor, 71 * settings.scaleFactor),
                    Qt.point(470 * settings.scaleFactor, 44 * settings.scaleFactor),
                    Qt.point(349 * settings.scaleFactor, 28 * settings.scaleFactor),
                    Qt.point(309 * settings.scaleFactor, 27 * settings.scaleFactor),
                    Qt.point(133 * settings.scaleFactor, 34 * settings.scaleFactor),
                    Qt.point(91 * settings.scaleFactor, 45 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(470 * settings.scaleFactor, 44 * settings.scaleFactor),
                    Qt.point(437 * settings.scaleFactor, 12 * settings.scaleFactor),
                    Qt.point(372 * settings.scaleFactor, 13 * settings.scaleFactor),
                    Qt.point(349 * settings.scaleFactor, 28 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(146 * settings.scaleFactor, 71 * settings.scaleFactor),
                    Qt.point(532 * settings.scaleFactor, 55 * settings.scaleFactor),
                    Qt.point(508 * settings.scaleFactor, 43 * settings.scaleFactor),
                    Qt.point(470 * settings.scaleFactor, 44 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(146 * settings.scaleFactor, 71 * settings.scaleFactor),
                    Qt.point(809 * settings.scaleFactor, 71 * settings.scaleFactor),
                    Qt.point(573 * settings.scaleFactor, 55 * settings.scaleFactor),
                    Qt.point(532 * settings.scaleFactor, 55 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(809 * settings.scaleFactor, 71 * settings.scaleFactor),
                    Qt.point(809 * settings.scaleFactor, 35 * settings.scaleFactor),
                    Qt.point(763 * settings.scaleFactor, 25 * settings.scaleFactor),
                    Qt.point(636 * settings.scaleFactor, 24 * settings.scaleFactor),
                    Qt.point(599 * settings.scaleFactor, 27 * settings.scaleFactor),
                    Qt.point(573 * settings.scaleFactor, 55 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(763 * settings.scaleFactor, 25 * settings.scaleFactor),
                    Qt.point(744 * settings.scaleFactor, 0 * settings.scaleFactor),
                    Qt.point(658 * settings.scaleFactor, 4 * settings.scaleFactor),
                    Qt.point(636 * settings.scaleFactor, 24 * settings.scaleFactor)
                ]
            }
        ]
    }
}
