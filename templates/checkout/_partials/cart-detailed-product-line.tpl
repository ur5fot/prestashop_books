{block name='cart_detailed_product_line'}
    <div class="templates--checkout--_partials--cart-detailed-product-line">
        <div class="image"><img src="{$product.cover.small.url}"></div>
        <div class="description">
            <h3 class="name"><a href="{$product.url}"
                                data-id_customization="{$product.id_customization|intval}">{$product.name}</a></h3>
            {foreach from=$product.attributes key="attribute" item="value"}
            <span class="attributes">
                    <span class="label">{$attribute}:</span>
                    <span class="value">{$value}</span>
                </span>
            {/foreach}

            {block name='cart_detailed_product_line_customization'}
            {if $product.customizations|count}
            {foreach from=$product.customizations item="customization"}
            {foreach from=$customization.fields item="field"}
            <span class="product-line-info">
            <span class="label">{$field.label}:</span>
            <span class="value">
              {if $field.type == 'text'}
                  {if $field.id_module}
                      {$field.text nofilter}
                  {else}
                      {$field.text}
                  {/if}
              {elseif $field.type == 'image'}
                  <img src="{$field.image.small.url}">
              {/if}
            </span>
          </span>
            {/foreach}
            {/foreach}
            {/if}
            {/block}

            <span class="product-availability">{$product.availability}</span>
            <p class="wrapper-price">
                <span class="product-price">{$product.price}</span>
                {if $product.unit_price_full}
                    <small class="sub">{$product.unit_price_full}</small>
                {/if}

                {if $product.down_quantity_url}
                    <a href="{$product.down_quantity_url}" class="js-decrease-product-quantity decrease-quantity "
                       data-link-action="update-quantity">-</a>
                {/if}
                <span class="quantity">{$product.quantity}</span>
                {if $product.up_quantity_url}
                    <a href="{$product.up_quantity_url}" class="js-increase-product-quantity increase-quantity"
                       data-link-action="update-quantity">+</a>
                {/if}


                {block name='hook_cart_extra_product_actions'}
                    {hook h='displayCartExtraProductActions' product=$product}
                {/block}

                <span class="price">
        {if isset($product.is_gift) && $product.is_gift}
                    <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
                    {else}
                    {$product.total}
            </p>
            {/if}
            </span>
        </div>
        <a
                class="remove-from-cart"
                data-link-action="remove-from-cart"
                data-id-product="{$product.id_product|escape:'javascript'}"
                data-id-product-attribute="{$product.id_product_attribute|escape:'javascript'}"
                href="{$product.remove_from_cart_url}"
                rel="nofollow"
                title="{l s='Remove' d='Shop.Theme.Actions'}"
        >
            <svg class="icon">
                <use xlink:href="#garbage"/>
            </svg>
        </a>
    </div>
{/block}
