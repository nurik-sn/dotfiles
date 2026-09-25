// View Current Workspace

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

    WheelHandler {
        id: wheel
        // 謎にマウスがtouchpad扱いされてたので…
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad 
        onWheel: event => {
            console.log("wheel", event.angleDelta.y)
            if (event.angleDelta.y > 0) {
                Hyprland.dispatch('hl.dsp.focus({ workspace = "r-1" })')
            } else if (event.angleDelta.y < 0) {
                Hyprland.dispatch('hl.dsp.focus({ workspace = "r+1" })')
            }
        }
    }
}