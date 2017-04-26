<section id="js-active-search-filters" class="js-active-search-filters templates--catalog--_partials--active-filters">
    {if $activeFilters|count}
        <h3 class="h3">{l s='Active filters' d='Shop.Theme'}</h3>
        <ul class="filters">
            {foreach from=$activeFilters item="filter"}
                <li class="item">
                    <a class="js-search-link" href="{$filter.nextEncodedFacetsURL}" title="{l s='Remove' d='Shop.Theme.Actions'}">
                        <svg class="icon">
                            <use xlink:href="#cancel"/>
                        </svg>
                        {l s='%facet_label%: %facet_value%' sprintf=['%facet_label%' => $filter.facetLabel, '%facet_value%' => $filter.label] d='Shop.Theme.Catalog'}


                    </a>
                </li>
            {/foreach}
        </ul>
        <div class="clear">
            <a href="{$clear_all_link}" data-search-url="{$clear_all_link}" title="" class="js-search-filters-clear-all">
                <svg class="icon">
                    <use xlink:href="#refresh"/>
                </svg>
                {l s='Reset all filter' d='Shop.Theme.Actions'}
            </a>
        </div>
    {/if}
</section>
