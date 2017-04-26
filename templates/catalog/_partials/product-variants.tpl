<div class="templates--catalog--_partials--product-variants">
    {foreach from=$groups key=id_attribute_group item=group}
        <div class="item">
            <label class="group-title" for="group_{$id_attribute_group}">{$group.name}</label>
            {if $group.group_type == 'select'}

                {block name='product_variants_select'}
                    <select
                            data-product-attribute="{$id_attribute_group}"
                            name="group[{$id_attribute_group}]"
                            id="group_{$id_attribute_group}"
                            class="group"
                    >
                        {foreach from=$group.attributes key=id_attribute item=group_attribute}
                            <option
                                    value="{$id_attribute}"
                                    title="{$group_attribute.name}"
                                    {if $group_attribute.selected} selected="selected"{/if}
                            >
                                {$group_attribute.name}
                            </option>
                        {/foreach}
                    </select>
                {/block}

            {else if $group.group_type == 'color'}

                {block name='product_variants_color'}
                    <ul id="group_{$id_attribute_group}" class="group">
                        {foreach from=$group.attributes key=id_attribute item=group_attribute}
                            <li class="input-container">
                                <label
                                        class="input-color"
                                        for="color-{$id_attribute}"
                                        {if $group_attribute.html_color_code} style="background-color: {$group_attribute.html_color_code}" {/if}
                                        {if $group_attribute.texture} style="background-image: url({$group_attribute.texture})" {/if}
                                >
                                    <input
                                            class="input-color"
                                            type="radio"
                                            data-product-attribute="{$id_attribute_group}"
                                            name="group[{$id_attribute_group}]"
                                            value="{$id_attribute}"{if $group_attribute.selected}
                                        checked="checked"{/if}
                                            id="color-{$id_attribute}"
                                    >

                                    {*<span>{$group_attribute.name}</span>*}
                                </label>
                            </li>
                        {/foreach}
                    </ul>
                {/block}

            {else if $group.group_type == 'radio'}

                {block name='product_variants_radio'}
                    <ul id="group_{$id_attribute_group}" class="group">
                        {foreach from=$group.attributes key=id_attribute item=group_attribute}
                            <li class="input-container">
                                <input
                                        type="radio"
                                        data-product-attribute="{$id_attribute_group}"
                                        name="group[{$id_attribute_group}]"
                                        value="{$id_attribute}"
                                        {if $group_attribute.selected} checked="checked"{/if}
                                >
                                <span>{$group_attribute.name}</span>
                            </li>
                        {/foreach}
                    </ul>
                {/block}

            {/if}
        </div>
    {/foreach}
</div>
