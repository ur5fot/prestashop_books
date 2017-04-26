{block name='cart_summary_product_line'}
    <p class="templates--checkout--_partials--cart-summary-product-line">
        <span class="quantity">{$product.quantity}</span>
        <span class="price">{$product.price}</span>
        <span class="name">{$product.name}</span>
        {hook h='displayProductPriceBlock' product=$product type="unit_price"}
    </p>
{/block}
