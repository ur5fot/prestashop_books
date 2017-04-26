{extends file=$layout}

{block name='content'}
    <section id="main" class="main templates--checkout--cart">
        <h1>{l s='Shopping Cart' d='Shop.Theme.Checkout'}</h1>

        {block name='cart_overview'}
            {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
        {/block}



        {block name='hook_shopping_cart_footer'}
            {hook h='displayShoppingCartFooter'}
        {/block}

        <div class="product-right-column">
            {block name='cart_summary'}
                <div class="summary">
                    <h3>Итого</h3>
                    {block name='cart_summary_line'}
                        {include file='checkout/_partials/cart-summary-items-subtotal.tpl' cart=$cart}
                    {/block}

                    {block name='cart_voucher'}
                        {include file='checkout/_partials/cart-voucher.tpl'}
                    {/block}

                    {block name='hook_shopping_cart'}
                        {hook h='displayShoppingCart'}
                    {/block}

                    {block name='cart_totals'}
                        {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
                    {/block}

                    {block name='continue_shopping'}
                        <a class="btn-no " href="{$urls.pages.index}">
                            {l s='Continue shopping' d='Shop.Theme.Actions'}
                        </a>
                    {/block}
                    {if $cart.products_count > 0}
                        {block name='cart_actions'}
                            {if $cart.minimalPurchaseRequired}
                                <div class="notification notification-warning" role="alert" data-alert="warning">
                                    {$cart.minimalPurchaseRequired}
                                </div>
                                <button disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
                            {elseif empty($cart.products)}
                                <button disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
                            {else}
                                <a class="cart-actions-link btn-yes"
                                   href="{$urls.pages.order}">{l s='Checkout' d='Shop.Theme.Actions'}</a>
                                {hook h='displayExpressCheckout'}
                            {/if}
                        {/block}
                    {/if}
                </div>
            {/block}

            {block name='hook_reassurance'}
                {hook h='displayReassurance'}
            {/block}
        </div>

    </section>
{/block}
