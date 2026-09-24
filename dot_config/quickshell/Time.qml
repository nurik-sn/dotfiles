pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  readonly property string time: {
    Qt.formatDateTime(clock.date, "yyyy年MM月dd日 hh時mm分ss秒")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}