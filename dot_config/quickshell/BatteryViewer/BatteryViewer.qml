// Battery Viewer

import Quickshell
import Quickshell.Services.UPower
import QtQuick

import "../Theme"

BatteryIcon {
    readonly property UPowerDevice device: UPower.displayDevice

    level: Math.round(device.percentage  * 100) / 100
    isCharging: device.state === UPowerDeviceState.Charging
    visible: device.ready && device.isLaptopBattery
}