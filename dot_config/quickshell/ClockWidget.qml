import QtQuick
import "./Theme"

Text {
    text: Time.time
    color: Colors.foreground
    font.family: Fonts.familySans
    font.pixelSize: Fonts.sizeBody
}