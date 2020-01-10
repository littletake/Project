<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <h2>MainPage</h2>
    <h2>タブ</h2>
    <div class="example">
      <div class="tabs">
        <TabItem
          v-for="item in list"
          v-bind="item" :key="item.id"
          v-model="currentId"/>
      </div>
      <div class="contents">
        <transition>
          <section class="item" :key="currentId">
            {{ current.content }}
          </section>
        </transition>
      </div>
    </div>
    画面遷移のためのタブを配置
    <h2>ニュース欄</h2>
    一般的なニュース（掲示板的なもの）を記載
  </div>
</template>

<script>
import TabItem from './modules/TabItem.vue'
export default {
  name: 'MainPage',
  components: { TabItem },
  data () {
    return {
      msg: 'テスト用に作成',
      currentId: 1,
      list: [
        { id: 1, label: 'Tab1', content: 'ニュース一覧' },
        { id: 2, label: 'Tab2', content: 'マシン' },
        { id: 3, label: 'Tab3', content: 'その他' }
      ]
    }
  },
  computed: {
    current () {
      return this.list.find(el => el.id === this.currentId) || {}
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
.contents {
  position: relative;
  overflow: hidden;
  width: 280px;
  border: 2px solid #000;
}
.item {
  box-sizing: border-box;
  padding: 10px;
  width: 100%;
  transition: all 0.8s ease;
}
/* トランジション用スタイル */
.v-leave-active {
  position: absolute;
}
.v-enter {
  transform: translateX(-100%);
}
.v-leave-to {
  transform: translateX(100%);
}
</style>
