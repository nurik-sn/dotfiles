// Introducing Bar

import Quickshell
import QtQuick
import "./Theme"
import "./Clock"
import "./WorkspaceSwitcher"
import "./BatteryViewer"

Scope {
  
  Variants {
    model: Quickshell.screens

    
    PanelWindow { // qmllint disable uncreatable-type
      id: barWindow
      required property var modelData
      screen: modelData
      color: "transparent"

      anchors {
        top: true
        left: true
        right: true
      }
      
      implicitHeight: Metrics.barHeight

      Rectangle {
        id: barBackground
        width: barWindow.width
        height: barWindow.height
        color: Colors.backgroundTranslucent

        WorkspaceSwitcher {
          anchors.left: parent.left
          anchors.verticalCenter: parent.verticalCenter
          anchors.leftMargin: Metrics.spaceSm
          popup: workspacePopup
          WorkspacePopup {
            id: workspacePopup
            anchor.window: barWindow
          }
        }

        ClockWidget {
          anchors.centerIn: parent
        }

        BatteryViewer {
          anchors.right: parent.right
          anchors.verticalCenter: parent.verticalCenter
          anchors.rightMargin: Metrics.spaceSm
        }
      }
    }
  }
}