{extends file='catalog/listing/product-list.tpl'}

{block name='product_list_header'}
    <div class="templates--catalog--listing--_category">
        <h1>{$category.name}</h1>
        <div class="category-cover">
            <img src="{$category.image.large.url}" alt="{$category.image.legend}">
        </div>
        <div id="category-description" class="category-description">{$category.description nofilter}</div>
    </div>

  {block name='category_subcategories'}
    <aside class="aside">
      {if $subcategories|count}
        <nav class="subcategories">

            {foreach from=$subcategories item="subcategory"}

                {block name='category_miniature'}
                  {include file='catalog/_partials/miniatures/category.tpl' category=$subcategory}
                {/block}

            {/foreach}
        </nav>
      {/if}
    </aside>
  {/block}

{/block}
