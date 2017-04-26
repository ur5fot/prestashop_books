{block name='address_block_item'}
    <article id="address-{$address.id}" class="address templates--customer--_partials--block-address" data-id-address="{$address.id}">
        <header>
            <h2 class="h4">{$address.alias}</h2>
        </header>

        <div class="address">

            <div class="content">{$address.formatted nofilter}</div>

            {block name='address_block_item'}
                <footer class="actions address-actions">
                    <ul class="action-list">
                        <li>
                            <a href="{url entity=address id=$address.id}" data-link-action="edit-address" title="{l s='Update' d='Shop.Theme.Actions'}">
                                <svg class="icon">
                                    <use xlink:href="#edit" />
                                </svg>
                            </a>
                        </li>
                        <li>
                            <a href="{url entity=address id=$address.id params=['delete' => 1, 'token' => $token]}"
                               data-link-action="delete-address" title=" {l s='Delete' d='Shop.Theme.Actions'}">
                                <svg class="icon">
                                    <use xlink:href="#garbage" />
                                </svg>
                            </a>
                        </li>
                    </ul>
                </footer>
            {/block}
        </div>
    </article>
{/block}
