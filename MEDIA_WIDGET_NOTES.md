## Media widget findings and changes

- Location (top bar media chip): `.config/quickshell/ii/modules/bar/Media.qml`
  - Uses Quickshell MPRIS: `MprisController.activePlayer` and `Quickshell.Services.Mpris`.
  - Mouse: Left toggles media controls; Middle play/pause; Back/Forward = prev/next.

- Related files we touched:
  - `.config/quickshell/ii/modules/mediaControls/PlayerControl.qml` — progress bar seek.
  - `.config/quickshell/ii/modules/bar/BarContent.qml` — where `Resources` and `Media` are composed.
  - `.config/quickshell/ii/modules/bar/Resources.qml` — resource indicators next to media.

### Behavior decisions

1) Hide track text in the top bar
   - We do not show currently playing info in the bar to keep it minimal.
   - `Media.qml` `StyledText.visible = false`, width set to `0` so it doesn't reserve space.

2) Keep the media chip compact and remove gaps
   - `Media.qml`: the hidden text does not fill width; `Layout.leftMargin` on the icon is `0`.
   - `BarContent.qml`: `Resources` and `Media` do not use `fillWidth`; the group shrinks to content.
   - `Resources.qml`: conservative spacing/margins so the icons sit tightly with the media icon.

3) Accurate click/drag seeking in Media Controls
   - `PlayerControl.qml`: click/drag on the progress bar seeks using absolute seconds via `playerctl position <seconds>` (not percent). This fixes off-by-percentage jumps.

### Install/apply

To deploy only these parts and reload Quickshell:
```
install -Dm0644 .config/quickshell/ii/modules/bar/{Media.qml,BarContent.qml,Resources.qml} ~/.config/quickshell/ii/modules/bar/ && \
install -Dm0644 .config/quickshell/ii/modules/mediaControls/PlayerControl.qml ~/.config/quickshell/ii/modules/mediaControls/ && \
(pkill -f '^qs ' || true) && nohup qs -p ~/.config/quickshell/ii/shell.qml >/dev/null 2>&1 &
```

### Notes / gotchas

- Some players may not support seeking; `playerctl` handles most MPRIS clients but requires it installed.
- The bar center layout is left untouched except the resources+media group; if further densification is desired, tune `padding`/`spacing` on the group or icon `implicitSize`.


