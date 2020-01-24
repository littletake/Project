<template>
  <div>
    <h1>Map</h1>
    <map-loader 
      :map-config="mapConfig"
      apiKey="AIzaSyA6uVwhGkZ-2KJFD2UJzYxYcEMgAu49S8Y"
    >
      <div v-for="(marker, index) in markers" :key="index">
        <child-marker :position="marker" />
      </div>
    </map-loader>
  </div>
</template>

<script>
import MapLoader from "./MapLoader.vue"
import ChildMarker from './ChildMarker.vue'

export default {
  data(){
    return {
      mapConfig: {
        zoom: 12,
        center: {"lat": 35.64, "lng": 139.67}
      },
      markers: [
        {"lat":35.6432027,"lng":139.6729435},
        {lat:35.5279833,lng:139.6989209},
        {lat:35.6563623,lng:139.7215211},
        {lat:35.6167531,lng:139.5469376},
        {lat:35.6950961,lng:139.5037899}
      ]
    }
  },
  components: {
    MapLoader,
    ChildMarker
  }
}
</script>