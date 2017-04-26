$(function () {
    $(document).on('click', '[data-link-action="add-to-cart"]', function (event) {
        var $this = $(this);

        event.preventDefault();

        $.post(prestashop.urls.pages.cart, $this.attr('href') + '&add=1&action=update', null, 'json').then(function (resp) {
            if (resp.hasError) {
                $('.js-error').show().find('.js-error-text').text(resp.errors[0]);

                return;
            }

            // Refresh cart preview
            prestashop.emit('updateCart', {
                reason: {
                    idProduct: $this.attr('data-id-product'),
                    idProductAttribute:  $this.attr('data-id-product-attribute'),
                    linkAction: 'add-to-cart'
                }
            });
        }).fail(function (resp) {
            prestashop.emit('handleError', {eventType: 'updateCart', resp: resp});
        });

    });
});
