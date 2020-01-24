// vuetifyの検証用プログラム

<template>
  <v-app>
    <v-card>
      <v-card-title>
        <h1 class="display-1">ログイン</h1>
      </v-card-title>
      <v-card-text>
        <v-form>
          <v-text-field prepend-icon="mdi-account-circle" label="ユーザー名" />
          <v-text-field v-bind:type="showPassword ? 'text' : 'password'"
                        prepend-icon="mdi-lock" 
                        append-icon="mdi-eye-off" 
                        label="パスワード"
                        @click:append="showPassword = !showPassword" />
          <v-card-actions>
            <v-btn>ログイン</v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>

    <v-content>
      <v-container>
        <v-layout wrap>
          <v-flex>コンテンツ</v-flex>
          <v-flex>コンテンツ</v-flex>
          <v-flex>コンテンツ</v-flex>
        </v-layout>
      </v-container>
    </v-content>

  </v-app>
</template>

<script>
// import HelloWorld from './components/HelloWorld';

export default {
  name: 'App',

  // components: {
  //   HelloWorld,
  // },

  data: () => ({
    showPassword : false
  }),
};
</script>
