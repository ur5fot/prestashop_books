{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{function name="categories" nodes=[] depth=0}
    {strip}
        {if $nodes|count}
            <ul>
                {foreach from=$nodes item=node}
                    <li>
                        <p>
                            <a href="{$node.link}" class="title">{$node.name}</a>


                        </p>
                        <div class="sub-sub-category">
                            {categories nodes=$node.children depth=$depth+1}
                        </div>
                    </li>
                {/foreach}
            </ul>
        {/if}
    {/strip}
{/function}

<div class="modules--ps_categorytree js-modules--ps_categorytree">
    <ul class="wrapper">
        <li class="category"><a href="{$categories.link nofilter}" class="title">{$categories.name}</a> <svg class="icon plus hide">
                <use xlink:href="#plus" />
            </svg>
            <svg class="icon minus hide">
                <use xlink:href="#minus" />
            </svg></li>
        <li class="sub-category">{categories nodes=$categories.children}</li>
    </ul>
</div>
