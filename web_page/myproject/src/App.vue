<template>
  <div>
    <h2>タスク一覧</h2>
    <ul>
      <li v-for="task in tasks" v-bind:key="task.id">
        <input type="checkbox" v-bind:checked="task.done">
        <input type="checkbox" v-bind:checked="task.done"
        v-on:change="toggleTaskStatus(task)">
        {{ task.name }}
      </li>
    </ul>
    <form v-on:submit.prevent="addTask">
      <input type="text" v-model="newTaskName" placeholder="新しいタスク">
    </form>
    <!-- <router-view/> -->
  </div>
</template>

<script>
export default {
  data () {
    return {
      newTaskName: ' ',
    }
  },
  computed: {
    tasks () {
      return this.$store.state.tasks
    }
  },
  methods: {
    // タスクを追加する
    addTask () {
      this.$store.commit('addTask', {
        name: this.newTaskName
      })
      this.newTaskName = ''
    },
    // タスクの完了状態を更新する
    toggleTaskStatus (task){
      thsi.$store.commit('toggleTaskStatus',{
        id: task.id
      })
    }
  }
}
</script>

<!--
<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
-->
