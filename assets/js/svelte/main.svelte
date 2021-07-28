<script>
  import { userInfo } from "./store";
  import { onMount } from "svelte";
  import Auth from "./Auth.svelte";

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
    <article class="col-4">
      <h1 class="redred">Hey {name}, Phoenix and Svelte setup is working!</h1>
    </article>
  {:else}
    <Auth />
  {/if}
</section>

<style>
</style>
