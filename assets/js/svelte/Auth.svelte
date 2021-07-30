<script>
  import { login } from "../api";
  import { userInfo } from "./store";

  let username = "KiKoS";
  export let oauth_google_url;

  async function handleSubmit() {
    if (username) {
      console.log("Username is: " + username);
      const data = await login({ username });
      console.log(data);
      userInfo.update((_) => {
        return { id: data.id, username: data.username };
      });
    } else {
      console.log("Username empty");
    }
  }
</script>

<article class="col-12 col-md-4">
  <div class="row">
    <a href={oauth_google_url}>
      <img src="https://i.imgur.com/Kagbzkq.png" alt="Sign in with Google" />
    </a>
    <!-- <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text" id="basic-addon1">@</span>
      </div>
      <input
        type="text"
        class="form-control"
        placeholder="Username"
        aria-label="Username"
        aria-describedby="basic-addon1"
        bind:value={username}
      />
    </div>
  </div>
  <div class="row justify-content-center">
    <div class="col-3 mx-auto">
      <button on:click={handleSubmit} type="button" class="btn btn-primary"
        >Login</button
      >
    </div> -->
  </div>
</article>
