// Write Battery Icon

import Quickshell
import QtQuick
import QtQuick.Layouts

import "../Theme"

RowLayout {
    id: root
    required property real level
    required property bool isCharging

    spacing: 0

    Rectangle {
        id: main

        implicitHeight: Metrics.smallWidgetHeight
        implicitWidth: Metrics.barHeight
        radius: Metrics.radiusSm
        color: Colors.accent

        Rectangle {
            id: remain
            readonly property real rightRadius: Math.max(0, Metrics.radiusSm - (main.width - remain.width))

            implicitHeight: Metrics.smallWidgetHeight
            implicitWidth: main.implicitWidth * root.level
            bottomLeftRadius: Metrics.radiusSm
            topLeftRadius: Metrics.radiusSm
            bottomRightRadius: rightRadius
            topRightRadius: rightRadius
            color: root.level >= 0.5 ? Colors.enough : root.level >= 0.2 ? Colors.middle : Colors.danger
        }

        Text {
            anchors.centerIn: parent
            font.family: Fonts.familySans
            font.pixelSize: Fonts.sizeBody
            font.bold: true

            color: Colors.background
            text: root.isCharging ? Math.round(root.level * 100) + "\uf0e7" : Math.round(root.level * 100)
        }
    }

    Rectangle {
        id: nipple

        implicitHeight: Metrics.spaceSm
        implicitWidth: Metrics.spaceXs
        bottomRightRadius: Metrics.radiusSm
        topRightRadius: Metrics.radiusSm
        color: root.level === 1 ? Colors.enough : Colors.accent
    }
}