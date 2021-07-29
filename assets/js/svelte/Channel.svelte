<script>
  import { createEventDispatcher } from "svelte";
  export let channel_name = "Placeholder";
  export let id;
  export let description;
  export let active = false;

  const dispatch = createEventDispatcher();

  function channel_click() {
    dispatch("channel_click", { id });
  }
</script>

<div
  on:click={channel_click}
  class="channel_wrapper"
  class:active_chat={active}
>
  <div class="channel_content">
    <div class="channel_img">
      <img
        src="https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png"
        alt="sunil"
      />
    </div>
    <div class="channel_info">
      <p class="channel_name">{"#" + channel_name}</p>
      <p class="channel_desc">
        {description}
      </p>
    </div>
  </div>
</div>

<style>
  img {
    height: 30px;
    width: 30px;
  }
  .active_chat {
    background: #ebebeb;
  }
  .channel_wrapper {
    border-bottom: 1px solid #c4c4c4;
    margin: 0;
    padding: 18px 16px 10px;
    height: 4.2rem;
    overflow: hidden;
    cursor: pointer;
  }
  .channel_content {
    display: flex;
  }
  .channel_name {
    font-size: 15px;
    color: #464646;
    font-weight: 500;
    margin-bottom: 0px;
  }
  .channel_desc {
    font-size: 14px;
    color: #989898;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    margin-bottom: 0px;
  }
  .channel_img {
    width: 3rem;
    height: 3rem;
  }
  .channel_info {
    text-overflow: ellipsis;
    overflow: hidden;
    margin-left: 1rem !important;
  }
</style>
