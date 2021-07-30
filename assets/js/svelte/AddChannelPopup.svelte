<script>
	import { getContext } from "svelte";
	import { onMount } from "svelte";
	export let message;
	export let onCancel = () => {};
	export let onOkay = () => {};

	const { close } = getContext("simple-modal");

	let value;
	let ref;
	let description;
	let onChange = () => {};

	function _onCancel() {
		onCancel();
		close();
	}

	function _onOkay() {
		if (value) {
			onOkay({ channel_name: value, description: description });
		}
		close();
	}
	onMount(() => {
		ref.focus();
	});

	$: onChange(value);
</script>

<h2>{message}</h2>

<input
	style="margin-bottom: 10px;"
	placeholder="Name"
	type="text"
	bind:this={ref}
	bind:value
	on:keyup={(e) => e.which === 13 && _onOkay()}
/>
<input
	placeholder="Description"
	type="text"
	bind:value={description}
	on:keyup={(e) => e.which === 13 && _onOkay()}
/>

<div class="buttons">
	<button class="btn btn-light" on:click={_onCancel}> Cancel </button>
	<button class="btn btn-primary" on:click={_onOkay}> Okay </button>
</div>

<style>
	h2 {
		font-size: 2rem;
		text-align: center;
	}

	input {
		width: 100%;
	}

	.buttons {
		margin-top: 10px;
		display: flex;
		justify-content: end;
		gap: 1rem;
	}
</style>
