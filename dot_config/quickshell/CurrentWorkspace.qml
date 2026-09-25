// View Current Workspace

import Quickshell
import Quickshell.Hyprland
import QtQuick

import "./Theme"

Rectangle {
    implicitWidth: Metrics.widgetHeight
    implicitHeight: Metrics.widgetHeight
    color: Colors.background
    radius: Metrics.radiusSm
    border.color: Colors.accent
    border.width: Metrics.border
    
    Text {
        anchors.centerIn: parent
        text: Hyprland.focusedWorkspace ? Hyprland.focusedWorkspace.id : "-"
        font.family: Fonts.familySans
        font.pixelSize: Fonts.sizeBody
        font.bold: true
        color: Colors.foreground
    }
}