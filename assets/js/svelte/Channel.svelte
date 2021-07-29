<script>
  export let name = "Placeholder";
  export let id;
  export let desc =
    "Test, which is a new approach to have all solutions astrology under one roof.";
  export let active = false;
</script>

<div class="chat_list" class:active_chat={active}>
  <div class="chat_people">
    <div class="chat_img">
      <img
        src="https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png"
        alt="sunil"
      />
    </div>
    <div class="chat_ib">
      <p class="channel_name">{"#" + name}</p>
      <p class="channel_desc">
        {desc}
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
  .chat_list {
    border-bottom: 1px solid #c4c4c4;
    margin: 0;
    padding: 18px 16px 10px;
    height: 4.2rem;
    overflow: hidden;
  }
  .chat_people {
    overflow: hidden;
    clear: both;
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
    margin: auto;
    text-overflow: ellipsis;
    overflow: hidden;
  }
  .chat_img {
    float: left;
    width: 11%;
  }
  .chat_ib {
    float: left;
    padding: 0 0 0 15px;
    width: 88%;
  }
</style>
