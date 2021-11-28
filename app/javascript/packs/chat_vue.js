/* eslint no-console: 0 */
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#chat',
    components: { App }
  })
})