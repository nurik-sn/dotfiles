// Time.qml
pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  // {} を使うと式を複数行に分けて書ける
  readonly property string time: {
    // 渡しているフォーマット文字列は、
    // `date` コマンドのデフォルト出力と同じ形式
    Qt.formatDateTime(clock.date, "yyyy年MM月dd日 hh時mm分ss秒")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}