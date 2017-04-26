{function name="menu" nodes=[] depth=0}
    {strip}
        {if $nodes|count}
            <ul data-depth="{$depth}" class="depth-{$depth}">
                {foreach from=$nodes item=node}
                    <li class="{$node.type}{if $node.current} current{/if} item">
                        <a href="{$node.url}" {if $node.open_in_new_window} target="_blank" {/if}>{$node.label}</a>
                        <div class="sub">
                            {menu nodes=$node.children depth=$node.depth}
                            {if $node.image_urls|count}
                                <div class="menu-images-container">
                                    {foreach from=$node.image_urls item=image_url}
                                        <img src="{$image_url}">
                                    {/foreach}
                                </div>
                            {/if}
                        </div>
                    </li>
                {/foreach}
            </ul>
        {/if}
    {/strip}
{/function}

<div class="modules--ps_mainmenu">
    <a class="link-departments" href="#">Категории магазина</a>
    {menu nodes=$menu.children}
</div>
