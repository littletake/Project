<!-- ChildMarker.vue -->
<template>
<p>test</p>
</template>

<script>
export default {
  inject: ["google", "map"],
  props: {
    position: Object
  },
  data(){
    return { marker: null}
  },
  mounted(){
    const { Marker } = this.google.maps
    this.marker = new Marker({
      position: this.position,
      map: this.map,
      title: "Child¡ marker!"
    })
  }
}
</script>