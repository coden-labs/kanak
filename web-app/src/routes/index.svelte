<script lang="ts">
    import Head from '$lib/components/common/Head.svelte';
</script>

<Head page_title="Home" />
<section class="text-gray-600 body-font">
    <div class="container px-5 py-24 mx-auto">
        <div class="flex flex-col text-center w-full mb-20">
            <h2 class="text-xs text-red-500 tracking-widest font-medium title-font mb-1">
                Your Personal Finance Tracker
            </h2>
            <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">
                kanak
            </h1>
            <p class="lg:w-2/3 mx-auto leading-relaxed text-base">
                kanak.io is a finance tracker I am creating for myself. This combines into a single
                application, expense management and finance tracking. This app will likely not work
                for you. This is also a test-bed for technologies I am interested in.
            </p>
        </div>
        <div class="flex flex-wrap">
            <div class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60">
                <h2 class="text-lg sm:text-xl text-gray-900 font-medium title-font mb-2">
                    Investment Tracking
                </h2>
                <p class="leading-relaxed text-base mb-4">
                    Track how your investments are doing, answer simple to ask but actually hard
                    to answer questions like,
                </p>
                <ol>
                    <li>How did my investments do over the past year?</li>
                    <li>In my tax siutation did X with tax benefits or Y without net more?</li>
                    <li>What is the real returns on my rented out property net of expense?</li>
                </ol>
                <!-- svelte-ignore a11y-missing-attribute -->
                <a class="text-red-500 inline-flex items-center">
                    Learn More
                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">
                        <path d="M5 12h14M12 5l7 7-7 7"></path>
                    </svg>
                </a>
            </div>
            <div class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60">
                <h2 class="text-lg sm:text-xl text-gray-900 font-medium title-font mb-2">
                    Client Side Encryption
                </h2>
                <p class="leading-relaxed text-base mb-4">
                    All your financial data (other than <em>Shared Documents</em>) is client side
                    encrypted, and for any live market data we need to fetch we employ zero tracking.
                    <br />
                    We believe in extreme data minimisation, because financial data isn't an asset,
                    it is a liability that we do NOT want to leak. So if we do NOT have your data,
                    we can NOT leak your data.
                </p>
                <!-- svelte-ignore a11y-missing-attribute -->
                <a class="text-red-500 inline-flex items-center">
                    Learn More
                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">
                        <path d="M5 12h14M12 5l7 7-7 7"></path>
                    </svg>
                </a>
            </div>
            <div class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60">
                <h2 class="text-lg sm:text-xl text-gray-900 font-medium title-font mb-2">
                    Shared Documents
                </h2>
                <p class="leading-relaxed text-base mb-4">
                    Ensure your family or friends have access to your financial documents in case
                    something terrible happens to you. Share your data with your family in a secure
                    manner. Set it up such that at least x% of your family needs to come together
                    to get access to the document.
                </p>
                <!-- svelte-ignore a11y-missing-attribute -->
                <a class="text-red-500 inline-flex items-center">
                    Learn More
                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">
                        <path d="M5 12h14M12 5l7 7-7 7"></path>
                    </svg>
                </a>
            </div>
            <div class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60">
                <h2 class="text-lg sm:text-xl text-gray-900 font-medium title-font mb-2">
                    Tax Benefit Analyzer
                </h2>
                <p class="leading-relaxed text-base mb-4">
                    We provide a tax-benefit analyser that will run on the client side, and you can
                    without providing us access to your data, ensure you have taken advantage of all
                    your tax benefit 
                </p>
                <!-- svelte-ignore a11y-missing-attribute -->
                <a class="text-red-500 inline-flex items-center">
                    Learn More
                    <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">
                        <path d="M5 12h14M12 5l7 7-7 7"></path>
                    </svg>
                </a>
            </div>
        </div>
        <button class="flex mx-auto mt-16 text-white bg-red-500 border-0 py-2 px-8 focus:outline-none hover:bg-red-600 rounded text-lg">
            Join kanak
        </button>
    </div>
</section>
