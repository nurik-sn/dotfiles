// View Workspace Popup
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

import "../Theme"

PopupWindow {
    id: root
    grabFocus: true // 自動でvisibleを変更
    visible: false
    anchor.rect.x: Metrics.spaceSm
    anchor.rect.y: anchor.window.height // qmllint disable unresolved-type
    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight
    color: "transparent"

    WrapperRectangle {
        id: background
        color: Colors.background
        bottomLeftRadius: Metrics.radiusSm
        bottomRightRadius: Metrics.radiusSm
        margin: Metrics.spaceSm

        ColumnLayout {
            
            Repeater {
                model: Hyprland.workspaces

                WorkspaceItem {
                    Layout.fillWidth: true
                    popup: root
                }
            }
        }
    }
}