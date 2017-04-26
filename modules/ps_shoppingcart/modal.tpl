<div id="blockcart-modal" class="modules--ps_shoppingcart--modal" data-close-on-click="true">
    <div>
        <section>
            {*<h3>{l s='Product Successfully Added to Your Shopping Cart' d='Shop.Theme.Checkout'}</h3>
            {$product.name}
            *}{*TODO: product image*}{*
      *}{*TODO: cross-selling*}

            <header>
                <h3 class="h3 product-name">{l s='Product Successfully Added to Your Shopping Cart' d='Shop.Theme.Checkout'}</h3>
                <p>{$product.name} - {$product.price}</p>
            </header>

            <div class="img">
                <img class="product-image" src="{$product.cover.medium.url}" alt="{$product.cover.legend}"
                     title="{$product.cover.legend}" itemprop="image">
            </div>

            <div class="description">
                {hook h='displayProductPriceBlock' product=$product type="unit_price"}
                {foreach from=$product.attributes item="property_value" key="property"}
                    <span><strong>{$property}</strong>: {$property_value}</span>
                    <br>
                {/foreach}
                <p><strong>{l s='Quantity:' d='Shop.Theme.Checkout'}</strong>&nbsp;{$product.cart_quantity}</p>
            </div>

        </section>
    </div>
</div>
