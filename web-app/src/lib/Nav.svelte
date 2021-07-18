<!-- This example requires Tailwind CSS v2.0+ -->

<script lang="ts">
    import { page } from '$app/stores';
    let showProfileDropdown= false;
    let showMobileDropdown = false;

    const toggleViewState = () => {
        showProfileDropdown = !showProfileDropdown;
    }

    const toggleMobileViewState = () => {
        showMobileDropdown = !showMobileDropdown;
    }

    let active = "home"

    page.subscribe(value => {

        if (value.path.startsWith("/about")){
            active = "about";
        } else {
            active = "home"
        }
    });

    const selected_class_modifier = (
        "bg-gray-900 text-white px-3 py-2 rounded-md text-sm font-medium"
    );
    const not_selected_class_modifier = (
        "text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium"
    );

</script>

<nav class="bg-gray-800">
    <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
    <div class="relative flex items-center justify-between h-16">
        <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
            <!-- Mobile menu button-->
            <button type="button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false" on:click={toggleMobileViewState}>
                <span class="sr-only">Open main menu</span>
                {#if showMobileDropdown}
                    <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                {:else}
                <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                </svg>
                {/if}
            </button>
        </div>
        <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
            <div class="hidden sm:block sm:ml-6">
                <div class="flex space-x-4">
                    <a href="/" class={active === "home" ? selected_class_modifier: not_selected_class_modifier}>
                        Home
                    </a>

                    <a href="/about" class={active === "about" ? selected_class_modifier: not_selected_class_modifier}>
                        About
                    </a>
                </div>
            </div>
        </div>
        <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
            <!-- Profile dropdown -->
            <div class="ml-3 relative">
                <div>
                    <button type="button" class="bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" id="user-menu-button" on:click={toggleViewState}>
                        <span class="sr-only">Open user menu</span>
                        <img class="h-8 w-8 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
                    </button>
                </div>

                {#if showProfileDropdown}
                    <div class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg py-1 bg-white ring-1 ring-black ring-opacity-5 focus:outline-none z-10" role="menu" aria-orientation="vertical" aria-labelledby="user-menu-button" tabindex="-1">
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-0">Your Profile</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-1">Settings</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700" role="menuitem" tabindex="-1" id="user-menu-item-2">Sign out</a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
    </div>
    {#if showMobileDropdown}
        <!-- Mobile menu, show/hide based on menu state. -->
        <div class="sm:hidden" id="mobile-menu">
            <div class="px-2 pt-2 pb-3 space-y-1">
                <a href="/" class={active === "home" ? selected_class_modifier: not_selected_class_modifier} >
                    Home
                </a>

                <a href="/about" class={active === "about" ? selected_class_modifier: not_selected_class_modifier}>
                    About
                </a>
            </div>
        </div>
    {/if}
</nav>
