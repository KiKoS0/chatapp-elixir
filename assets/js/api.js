
const api_prefix = '/api/v1'

export const login = (data) =>
  (async () => {
    const response = await fetch(api_prefix + '/users/login', {
      mode: 'cors',
      method: 'post',
      Accept: "application/json",
      headers: {
        // Authorization: 'Bearer ' + token,
        "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
    });
    const res = await response.json();
    return res["data"];
  })();

export const getChannels = () =>
  (async () => {
    const response = await fetch(api_prefix + '/channels', {
      mode: 'cors',
      method: 'get',
      Accept: "application/json",
      headers: {
        // Authorization: 'Bearer ' + token,
        "Content-Type": "application/json"
      }
    });
    const res = await response.json();
    return res["data"];
  })();

export const getMessages = (channel_id) =>
  (async () => {
    const response = await fetch(api_prefix + `/channels/${channel_id}/messages`, {
      mode: 'cors',
      method: 'get',
      Accept: "application/json",
      headers: {
        "Content-Type": "application/json"
      }
    });
    const res = await response.json();
    return res["data"];
  })();

export const sendMessage = (channel_id, data) =>
  (async () => {
    const response = await fetch(api_prefix + `/channels/${channel_id}/messages`, {
      mode: 'cors',
      method: 'post',
      Accept: "application/json",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(data)
    });
    const res = await response.json();
    return res["data"];
  })();