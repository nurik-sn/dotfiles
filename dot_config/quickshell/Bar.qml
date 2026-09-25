// Introducing Bar

import Quickshell
import "./Theme"

Scope {
  
  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }
      
      color: Colors.background

      implicitHeight: Metrics.barHeight

      ClockWidget {
        anchors.centerIn: parent
        color: Colors.foreground
      }
    }
  }
}