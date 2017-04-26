<div id="blockcart-wrapper" class="modules--ps_shoppingcart--ps_shoppingcart">
    <div class="blockcart cart-preview" data-refresh-url="{$refresh_url}">
        <div class="header">
            {if $cart.products_count > 0}
            <a rel="nofollow" href="{$cart_url}">
                {/if}
                <i  class="templates--checkout--cart"><span><svg class="icon"><use xlink:href="#shopping-cart"/></svg></span>
                <span>{l s='Cart' d='Shop.Theme.Actions'}</span>
                <span class="count">{$cart.summary_string}</span></i>
                {if $cart.products_count > 0}
            </a>
            {/if}
        </div>
        {if $cart.products_count > 0}
            <div class="body">
                <ul>
                    {foreach from=$cart.products item=product}
                        <li>{include 'module:ps_shoppingcart/ps_shoppingcart-product-line.tpl' product=$product}</li>
                    {/foreach}
                </ul>
                <div class="wrapper">
                    <div class="cart-subtotals">
                        {foreach from=$cart.subtotals item="subtotal"}
                            <div class="{$subtotal.type}">
                                <span class="label">{$subtotal.label}</span>
                                <span class="value">{$subtotal.amount}</span>
                            </div>
                        {/foreach}
                    </div>
                    <div class="cart-total">
                        <span class="label">{$cart.totals.total.label}</span>
                        <span class="value">{$cart.totals.total.amount}</span>
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>
