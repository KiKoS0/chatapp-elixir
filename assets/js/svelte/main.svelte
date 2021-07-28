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

<svelte:head>
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
  />
</svelte:head>

{#if $userInfo}
  <article class="column">
    <h1 class="redred">Hey {name}, Phoenix and Svelte setup is working!</h1>
  </article>
{:else}
  <Auth />
{/if}

<style>
  .redred {
    color: red;
  }
</style>
