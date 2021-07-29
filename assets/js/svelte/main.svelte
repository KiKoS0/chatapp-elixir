<script>
  import { userInfo } from "./store";
  import { onMount } from "svelte";
  import Auth from "./Auth.svelte";
  import MessageScreen from "./MessageScreen.svelte";

  onMount(async () => {
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

  export let name;
</script>

<section class="row justify-content-center">
  {#if $userInfo}
    <article class="col-12 col-md-10">
      <h1 class="text-center">
        Welcome {$userInfo["username"]}
      </h1>
      <div class="row">
        <MessageScreen />
        <!-- <div class="col-3">
          <h3>Channels:</h3>
          <ul class="list-group">
            <li class="list-group-item">Cras justo odio</li>
            <li class="list-group-item">Dapibus ac facilisis in</li>
            <li class="list-group-item">Morbi leo risus</li>
            <li class="list-group-item">Porta ac consectetur ac</li>
            <li class="list-group-item">Vestibulum at eros</li>
          </ul>
        </div> -->
      </div>
    </article>
  {:else}
    <Auth />
  {/if}
</section>

<style>
</style>
