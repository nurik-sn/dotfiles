import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

import "../Theme"

WrapperRectangle {
    id: root

    required property HyprlandWorkspace modelData
    required property WorkspacePopup popup

    color: Colors.background
    radius: Metrics.radiusSm
    margin: Metrics.spaceXs
    border.color: Colors.accent
    border.width: Metrics.border

    

    RowLayout {

        Text {
            id: label
            text: root.modelData.id
            color: Colors.foreground
            font.family: Fonts.familySans
            font.pixelSize: Fonts.sizeBody
            font.bold: true
            Layout.alignment: Qt.AlignTop
        }

        ColumnLayout {
            
            
            Repeater {
                model: root.modelData.toplevels

                Text {
                    id: toplevel

                    required property HyprlandToplevel modelData

                    readonly property string appId: toplevel.modelData.wayland?.appId ?? "" // qmllint disable unresolved-type
                    readonly property DesktopEntry entry: toplevel.appId !== ""
                            ? DesktopEntries.heuristicLookup(toplevel.appId)
                            : null
                    readonly property string displayName: toplevel.entry?.name ?? ""
                    
                    text: toplevel.displayName !== ""
                        ? `${toplevel.displayName}: ${toplevel.modelData.title}`
                        : toplevel.modelData.title
                    color: Colors.foreground
                    font.family: Fonts.familySans
                    font.pixelSize: Fonts.sizeBody
                    elide: Text.ElideRight
                    Layout.maximumWidth: Metrics.popupWidth
                    Layout.fillWidth: true
                }
            }
        }
    }

    TapHandler {
        id: click
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad | PointerDevice.Stylus
        onTapped: {
            Hyprland.dispatch(`hl.dsp.focus({ workspace = ${root.modelData.id} })`)
            root.popup.visible = false
        }
    }
}