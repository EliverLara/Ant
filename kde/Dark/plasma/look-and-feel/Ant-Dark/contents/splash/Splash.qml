import QtQuick 2.5


Rectangle {
    id: root
    color:"#252E32"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Image {
            id: logo
            //match SDDM/lockscreen avatar positioning
            property real size: units.gridUnit * 12

            anchors.centerIn: parent

            source: "images/logo.png"

            sourceSize.width: 100
            sourceSize.height: 100   
            
            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                OpacityAnimator {
                    target: logo
                    from: 0.75
                    to: 1
                    duration: 1000
                }
                OpacityAnimator {
                    target: logo
                    from: 1
                    to: 0.75
                    duration: 1000
                }
            }     
        }

        Image {
            id: busyIndicator
            source: "images/busy02.svg"
            anchors.centerIn: parent
            sourceSize.height: 200
            sourceSize.width: 200
            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 360
                duration: 2000
                loops: Animation.Infinite
            }
        }

        Image {
            id: busyIndicator2
            source: "images/busy02.svg"
            anchors.centerIn: parent
            sourceSize.height: 250
            sourceSize.width: 250
            RotationAnimator on rotation {
                id: rotationAnimator2
                from: 360
                to: 0
                duration: 2000
                loops: Animation.Infinite
            }
        }

        Rectangle {
            id: circle
            property real size: units.gridUnit * 12
            anchors.centerIn: parent
            width: 150
            height: 150
            radius: height / 2
            color: "#00000000"
            border.color: "#507C7B"
            border.width: 5

            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                ScaleAnimator {
                    target: circle
                    from: 0.93
                    to: 1
                    duration: 1000
                }
                ScaleAnimator {
                    target: circle
                    from: 1
                    to: 0.93
                    duration: 1000
                }
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
