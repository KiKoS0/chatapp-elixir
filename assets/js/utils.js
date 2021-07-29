
import dateFormat, { masks } from "dateformat";
import { get } from 'svelte/store';
import { userInfo } from "./svelte/store";


export function transform_msg(msg) {
  msg["sent_at"] = dateFormat(msg.created_at, "dddd, mmmm dS, H:MM:ss");
  if (msg.user) {
    msg["sender"] = msg.user.username;
    msg["is_outgoing"] = msg.user.id === get(userInfo).id;
  }
  return msg
}