<script lang="ts">
    import {count} from '$lib/stores/count';
    
    function decrement() {
        count.update((n:number) => n-1);
    }

    function increment() {
        count.update((n:number) => n+1);
    }

</script>


<div class="inline-flex">
    <button on:click={increment} class="flex mx-auto mt-8 text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg">
        Increment
    </button>
    <button on:click={decrement} class="flex mx-auto mt-8 text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg">
        Decrement
    </button>
</div>