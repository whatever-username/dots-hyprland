import qs
import qs.modules.common
import qs.modules.common.widgets
import qs.services
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland

Item {
    id: root
    property bool borderless: Config.options.bar.borderless
    implicitWidth: appsRowLayout.implicitWidth + appsRowLayout.spacing * 2
    implicitHeight: Appearance.sizes.barHeight

    RowLayout {
        id: appsRowLayout
        anchors.fill: parent
        spacing: 6

        Repeater {
            model: ScriptModel {
                // Group running toplevels by appId
                values: {
                    const map = new Map();
                    for (const toplevel of ToplevelManager.toplevels.values) {
                        const key = (toplevel.appId || toplevel.class || "unknown").toLowerCase();
                        if (!map.has(key)) map.set(key, { appId: key, toplevels: [] });
                        map.get(key).toplevels.push(toplevel);
                    }
                    return Array.from(map.values());
                }
            }

            delegate: RippleButton {
                required property var modelData
                property var toplevels: modelData?.toplevels ?? []
                property var primaryToplevel: toplevels?.[0]

                Layout.alignment: Qt.AlignVCenter
                padding: 4
                buttonRadius: Appearance.rounding.full
                colBackground: root.borderless ? "transparent" : Appearance.colors.colLayer1
                colBackgroundHover: Appearance.colors.colLayer1Hover
                colRipple: Appearance.colors.colLayer1Active

                onClicked: {
                    // Activate the most recently active toplevel if available, else the first
                    const candidate = toplevels.find(t => t.activated) || primaryToplevel;
                    candidate?.activate();
                }

                contentItem: Item {
                    implicitWidth: 22
                    implicitHeight: 22

                    IconImage {
                        id: appIcon
                        anchors.centerIn: parent
                        source: Quickshell.iconPath(AppSearch.guessIcon(primaryToplevel?.appId || primaryToplevel?.class || modelData?.appId), "image-missing")
                        implicitSize: 18
                    }

                    // Count badge if multiple windows
                    Loader {
                        active: (toplevels?.length || 0) > 1
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        sourceComponent: Rectangle {
                            radius: Appearance.rounding.full
                            color: Appearance.colors.colSecondaryContainer
                            implicitWidth: countText.implicitWidth + 6
                            implicitHeight: countText.implicitHeight + 2
                            StyledText {
                                id: countText
                                anchors.centerIn: parent
                                font.pixelSize: Appearance.font.pixelSize.smaller
                                color: Appearance.m3colors.m3onSecondaryContainer
                                text: String(toplevels.length)
                            }
                        }
                    }
                }
            }
        }
    }
}


