<div class="templates--catalog--_partials--sort-orders">
  <span class="active">{if isset($listing.sort_selected)}{$listing.sort_selected}{else}{l s='Sort by:' d='Shop.Theme'}{/if}</span>
  <div class="wrapper">{foreach from=$sort_orders item=sort_order}
    <a
      class="{['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
      href="{$sort_order.url}"
      rel="nofollow"
    >
      {$sort_order.label}
    </a>
  {/foreach}</div>
</div>
