<section id="js-checkout-summary" class="js-cart js-checkout-summary templates--checkout--_partials--cart-summary" data-refresh-url="{url entity='cart' params=['ajax' => 1]}">
  {block name='hook_checkout_summary_top'}
    {hook h='displayCheckoutSummaryTop'}
  {/block}

  {block name='cart_summary_header'}
    <header>
      <h3 class="h3">{l s='Your order' d='Shop.Theme.Customeraccount'} - <span>{$cart.summary_string}</span></h3>

    </header>
  {/block}

  {block name='cart_summary_product_list'}
    <div id="cart-summary-product-list" class="product-list">
      <ul>
        {foreach from=$cart.products item=product}
          <li>{include file='checkout/_partials/cart-summary-product-line.tpl' product=$product}</li>
        {/foreach}
      </ul>
    </div>
  {/block}

  {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block}

  {block name='cart_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}
</section>
