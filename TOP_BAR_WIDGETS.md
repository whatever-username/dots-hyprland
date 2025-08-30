### Top bar widgets → files

- **Top bar composition**
  - `~/.config/quickshell/ii/modules/bar/Bar.qml`: Bar window per monitor, autohide, layer-shell, corners, super-key reveal.
  - `~/.config/quickshell/ii/modules/bar/BarContent.qml`: Lays out left/middle/right sections and groups; where widgets are placed.

- **Left section (brightness scroll area)**
  - `~/.config/quickshell/ii/modules/bar/LeftSidebarButton.qml`: Left sidebar toggle button.
  - `~/.config/quickshell/ii/modules/bar/ActiveWindow.qml`: App class/title on focused monitor.

- **Center**
  - `~/.config/quickshell/ii/modules/bar/Resources.qml`: Memory/Swap/CPU inline indicators.
    - `~/.config/quickshell/ii/modules/bar/Resource.qml`: Single resource pill.
    - `~/.config/quickshell/ii/modules/bar/ResourcesPopup.qml`: Hover popup with details.
  - `~/.config/quickshell/ii/modules/bar/Media.qml`: MPRIS progress ring + mouse actions.
  - `~/.config/quickshell/ii/modules/bar/Workspaces.qml`: Workspace strip, numbers/icons, scroll to switch.

- **Right of center (inside clickable group)**
  - `~/.config/quickshell/ii/modules/bar/ClockWidget.qml`: Time (and optional date) with tooltip.
    - `~/.config/quickshell/ii/modules/bar/ClockWidgetTooltip.qml`: Hover tooltip.
  - `~/.config/quickshell/ii/modules/bar/UtilButtons.qml`: Utility round buttons (snip, color picker, OSK, mic mute, theme switch, power profile).
    - `~/.config/quickshell/ii/modules/bar/CircleUtilButton.qml`: Reusable round button base.
  - `~/.config/quickshell/ii/modules/bar/BatteryIndicator.qml`: Battery percent bar + charging bolt.
    - `~/.config/quickshell/ii/modules/bar/BatteryPopup.qml`: Hover popup.

- **Right section (volume scroll area)**
  - Inline in `BarContent.qml`: Right sidebar toggle button + tiny indicators (audio mute, mic mute, layout, network, bluetooth).
  - `~/.config/quickshell/ii/modules/bar/SysTray.qml`: System tray host and overflow.
    - `~/.config/quickshell/ii/modules/bar/SysTrayItem.qml`: Individual tray item.
    - `~/.config/quickshell/ii/modules/bar/StyledPopup.qml`: Popup base used by tray/others.
  - Weather (optional):
    - `~/.config/quickshell/ii/modules/bar/weather/WeatherBar.qml`: Inline weather widget.
    - `~/.config/quickshell/ii/modules/bar/weather/WeatherPopup.qml`: Hover popup.
    - `~/.config/quickshell/ii/modules/bar/weather/WeatherIcons.qml`, `WeatherCard.qml`: Assets/components.

- **Shared scaffolding**
  - `~/.config/quickshell/ii/modules/bar/BarGroup.qml`: Compact grouping container with padding.
  - `~/.config/quickshell/ii/modules/bar/ScrollHint.qml`: Left/right scroll hint glyphs.

- **Where to toggle/configure**
  - `~/.config/quickshell/ii/modules/common/Config.qml`: `options.bar.*` (autohide, bottom/vertical, borderless, verbose, resources thresholds, tray pins, workspaces, utilButtons toggles, weather.enable).
  - `~/.config/quickshell/ii/shell.qml`: Enables `Bar` module; switches to `VerticalBar` when `Config.options.bar.vertical`.

