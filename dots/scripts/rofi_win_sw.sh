#!/usr/bin/env bash 

rofi -show window -theme-str '
inputbar {enabled: false;} element-text { enabled: false; }
element-icon { size: 80px; }
element {
    padding: 0px;
    orientation: vertical;
    children: [ element-icon ];
}
listview {
    columns: 10;
    lines: 1;
    flow: horizontal;
    spacing: 0px;
}
window {
    width: 50%;
    height: 95px;
}'


# rofi -show window -theme-str '
# element-text {
#     enabled: true;
#     width: 100px;
#     horizontal-align: 0.5;
#     vertical-align: 0.0;
#     font: "Sans 9";
# }
# element-icon {
#     size: 64px;
#     horizontal-align: 0.5;
# }
# element {
#     padding: 8px;
#     orientation: vertical;
#     children: [ element-icon, element-text ];
# }
# listview {
#     columns: 6;
#     lines: 1;
#     flow: horizontal;
#     spacing: 10px;
# }
# window {
#     width: 85%;
#     height: 160px;
# }'
