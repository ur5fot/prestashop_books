{extends file='page.tpl'}

{block name='page_title'}
    {l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content_container'}
    <section id="content" class="page-content page-my-account">

        <p>{l s='Welcome to your account. Here you can manage all of your personal information and orders.' d='Shop.Theme.Customeraccount'}</p>

        {block name="account_link_list"}
            <ul class="link-list">
                {if $customer.addresses|count}
                    <li>
                        <a id="addresses-link" href="{$urls.pages.addresses}">
             <span>
               <svg class="icon">
                <use xlink:href="#geolocalization"/>
              </svg>
                 <br>

                 {l s='Addresses' d='Shop.Theme.Customeraccount'}
             </span>
                        </a>
                    </li>
                {else}
                    <li>
                        <a id="address-link" href="{$urls.pages.address}">
                            <span>
               <svg class="icon">
                <use xlink:href="#geolocalization"/>
              </svg>
                 <br>

                                {l s='Add first address' d='Shop.Theme.Customeraccount'}
             </span>
                        </a>
                    </li>
                {/if}

                <li>
                    <a id="identity-link" href="{$urls.pages.identity}">
                         <span>
               <svg class="icon">
                <use xlink:href="#open-book"/>
              </svg>
                 <br>

                             {l s='Information' d='Shop.Theme.Customeraccount'}
             </span>
                    </a>
                </li>

                {if !$configuration.is_catalog}
                    <li>
                        <a id="history-link"  href="{$urls.pages.history}">
                             <span>
               <svg class="icon">
                <use xlink:href="#trolley"/>
              </svg>
                 <br>

                                 {l s='Order history and details' d='Shop.Theme.Customeraccount'}
             </span>

                        </a>
                    </li>
                {/if}

                {if !$configuration.is_catalog}
                    <li>
                        <a id="order-slips-link"
                           href="{$urls.pages.order_slip}">
                             <span>
               <svg class="icon">
                <use xlink:href="#credit-card"/>
              </svg>
                 <br>

                                 {l s='Credit slips' d='Shop.Theme.Customeraccount'}
             </span>

                        </a>
                    </li>
                {/if}

                {if $configuration.voucher_enabled && !$configuration.is_catalog}
                    <li>
                        <a id="discounts-link"
                           href="{$urls.pages.discount}">{l s='Vouchers' d='Shop.Theme.Customeraccount'}</a>
                    </li>
                {/if}

                {if $configuration.return_enabled && !$configuration.is_catalog}
                    <li>
                        <a id="returns-link"
                           href="{$urls.pages.order_follow}">{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}</a>
                    </li>
                {/if}

                {block name='display_customer_account'}
                    {hook h='displayCustomerAccount'}
                {/block}

            </ul>
        {/block}

    </section>
{/block}
