<script lang="ts">
  import { electric } from "./init";
  import ElectricApp from "./ElectricApp.svelte";
  import { onMount } from "svelte";

  onMount(async () => {
    console.log("initElectric");

    console.log("App", electric);
  });
</script>

<main>
  {#if electric}
    <ElectricApp {electric} />
  {:else}
    <p>error!</p>
  {/if}
</main>
