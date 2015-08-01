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
    id: stalactite
    width: 108 * settings.scaleFactor
    height: 238 * settings.scaleFactor

    property alias world: body.world

    Controls.Sprite {
        width: 108 * settings.scaleFactor
        height: 238 * settings.scaleFactor
        source: "../../resources/images/stalactite.svg"
    }

    Body {
        id: body
        target: stalactite
        bodyType: Body.Static

        fixtures: [
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(37 * settings.scaleFactor, 115 * settings.scaleFactor),
                    Qt.point(62 * settings.scaleFactor, 238 * settings.scaleFactor),
                    Qt.point(70 * settings.scaleFactor, 238 * settings.scaleFactor),
                    Qt.point(82 * settings.scaleFactor, 136 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(94 * settings.scaleFactor, 65 * settings.scaleFactor),
                    Qt.point(100 * settings.scaleFactor, 60 * settings.scaleFactor),
                    Qt.point(108 * settings.scaleFactor, 0 * settings.scaleFactor),
                    Qt.point(0 * settings.scaleFactor, 0 * settings.scaleFactor),
                    Qt.point(28 * settings.scaleFactor, 107 * settings.scaleFactor),
                    Qt.point(37 * settings.scaleFactor, 115 * settings.scaleFactor)
                ]
            },
            Polygon {
                categories: Box.Category2
                collidesWith: Box.Category1
                vertices: [
                    Qt.point(37 * settings.scaleFactor, 115 * settings.scaleFactor),
                    Qt.point(82 * settings.scaleFactor, 136 * settings.scaleFactor),
                    Qt.point(86 * settings.scaleFactor, 134 * settings.scaleFactor),
                    Qt.point(94 * settings.scaleFactor, 65 * settings.scaleFactor)
                ]
            }
        ]
    }
}
