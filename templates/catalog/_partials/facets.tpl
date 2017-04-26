<div id="search_filters" class="templates--catalog--_partials--facets">
    {foreach from=$facets item="facet"}

        {if $facet.displayed}
            <section class="facet">
                <h3 class="h3">{$facet.label}</h3>
               {* <p>-- {$facet.type} </p>*}

                {if  {$facet.type} == "price"}
                   <form id="facet-price-form" class="facet-price-form">
                     <p class="center"> <input type="number" class="js-input-min min"><input type="number" class="js-input-max max">
                       <button class=" btn-neutral">ок</button></p>
                   </form>
                    <div class="facet-slider "></div>
                    <ul class="js-radio-buttons {$facet.type}">
                                            {foreach from=$facet.filters item="filter"}
                                                {if $filter.displayed}
                                                    <li>
                                                        <label>
                                                            {if  $facet.multipleSelectionAllowed }
                                                                <input
                                                                        data-search-url="{$filter.nextEncodedFacetsURL}"
                                                                        {if !$js_enabled} class="ps-shown-by-js" {/if}
                                                                        type="checkbox"
                                                                        {if $filter.active } checked {/if}
                                                                >
                                                            {else}
                                                                <input
                                                                        data-search-url="{$filter.nextEncodedFacetsURL}"
                                                                        {if !$js_enabled} class="ps-shown-by-js" {/if}
                                                                        type="radio"
                                                                        name="filter {$facet.label}"
                                                                        {if $filter.active } checked {/if}
                                                                >
                                                            {/if}

                                                            <a
                                                                    rel="nofollow"
                                                                    href="{$filter.nextEncodedFacetsURL}"
                                                                    data-type="{$facet.type}"
                                                                    class="js-search-link {if $filter.active} active {/if}"
                                                            >
                                                                {$filter.label}
                                                                {if $filter.magnitude}
                                                                    <span class="magnitude"> ({$filter.magnitude})</span>
                                                                {/if}
                                                            </a>
                                                        </label>
                                                    </li>
                                                {/if}
                                            {/foreach}
                                        </ul>
                {elseif $facet.widgetType !== 'dropdown'}
                    <ul>
                        {foreach from=$facet.filters item="filter"}
                            {if $filter.displayed}
                                <li>
                                    <label>
                                        {if  $facet.multipleSelectionAllowed }
                                            <input
                                                    data-search-url="{$filter.nextEncodedFacetsURL}"
                                                    {if !$js_enabled} class="ps-shown-by-js" {/if}
                                                    type="checkbox"
                                                    {if $filter.active } checked {/if}
                                            >
                                        {else}
                                            <input
                                                    data-search-url="{$filter.nextEncodedFacetsURL}"
                                                    {if !$js_enabled} class="ps-shown-by-js" {/if}
                                                    type="radio"
                                                    name="filter {$facet.label}"
                                                    {if $filter.active } checked {/if}
                                            >
                                        {/if}

                                        <a
                                                rel="nofollow"
                                                href="{$filter.nextEncodedFacetsURL}"
                                                type="{$facet.type}"
                                                class="js-search-link {if $filter.active} active {/if}"
                                        >
                                            {$filter.label}
                                            {if $filter.magnitude}
                                                <span class="magnitude"> ({$filter.magnitude})</span>
                                            {/if}
                                        </a>
                                    </label>
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                {else}
                    <form>
                        <input type="hidden" name="order" value="{$sort_order}">
                        <select name="q">
                            <option disabled selected hidden>{l s='(no filter)' d='Shop.Theme'}</option>
                            {foreach from=$facet.filters item="filter"}
                                {if $filter.displayed}
                                    <option
                                            {if $filter.active}
                                                selected
                                                value="{$smarty.get.q}"
                                            {else}
                                                value="{$filter.nextEncodedFacets}"
                                            {/if}
                                    >
                                        {$filter.label}
                                        {if $filter.magnitude}
                                            ({$filter.magnitude})
                                        {/if}
                                    </option>
                                {/if}
                            {/foreach}
                        </select>
                        {if !$js_enabled}
                            <button class="ps-hidden-by-js" type="submit">
                                {l s='Filter' d='Shop.Theme.Actions'}
                            </button>
                        {/if}
                    </form>
                {/if}
            </section>
        {/if}
    {/foreach}
</div>
