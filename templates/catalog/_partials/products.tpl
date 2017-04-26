<div id="js-product-list" class="templates--catalog--_partials--products">
  {foreach from=$listing.products item="product"}
    {block name='product_miniature'}
      {include file='catalog/_partials/miniatures/product.tpl' product=$product}
        <div class="od"></div>
    {/block}
  {/foreach}

  {block name='pagination'}
    {include file='_partials/pagination.tpl' pagination=$listing.pagination}
  {/block}

  {block name='back_to_top'}
    <div class="back-to-top"><a href="#header" title="{l s='Back to top' d='Shop.Theme.Actions'}">
            <svg class="icon">
                <use xlink:href="#arrows" />
            </svg>
        </a></div>
  {/block}
</div>
