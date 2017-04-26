{*
* 2007-2015 PrestaShop
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
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="modules--ps_contactinfo--ps_contactinfo-rich">

    <h3 class="h3">{l s='Информация о магазине' d='Modules.Contactinfo.Shop'}</h3>

    <ul class="content">
        <li>
            <svg class="icon">
                <use xlink:href="#placeholder"/>
            </svg>
            <span>{$contact_infos.address.formatted nofilter}</span>
        </li>
        <li>
            {if $contact_infos.phone}

                <a href="tel:{$contact_infos.phone}">
                    <svg class="icon">
                        <use xlink:href="#24-hours"/>
                    </svg>
                    {$contact_infos.phone}
                </a>
            {/if}
        </li>
        <li>
            {if $contact_infos.fax}

                <a href="fax:{$contact_infos.fax}">
                    <svg class="icon">
                        <use xlink:href="#24-hours"/>
                    </svg>
                    {$contact_infos.fax}
                </a>
            {/if}
        </li>
        <li>
            {if $contact_infos.email}

                <a href="mailto:{$contact_infos.email}">
                    <svg class="icon">
                        <use xlink:href="#message"/>
                    </svg>
                    {$contact_infos.email}
                </a>
            {/if}
        </li>
    </ul>

</div>
