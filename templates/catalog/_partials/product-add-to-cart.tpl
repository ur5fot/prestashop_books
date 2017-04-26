<div class="templates--catalog--_partials--product-add-to-cart">
    {if !$configuration.is_catalog}

        {block name='product_quantity'}
            <div class="product-quantity">
                <label class="group-title" for="quantity_wanted">{l s='Quantity' d='Shop.Theme.Catalog'}</label>
                <input
                        type="number"
                        name="qty"
                        id="quantity_wanted"
                        value="{$product.quantity_wanted}"
                        class="group"
                        min="{$product.minimal_quantity}"
                >
            </div>
        {/block}

        {block name='product_minimal_quantity'}
            <div class="product-minimal-quantity">
                {if $product.minimal_quantity > 1}
                    {l
                    s='The minimum purchase order quantity for the product is %quantity%.'
                    d='Shop.Theme.Checkout'
                    sprintf=['%quantity%' => $product.minimal_quantity]
                    }
                {/if}
            </div>
        {/block}
        <button class="btn btn-yes" type="submit" name="add" data-button-action="add-to-cart"
                {if !$product.add_to_cart_url}disabled{/if}>
            {l s='Add to cart' d='Shop.Theme.Actions'}
        </button>
    {/if}
</div>
