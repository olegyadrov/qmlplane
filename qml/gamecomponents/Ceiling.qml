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
    id: ceiling
    width: 809 * settings.scaleFactor
    height: 71 * settings.scaleFactor

    property alias world: body.world

    Body {
        id: body
        target: ceiling
        bodyType: Body.Static
        fixtures: Box {
            width: ceiling.width
            height: ceiling.height
            categories: Box.Category2
            collidesWith: Box.Category1
        }
    }
}
