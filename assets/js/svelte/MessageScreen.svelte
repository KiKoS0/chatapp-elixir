<script>
  import Channel from "./Channel.svelte";
</script>

<div class="messaging">
  <div class="inbox_msg">
    <div class="inbox_people">
      <div class="heading_srch">
        <div class="recent_heading">
          <h4>Channels</h4>
        </div>
      </div>
      <div class="messaging-wrapper">
        <div class="inbox_chat">
          <Channel active={true} />
          <Channel />
          <Channel />
          <Channel />
          <Channel />
          <Channel />
        </div>
        <div class="mesgs">
          <div class="msg_history">
            <div class="incoming_msg">
              <div class="incoming_msg_img">
                <img
                  src="https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png"
                  alt="sunil"
                />
              </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>Test which is a new approach to have all solutions</p>
                  <span class="time_date"> 11:01 AM | June 9</span>
                </div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>Test which is a new approach to have all solutions</p>
                <span class="time_date"> 11:01 AM | June 9</span>
              </div>
            </div>
            <div class="incoming_msg">
              <div class="incoming_msg_img">
                <img
                  src="https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png"
                  alt="sunil"
                />
              </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>Test, which is a new approach to have</p>
                  <span class="time_date"> 11:01 AM | Yesterday</span>
                </div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>Apollo University, Delhi, India Test</p>
                <span class="time_date"> 11:01 AM | Today</span>
              </div>
            </div>
            <div class="incoming_msg">
              <div class="incoming_msg_img">
                <img
                  src="https://cdn3.iconfinder.com/data/icons/vector-icons-6/96/256-512.png"
                  alt="sunil"
                />
              </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>
                    We work directly with our designers and suppliers, and sell
                    direct to you, which means quality, exclusive products, at a
                    price anyone can afford.
                  </p>
                  <span class="time_date"> 11:01 AM | Today</span>
                </div>
              </div>
            </div>
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input
                type="text"
                class="write_msg"
                placeholder="Type a message"
              />
              <button class="msg_send_btn" type="button"
                ><i class="fa fa-paper-plane-o" aria-hidden="true" /></button
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
  img {
    max-width: 100%;
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
    float: left;
    width: 40%;
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
    margin: auto;
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
    overflow-y: scroll;
    width: 24rem;
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
    margin: 8px 0 0;
  }
  .received_withd_msg {
    width: 57%;
  }
  .mesgs {
    padding: 30px 15px 0 25px;
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
  .input_msg_write input {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    border: medium none;
    color: #4c4c4c;
    font-size: 15px;
    min-height: 48px;
    width: 100%;
  }

  .type_msg {
    border-top: 1px solid #c4c4c4;
    position: relative;
  }
  .msg_send_btn {
    background: #f05423 none repeat scroll 0 0;
    border: medium none;
    border-radius: 50%;
    color: #fff;
    cursor: pointer;
    font-size: 17px;
    height: 33px;
    position: absolute;
    right: 0;
    top: 11px;
    width: 33px;
  }
  .messaging {
    padding: 0 0 50px 0;
  }
  .msg_history {
    height: 516px;
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
