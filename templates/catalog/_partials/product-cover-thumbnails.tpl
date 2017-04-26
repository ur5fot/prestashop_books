<div class="templates--catalog--_partials--product-cover-thumbnails">
    {*<div class="wrapper-scroll1">*}
        <div class="wrapper">
            {block name='product_cover'}
                <div class="product-cover">
                    <img
                            class="js-image-medium"
                            src="{$product.cover.bySize.medium_default.url}"
                            alt="{$product.cover.legend}"
                            title="{$product.cover.legend}"
                            width="{$product.cover.bySize.medium_default.width}"
                            itemprop="image"
                            data-image-large-src="{$product.cover.bySize.large_default.url}"
                    >
                    <svg class="icon">
                        <use xlink:href="#zoom-in"/>
                    </svg>
                </div>
            {/block}

            {block name='product_images'}
                <ul class="product-images">
                    {foreach from=$product.images item=image}
                        <li>
                            <img
                                    class="js-image-thumb {if $image.id_image == $product.cover.id_image} selected {/if}"
                                    data-image-medium-src="{$image.bySize.medium_default.url}"
                                    data-image-large-src="{$image.bySize.large_default.url}"
                                    src="{$image.medium.url}"
                                    alt="{$image.legend}"
                                    title="{$image.legend}"
                                    width="100"
                                    itemprop="image">
                        </li>
                    {/foreach}
                </ul>
            {/block}
        </div>
    {*</div>*}
</div>
