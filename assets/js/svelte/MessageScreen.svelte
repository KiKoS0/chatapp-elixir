<script>
  import Channel from "./Channel.svelte";
  import { onMount } from "svelte";
  import { getChannels, getMessages, sendMessage, addChannel } from "../api";
  import Message from "./Message.svelte";
  import { userInfo } from "./store";
  import socket from "../room_socket";
  import AddChannelPopup from "./AddChannelPopup.svelte";
  import Modal from "./Modal.svelte";
  import { transform_msg } from "../utils.js";
  import { getContext } from "svelte";

  const { open } = getContext("simple-modal");

  let channels = [];
  let messages = [];
  let loading = false;
  let active_channel_id = -1;
  let message_to_send = "";
  let current_channel = null;
  let global_channel = null;

  onMount(async () => {
    await loadChannels();
    global_channel = socket.channel(`room:global`);
    global_channel.on("channel_add", async (payload) => {
      console.log("Channel changed Reloading ....");
      const channel = payload.data;
      channels = [...channels, channel];
    });
    global_channel
      .join()
      .receive("ok", (resp) => {
        console.log("Joined Global successfully", resp);
      })
      .receive("error", (resp) => {
        console.log("Unable to join Global", resp);
      });
  });

  async function loadChannels() {
    loading = true;
    channels = [];
    messages = [];
    channels = await getChannels();
    loading = false;
    console.log(channels);
  }

  function switchChannel(channel_id) {
    if (current_channel) {
      current_channel.leave();
    }
    current_channel = socket.channel(`room:${channel_id}`);
    current_channel.on("new_msg", (payload) => {
      const msg = payload.data;
      if (msg.user.id !== $userInfo["id"])
        messages = [...messages, transform_msg(msg)];
    });
    current_channel
      .join()
      .receive("ok", (resp) => {
        console.log("Joined successfully", resp);
      })
      .receive("error", (resp) => {
        console.log("Unable to join", resp);
      });
  }

  async function handleMessage(event) {
    loading = true;
    const channel_id = event.detail.id;
    if (channel_id != active_channel_id) {
      messages = [];
      console.log(`Switching to channel: ${channel_id}`);
      active_channel_id = channel_id;
      channels.forEach((elem) => (elem.active = false));
      channels.find((o, i) => {
        if (o.id === active_channel_id) {
          o.active = true;
          channels[i] = o;
          return true; // stop searching
        }
      });
      let mess = await getMessages(active_channel_id);
      mess = mess.map((msg) => {
        return transform_msg(msg);
      });
      messages = mess;
      switchChannel(channel_id);
      scroll_down();
    }
    loading = false;
  }
  function scroll_down() {
    setTimeout(() => {
      var element = document.getElementById("msg_history");
      element.scrollTop = element.scrollHeight;
    }, 200);
  }
  async function send_message() {
    if (message_to_send) {
      loading = true;
      console.log(`Sending: ${message_to_send}`);
      const msg_content = message_to_send;
      message_to_send = "";
      const msg = await sendMessage(active_channel_id, {
        content: msg_content,
        user_id: $userInfo["id"],
      });
      console.log(msg);
      messages = [...messages, transform_msg(msg)];
      scroll_down();
    }
    loading = false;
  }
  async function send_message_keyup(event) {
    if (event.keyCode === 13) {
      await send_message();
    }
  }
  const showPopup = () => {
    const onCancel = (text) => {
      console.log("CANCELED");
    };

    const onOkay = async (payload) => {
      console.log(payload);
      const channel = await addChannel(payload);
      console.log(channel);
    };

    open(
      AddChannelPopup,
      {
        message: "Add channel",
        hasForm: true,
        onCancel,
        onOkay,
      },
      {
        closeButton: false,
        closeOnEsc: false,
        closeOnOuterClick: false,
      }
    );
  };
</script>

<div class="messaging">
  <div class="inbox_msg">
    <div class="inbox_people">
      <div class="heading_srch">
        <div class="recent_heading">
          <h4>Channels</h4>
          <button on:click={showPopup} class="msg_send_btn" type="button"
            ><i class="fa fa-plus" aria-hidden="true" /></button
          >
        </div>
      </div>
      <div class="messaging-wrapper">
        <div class="inbox_chat">
          {#each channels as channel, i}
            <Channel on:channel_click={handleMessage} {...channel} />
          {/each}
        </div>
        <div class="mesgs">
          <div id="msg_history" class="msg_history">
            {#if messages && messages.length > 0}
              {#each messages as message, i}
                <Message {...message} />
              {/each}
            {:else if !loading && active_channel_id !== -1}
              <div class="no-messages">
                <p>Such Empty!</p>
                <p>Go ahead and send the first message</p>
              </div>
            {/if}
          </div>
          {#if active_channel_id !== -1}
            <div class="type_msg">
              <input
                bind:value={message_to_send}
                on:keyup={send_message_keyup}
                type="text"
                class="write_msg"
                placeholder="Aa"
              />
              <button on:click={send_message} class="msg_send_btn" type="button"
                ><i class="fa fa-paper-plane-o" aria-hidden="true" /></button
              >
            </div>
          {/if}
        </div>
      </div>
    </div>
  </div>
</div>

<style>
  img {
    max-width: 100%;
  }
  .no-messages {
    text-align: center;
  }
  .messaging-wrapper {
    display: flex;
  }
  .inbox_people {
    background: #f8f8f8 none repeat scroll 0 0;
    overflow: hidden;
    border-right: 1px solid #c4c4c4;
    display: flex;
    flex-direction: column;
  }
  .inbox_msg {
    border: 1px solid #c4c4c4;
    clear: both;
    overflow: hidden;
  }
  .recent_heading {
    display: flex;
    gap: 1.5rem;
  }
  .srch_bar {
    display: inline-block;
    text-align: right;
    width: 60%;
  }
  .heading_srch {
    padding: 10px 29px 10px 20px;
    overflow: hidden;
    border-bottom: 1px solid #c4c4c4;
  }

  .recent_heading h4 {
    color: #f05423;
    font-size: 21px;
  }
  .srch_bar input {
    border: 1px solid #cdcdcd;
    border-width: 0 0 1px 0;
    width: 80%;
    padding: 2px 0 4px 6px;
    background: none;
  }
  .srch_bar .input-group-addon button {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    border: medium none;
    padding: 0;
    color: #707070;
    font-size: 18px;
  }
  .srch_bar .input-group-addon {
    margin: 0 0 0 -27px;
  }

  .inbox_chat {
    overflow-x: hidden;
    overflow-y: scroll;
    width: 30rem;
    max-height: 516px;
  }

  .mesgs {
    padding: 30px 15px 0 25px;
    width: 100%;
  }

  .type_msg input {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    border: medium none;
    color: #4c4c4c;
    font-size: 15px;
    min-height: 48px;
    width: 0;
    flex: 4;
  }

  .type_msg {
    border-top: 1px solid #c4c4c4;
    display: flex;
    align-content: center;
    align-items: center;
    gap: 0.7rem;
  }
  .msg_send_btn {
    background: #f05423 none repeat scroll 0 0;
    border: medium none;
    border-radius: 50%;
    color: #fff;
    cursor: pointer;
    font-size: 17px;
    height: 33px;
    width: 33px;
  }
  .messaging {
    padding: 0 0 50px 0;
  }
  .msg_history {
    height: 437px;
    overflow-y: auto;
  }

  ::-webkit-scrollbar {
    width: 8px;
    height: 8px;
  }

  ::-webkit-scrollbar-button {
    width: 0px;
    height: 0px;
  }

  ::-webkit-scrollbar-thumb {
    background: rgba(98, 0, 255, 0.418);
    /* background: white; */
    border: 0px none #ffffff;
    border-radius: 50px;
  }

  ::-webkit-scrollbar-track {
    background: #212121;
    border: 0px none #ffffff;
    border-radius: 57px;
  }

  ::-webkit-scrollbar-corner {
    background: transparent;
  }
</style>
