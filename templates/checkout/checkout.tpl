<!doctype html>
<html lang="{$language.iso_code}">

<head>
    {block name='head'}
        {include file='_partials/head.tpl'}
    {/block}
</head>

<body id="{$page.page_name}" class="{$page.body_classes|classnames}">

<header id="header">
    {block name='header'}
        {include file='checkout/_partials/header.tpl'}
    {/block}
</header>

<div class="wrapper templates--checkout--checkout">
    {block name='notifications'}
        {include file='_partials/notifications.tpl'}
    {/block}
    <div class="content-wrapper">
        <section id="main" class="container main ">
            <h1>Оформление заказа</h1>
            {block name='content'}
                <section id="content" class="content">

                    {block name='checkout_process'}
                        {render file='checkout/checkout-process.tpl' ui=$checkout_process}
                    {/block}

                    {block name='cart_summary'}
                        {include file='checkout/_partials/cart-summary.tpl' cart=$cart}
                    {/block}

                </section>
            {/block}
        </section>
    </div>
</div>
<footer id="footer">
    {block name='footer'}
        {include file='checkout/_partials/footer.tpl'}
    {/block}
</footer>

{block name='javascript_bottom'}
    {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
{/block}

</body>

</html>
