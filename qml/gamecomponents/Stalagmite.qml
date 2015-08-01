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
    id: stalagmite
    width: 108 * settings.scaleFactor
    height: 238 * settings.scaleFactor

    property alias world: body.world

    Controls.Sprite {
        width: 108 * settings.scaleFactor
        height: 238 * settings.scaleFactor
        source: "../../resources/images/stalagmite.svg"
    }

    Body {
        id: body
        target: stalagmite
        bodyType: Body.Static

        fixtures: [
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(95 * settings.scaleFactor, 173 * settings.scaleFactor),
                    Qt.point(87 * settings.scaleFactor, 103 * settings.scaleFactor),
                    Qt.point(82 * settings.scaleFactor, 102 * settings.scaleFactor),
                    Qt.point(37 * settings.scaleFactor, 122 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(37 * settings.scaleFactor, 122 * settings.scaleFactor),
                    Qt.point(29 * settings.scaleFactor, 128 * settings.scaleFactor),
                    Qt.point(0 * settings.scaleFactor, 238 * settings.scaleFactor),
                    Qt.point(108 * settings.scaleFactor, 238 * settings.scaleFactor),
                    Qt.point(102 * settings.scaleFactor, 180 * settings.scaleFactor),
                    Qt.point(95 * settings.scaleFactor, 173 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(82 * settings.scaleFactor, 102 * settings.scaleFactor),
                    Qt.point(71 * settings.scaleFactor, 0 * settings.scaleFactor),
                    Qt.point(63 * settings.scaleFactor, 0 * settings.scaleFactor),
                    Qt.point(37 * settings.scaleFactor, 122 * settings.scaleFactor)
                ]
            }
        ]
    }
}
