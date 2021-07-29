<script>
  export let is_outgoing = false;
  export let content = "Test which is a new approach to have all solutions";
  export let sent_at = "11:01 AM | June 9";
  export let sender = "Placeholder";
</script>

{#if is_outgoing}
  <div class="outgoing_msg">
    <div class="sent_msg">
      <p>{content}</p>
      <span class="time_date"> {sent_at}</span>
    </div>
  </div>
{:else}
  <div class="incoming_msg">
    <div class="incoming_msg_img">
      <img
        src="https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png"
        alt="sunil"
      />
    </div>
    <div class="received_msg">
      <div class="received_withd_msg">
        <span class="sender"> {sender} </span>
        <p>{content}</p>
        <span class="time_date"> {sent_at} </span>
      </div>
    </div>
  </div>
{/if}

<style>
  img {
    max-width: 100%;
  }
  .incoming_msg_img {
    display: inline-block;
    width: 6%;
  }
  .received_msg {
    display: inline-block;
    padding: 0 0 0 10px;
    vertical-align: top;
    width: 92%;
  }
  .received_withd_msg p {
    background: #ebebeb none repeat scroll 0 0;
    border-radius: 3px;
    color: #646464;
    font-size: 14px;
    margin: 0;
    padding: 5px 10px 5px 12px;
    width: 100%;
  }
  .time_date {
    color: #747474;
    display: block;
    font-size: 12px;
    margin: 4px 0 4px 0;
  }
  .sender {
    color: #747474;
    display: block;
    font-size: 12px;
    margin: 0;
  }

  .received_withd_msg {
    width: 57%;
  }

  .sent_msg p {
    background: #f05423 none repeat scroll 0 0;
    border-radius: 3px;
    font-size: 14px;
    margin: 0;
    color: #fff;
    padding: 5px 10px 5px 12px;
    width: 100%;
  }
  .outgoing_msg {
    overflow: hidden;
    margin: 26px 0 26px;
  }
  .sent_msg {
    float: right;
    width: 46%;
  }
</style>
