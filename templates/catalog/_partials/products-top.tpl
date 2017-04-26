<div id="js-product-list-top" class="templates--catalog--_partials--products-top">
    {if $listing.pagination.total_items|count > 1}
        <p>{l s='There are %product_count% products.' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items|count]}</p>
    {elseif $listing.pagination.total_items > 0}
        <div class="there-product">{l s='There is 1 product.' d='Shop.Theme.Catalog'}</div>
    {/if}


    <div class="wrapper">
        {block name='pagination_summary'}
            <div class="display-quantity">{l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=[
                '%from%' => $listing.pagination.items_shown_from ,
                '%to%' => $listing.pagination.items_shown_to,
                '%total%' => $listing.pagination.total_items
                ]}</div>
        {/block}

        {block name='sort_by'}
            {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
        {/block}
    </div>

</div>
