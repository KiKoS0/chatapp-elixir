
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