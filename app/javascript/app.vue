<template>
  <div id="app">
    <input v-model="message">
    <button v-on:click="sendMessage">Send message</button>
  </div>
</template>

<script>
import consumer from "./channels/consumer"

const channel = consumer.subscriptions.create({ channel: "ChatChannel", room: "Main Room" }, {
    received(data) {
        console.log(data)
        this.appendLine(data)
    },

    appendLine(data) {
        const html = this.createLine(data)
        const element = document.querySelector("[data-chat-room='Main Room']")
        element.insertAdjacentHTML("beforeend", html)
    },

    createLine(data) {
        return `
  <article class="chat-line">
    <span class="speaker">[${data["sent_by"]}]:</span>
    <span class="body">${data["body"]}</span>
  </article>
`
    }
})

export default {
  data: function () {
    return {
      message: "Hello Chat!"
    }
  },
  methods: {
    sendMessage: function () {
      channel.perform('chat', {body: this.message, sent_by: gon.email})
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
