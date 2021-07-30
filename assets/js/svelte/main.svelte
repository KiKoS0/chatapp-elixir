<script>
  import { userInfo, modal } from "./store";
  import { onMount } from "svelte";
  import Auth from "./Auth.svelte";
  import MessageScreen from "./MessageScreen.svelte";
  import Modal from "./Modal.svelte";

  onMount(async () => {
    console.log("profile");
    console.log(profile);
    console.log("oauth_google_url");
    console.log(oauth_google_url);

    const res = await fetch(
      `https://jsonplaceholder.typicode.com/photos?_limit=20`
    );
    const photos = await res.json();

    console.log(photos);

    if ($userInfo) {
    } else {
      console.log("NOT LOGGED IN");
    }
  });

  export let profile;
  export let oauth_google_url;
</script>

<Modal show={$modal}>
  <section class="row justify-content-center">
    {#if $userInfo}
      <article class="col-12 col-md-10">
        <h1 class="text-center">
          Welcome {$userInfo["username"]}
        </h1>
        <div style="height: 100vh;overflow: auto;" class="row">
          <MessageScreen />
        </div>
      </article>
    {:else}
      <Auth {oauth_google_url} />
    {/if}
  </section>
</Modal>

<style>
</style>
