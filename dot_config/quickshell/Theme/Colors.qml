// Shared Color

pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property color background: "#1e1e2e"
    readonly property color backgroundTranslucent: Qt.alpha(background, 0.88)
    readonly property color foreground: "#cdd6f4"
    readonly property color accent: "#89b4fa"

    readonly property color enough: "green"
    readonly property color middle: "yellow"
    readonly property color danger: "red"
}