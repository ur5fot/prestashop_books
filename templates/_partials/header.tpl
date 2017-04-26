<div class="templates--_partials--header">
    {block name='header_banner'}
        <div class="header-banner">
            {hook h='displayBanner'}
        </div>
    {/block}

    {block name='header_nav'}
        <div class="header-nav">
            <div class="container">
                {hook h='displayNav'}
            </div>
        </div>
    {/block}

    <div class="header-bottom">
        <div class="container">
            {block name='header_logo'}
                <a class="header-logo " href="{$urls.base_url}" title="{$shop.name}">
                    <img src="{$shop.logo}" alt="{$shop.name}">
                </a>
            {/block}

            {block name='header_top'}
                <div class="nav">
                    {hook h='displayTop'}
                </div>

                {hook h='displaySearch'}

                {hook h='displayNavFullWidth'}

            {/block}
        </div>
    </div>
</div>
