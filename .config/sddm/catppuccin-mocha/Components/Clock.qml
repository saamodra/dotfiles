import QtQuick 2.15
import SddmComponents 2.0

Clock {
  id: time
  color: config.text
  timeFont.family: config.ClockFont
  dateFont.family: config.ClockFont
  anchors {
    margins: 10
    top: parent.top
    right: parent.right
  }
}
