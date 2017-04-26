$(function () {

    var $body = $('body');
    var refreshCount = [];
    var setTimeoutId;

    function handleCartAction(event) {

        event.preventDefault();

        var $this = $(event.currentTarget);

        /*var dataset = {
         idProduct: $this.attr('data-id-product'),
         idProductAttribute: $this.attr('data-id-product-attribute'),
         linkAction: 'remove-from-cart'
         };*/


        var requestData = {
            ajax: '1',
            action: 'refresh'
        };

        refreshs = $this.attr('href');

        // refreshCount++;


        // setTimeoutId = setTimeout(function getRefresh() {
        $.ajax({
            url: refreshs,
            method: 'POST',
            data: requestData,
            dataType: 'json'
        }).then(function (resp) {

            prestashop.emit('updateCart', resp);

        }).fail(function (resp) {
            console.error(resp);
            prestashop.emit('handleError', {
                eventType: 'updateProductInCart',
                resp: resp
                /*,
                 cartAction: cartAction.type*/
            });
        }).always(function () {
            // refreshCount++;
            // if (refreshCount) {
            //     setTimeout(getRefresh, 1000);
            //
            // }
        });
        // },
        // 1000);


    }

    $body.on(
        'click',
        '[data-link-action="remove-from-cart"], ' +
        '[data-link-action="remove-voucher"],' +
        ' [data-link-action="update-quantity"]',
        handleCartAction
    );

    if (prestashop.page.page_name === 'cart') {

        prestashop.on(
            'updateCart',
            function (event) {
                // console.log('on updateCart', event);
                var refreshURL = prestashop.urls.pages.cart + '&ajax=1&action=refresh';
                var requestData = {};

                // console.log('ps_shoppingcart refreshURL', refreshURL);

                if (event && event.reason) {
                    requestData = {
                        id_product_attribute: event.reason.idProductAttribute,
                        id_product: event.reason.idProduct,
                        action: event.reason.linkAction
                    };
                }
                var resp = event;
                // $.post(refreshURL, requestData).then(function (resp) {
                    // console.log('updateCart resp', resp);
                    // console.log(resp); .urls.pages.cart

                    $('.templates--checkout--_partials--cart-summary-items-subtotal')
                        .replaceWith(event.cart_summary_items_subtotal);

                    $('.templates--checkout--_partials--cart-detailed')
                        .replaceWith(event.cart_detailed);

                    $('.templates--checkout--_partials--cart-detailed-totals')
                        .replaceWith(event.cart_detailed_totals);

                   /* if (resp.modal) {
                        showModal(resp.modal);
                    }
                }).fail(function (resp) {
                    console.error(resp);
                    prestashop.emit('handleError', {eventType: 'updateShoppingCart', resp: resp});
                });*/
            }
        );

    }


});