<nav class="templates--_partials--pagination">
    <div class="wrapper">
        <div class="quantity">
            {block name='pagination_summary'}
            {l s='Showing %from%-%to% of %total% item(s)' sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items] d='Shop.Theme.Catalog'}
        {/block}
        </div>

        {block name='pagination_page_list'}
            <ul class="page-list">
                {foreach from=$pagination.pages item="page"}
                    <li {if $page.current} class="current" {/if}>
                        {if $page.type === 'spacer'}
                            <span class="spacer">&hellip;</span>
                        {else}
                            <a
                                    rel="{if $page.type === 'previous'}prev{elseif $page.type === 'next'}next{else}nofollow{/if}"
                                    href="{$page.url}"
                                    class="{['disabled' => !$page.clickable, 'js-search-link' => true]|classnames}"
                            >
                                {if $page.type === 'previous'}
                                    {l s='Previous' d='Shop.Theme.Actions'}
                                {elseif $page.type === 'next'}
                                    {l s='Next' d='Shop.Theme.Actions'}
                                {else}
                                    {$page.page}
                                {/if}
                            </a>
                        {/if}
                    </li>
                {/foreach}
            </ul>
        {/block}
    </div>

</nav>
