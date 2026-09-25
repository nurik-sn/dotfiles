// Introducing Bar

import Quickshell
import QtQuick
import "./Theme"

Scope {
  
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: barWindow
      required property var modelData
      screen: modelData

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
        color: Colors.background

        CurrentWorkspace {
          anchors.left: parent.left
          anchors.verticalCenter: parent.verticalCenter
          anchors.leftMargin: Metrics.spaceSm
        }

        ClockWidget {
          anchors.centerIn: parent
        }
      }
    }
  }
}