import QtQuick
import QtLocation
import QtPositioning

Window {
    width: 800; height: 600
    visible: true
    title: qsTr("高德地图修正版")
    Plugin {
        id: mapPlugin
        name: "osm"
        PluginParameter { name: "osm.useragent"; value: "Mozilla/5.0" }
        PluginParameter {
            name: "osm.mapping.custom.host";
            // 这是一个公开的、国内访问极快的智图瓦片源
            value: "http://map.geoq.cn/ArcGIS/rest/services/ChinaOnlineCommunity/MapServer/tile/"
        }
        PluginParameter { name: "osm.mapping.providerserial"; value: 1 }
    }
    /*
Plugin {
    id: mapPlugin
    name: "osm"
    parameters: [
        PluginParameter {
            name: "osm.mapping.custom.host"
            value: "http://wprd01.is.autonavi.com/appmaptile?x={x}&y={y}&z={z}&lang=zh_cn&size=1&scl=1&style=8"
        },
        PluginParameter {
            name: "osm.mapping.highdpi_tiles"; value: true
        },
        PluginParameter {
            name: "osm.mapping.cache.directory"; value: "./mapCache"
        }

    ]
}*/
    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin

        activeMapType: MapType.CustomMap
        center: QtPositioning.coordinate(30.9167, 105.2833) // 泸州
        zoomLevel: 12

        MapCircle {
            center: QtPositioning.coordinate(30.9167, 105.2833)
            radius: 500.0
            color: "red"
            border.width: 1
        }
    }
}
