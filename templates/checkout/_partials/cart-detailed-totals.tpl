{block name='cart_detailed_totals'}
  <div class="templates--checkout--_partials--cart-detailed-totals">
    <div class="subtotals">
      {foreach from=$cart.subtotals item="subtotal"}
        <div class="{$subtotal.type}">
          <span class="label">{$subtotal.label}</span>
          <span class="value">{$subtotal.amount}</span>
        </div>
      {/foreach}
    </div>

    <div class="total">
      <span class="label">{$cart.totals.total.label}</span>
      <span class="value">{$cart.totals.total.amount}</span>
      {if $subtotal.type === 'shipping'}
          {hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}
      {/if}
    </div>
  </div>
{/block}
