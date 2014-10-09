import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    visible: true
    width: 650
    height: 450
    minimumWidth: 650; minimumHeight: 450
    maximumWidth: 650; maximumHeight: 450
    flags: Qt.FramelessWindowHint
    x: (Screen.width - width) / 2; y: (Screen.height - height) / 2

    MouseArea {
        hoverEnabled: false
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            x: 0
            y: 0
            width: 650
            height: 450
            antialiasing: true

            Text {
                id: title
                x: 140
                y: 49
                width: 240
                height: 49
                color: "#7d7d7d"
                text: qsTr("AOSC OS3")
                font.pixelSize: 43
            }

            Text {
                id: powered
                x: 140
                y: 94
                width: 260
                height: 30
                text: qsTr("Powered by AOSC")
                font.pixelSize: 18
            }

            Image {
                id: logo
                x: 32
                y: 40
                width: 96
                height: 96
                fillMode: Image.Stretch
                asynchronous: true // over-optimization 233
                smooth: true
                source: "../img/Logo.png"

                NumberAnimation {
                    id: logoRotation
                    target: logo
                    properties: "rotation"
                    from: 0
                    to: 360
                    duration: 6000
                    loops: Animation.Infinite
                    running: true
                }
            }

            Text {
                id: desc
                x: 32
                y: 161
                width: 596
                height: 21
                text: qsTr("AOSC OS is the Linux Distribution maintained by <b>AOSC-Dev</b>, or  <b>AOSC Development Hub</b>.")
                wrapMode: Text.WordWrap
                font.pixelSize: 14
            }

            Text {
                id: maint
                x: 32
                y: 194
                width: 596
                height: 39
                text: qsTr("This distribution as you see is AOSC OS3, developed from summer to summer of 2014 - 2015, and will be maintained till the summer of 2016.")
                wrapMode: Text.WordWrap
                font.pixelSize: 14
            }

            Text {
                id: ver
                x: 32
                y: 241
                width: 596
                height: 24
                text: qsTr("This is the <b>Out-Of-Box Preview</b> of AOSC OS3, using DPKG.</br>") // TODO: read release from a certain configuration file.
                font.pixelSize: 14
            }

            Text {
                id: mindya
                x: 32
                y: 259
                width: 596
                height: 26
                color: "#bd0000"
                text: qsTr("Mind you: this early release is highly unstable, it bites. Seriously.")
                style: Text.Normal
                font.bold: true
                font.pixelSize: 14
            }

            Text {
                id: boringstuff
                x: 32
                y: 317
                width: 596
                height: 106
                color: "#7d7d7d"
                text: qsTr("The registered trademark Linux?? is used pursuant to a sublicense from LMI, the exclusive licensee of Linus Torvalds, owner of the mark on a world-wide basis. This distribution is built up, based on, or linked against various (free and open source) projects, any licence information can be obtained from its original distribution package. AOSC OS is an open source Linux distribution with a different way source code distributing: when not included in autobuild archives, look for upstream source package. The AOSC OS logo, as seen above is the mutual creation of AOSC-Dev, licenced under Apache 2.0 licence, any usage outside of distribution building is prohibited without permission from AOSC-Dev.")
                wrapMode: Text.WordWrap
                font.pixelSize: 13
            }

            MouseArea {
                id: closearea
                x: 595
                y: 40
                width: 22
                height: 22

                onClicked: {
                    Qt.quit()
                }
            }
            Image {
                id: closebutton
                x: 595
                y: 40
                width: 22
                height: 22
                source: "../img/Close.png"
            }
        }
    }
}
