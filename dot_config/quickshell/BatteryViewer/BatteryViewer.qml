// Battery Viewer

import Quickshell
import Quickshell.Services.UPower
import QtQuick

import "../Theme"

Text {
    text: "Battery: " + UPower.displayDevice.percentage * 100 + "%"
    font.family: Fonts.familySans
    font.pixelSize: Fonts.sizeBody
    font.bold: true
    color: Colors.foreground
}