Depending on attach points, distances to edges vary. Here are the values.

Attach point            | Top | Left | Bottom | Right
------------------------|-----|------|--------|------
ATTACH_HUD_TOP_LEFT     | -0.04 | 0.0 | -1.0 | -1.91
ATTACH_HUD_TOP_CENTER   | -0.04 | 0.95 | -1.0 | -0.95
ATTACH_HUD_TOP_RIGHT    | -0.04 | 1.91 | -1.0 | 0.0
ATTACH_HUD_CENTER_1     | 0.45 | 0.95 | -0.5 | -0.95
ATTACH_HUD_CENTER_2     | 0.45 | 0.95 | -0.5 | -0.95
ATTACH_HUD_BOTTOM_LEFT  | 0.95 | 0.0 | 0.0 | -1.91
ATTACH_HUD_BOTTOM       | 0.95 | 0.95 | -1.0 | -0.95
ATTACH_HUD_BOTTOM_RIGHT | 0.95 | 1.91 | 0.0 | 0.0 

Vectors for each corner:

Attach point            | TopLeft            |  TopRight           |  BottomLeft        |  BottomRight
------------------------|--------------------|---------------------|--------------------|------------
ATTACH_HUD_TOP_LEFT     | `<0, 0, -0.04>`    | `<0, -1.91, -0.04>` | `<0, 0, -1.91>`    | `<0, -1.0, -1.91>`
ATTACH_HUD_TOP_CENTER   | `<0, 0.95, -0.04>` | `<0, -0.95, -0.04>` | `<0, 0.95, -0.04>` | `<0, -0.95, -1.0>`
ATTACH_HUD_TOP_RIGHT    | `<0, 1.91, -0.04>` | `<0, 0, -0.04>`     | `<0, 1.91, -1.0>`  | `<0, 0, -1.0>`
ATTACH_HUD_CENTER_1     | `<0, 0.95, 0.45>`  | `<0, -0.95, 0.45>`  | `<0, 0.95, -0.95>` | `<0, -0.95, -0.95>`
ATTACH_HUD_CENTER_2     | `<0, 0.95, 0.45>`  | `<0, -0.95, 0.45>`  | `<0, 0.95, -0.95>` | `<0, -0.95, -0.95>`
ATTACH_HUD_BOTTOM_LEFT  | `<0, 0, 0.95>`     | `<0, -1.91, 0.95>`  | `<0, 0, 0>`        | `<0, -1.91, 0>`
ATTACH_HUD_BOTTOM       | `<0, 0.95, 0.95>`  | `<0, -0.95, 0.95>`  | `<0, 0.95, 0>`     | `<0, -0.95, 0>`
ATTACH_HUD_BOTTOM_RIGHT | `<0, 1.91, 0.95>`  | `<0, 0, 0.95>`      | `<0, 1.91, 0>`     | `<0, 0, 0>`
