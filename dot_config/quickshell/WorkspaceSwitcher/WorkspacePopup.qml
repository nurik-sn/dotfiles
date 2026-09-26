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
    property bool open: false

    visible: false
    anchor.rect.x: 0
    anchor.rect.y: anchor.window.height // qmllint disable unresolved-type
    anchor.adjustment: PopupAdjustment.None // qmllint disable missing-type
    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight
    color: "transparent"
    
    onOpenChanged: {
        if (root.open) {
            root.visible = true
        }
    }

    WrapperRectangle {
        id: background
        color: Colors.backgroundTranslucent
        bottomLeftRadius: Metrics.radiusMd
        bottomRightRadius: Metrics.radiusMd
        margin: Metrics.spaceSm

        y: root.open ? 0 : -background.implicitHeight

        Behavior on y {
            NumberAnimation {
                duration: Metrics.popupDuration
                easing.type: Easing.OutCubic
            }
        }

        onYChanged: {
            if (root.open === false && background.y <= -background.implicitHeight) {
                root.visible = false
            }
        }

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

    HyprlandFocusGrab {
        id: grab
        windows: [ root ]
        active: root.open

        onCleared: {
            root.open = false
        }
    }
}