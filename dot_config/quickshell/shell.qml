import Quickshell
import QtQuick

ShellRoot {
    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }
        height: 40
        color: "#1e1e2e" // 背景色 (ダーク系)

        Text {
            anchors.centerIn: parent
            text: "Hello, Quickshell!"
            color: "#cdd6f4"
            font.pixelSize: 14
            font.bold: true
        }
    }
}
