$(document).ready(function () {


    prestashop.blockcart = prestashop.blockcart || {};

    var showModal = prestashop.blockcart.showModal || function showModal(modal) {

            var $body = $('body');
            var pageY = 0, pageX = 0;

            // console.log('ps_shoppingcart pageY', prestashop.event.pageY);
            // console.log('ps_shoppingcart pageX', prestashop.event.pageX);

            $(modal)
                .appendTo($body)
                .css({
                    position: 'fixed',
                    top: prestashop.event.pageY - $('#blockcart-modal').outerHeight() - $(document).scrollTop(),
                    left: prestashop.event.pageX - ($('#blockcart-modal').outerWidth() / 2)
                })
                .fadeIn(300)
                .delay(1000)
                .fadeOut(300);

            $body.one('click', '#blockcart-modal', function (event) {
                if (event.target.id === 'blockcart-modal') {
                    $(event.target).remove();
                }
            });

        };
    prestashop.blockcart.showModal = showModal;
    $(document).ready(function () {
        prestashop.on(
            'updateCart',
            function (event) {
                var refreshURL = $('.blockcart').data('refresh-url');
                var requestData = {};

                // console.log('ps_shoppingcart refreshURL', refreshURL);

                if (event && event.reason) {
                    requestData = {
                        id_product_attribute: event.reason.idProductAttribute,
                        id_product: event.reason.idProduct,
                        action: event.reason.linkAction
                    };
                }

                $.post(refreshURL, requestData).then(function (resp) {
                    // console.log('ps_shoppingcart resp', resp);
                    $('.blockcart').replaceWith($(resp.preview).find('.blockcart'));
                    if (resp.modal) {
                        showModal(resp.modal);
                    }
                }).fail(function (resp) {
                    prestashop.emit('handleError', {eventType: 'updateShoppingCart', resp: resp});
                });
            }
        );

    });



});
