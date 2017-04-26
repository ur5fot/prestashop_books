{block name='category_miniature_item'}
  <section class="templates--catalog--_partials--miniatures--category">
    <p class="img">
      <a href="{$category.url}">
        <img src="{$category.image.medium.url}" alt="{$category.image.legend}">
      </a>
    </p>

    <h3 class="h3">
      <a href="{$category.url}">{$category.name}</a>
    </h3>

    <div class="description">{$category.description nofilter}</div>
  </section>
{/block}
