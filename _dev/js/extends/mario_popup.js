$(function () {
    $(document).mousemove(function (event) {

        if (!prestashop.event) {
            prestashop.event = {};
        }

        prestashop.event = event;

    });

   /*if ( !prestashop.extends) {
         prestashop.extends = {}
    }
     prestashop.extends.marioPopup = function (modal) {

            var $body = $('body');
            var pageY = 0, pageX = 0;

            // console.log('ps_shoppingcart pageY', prestashop.event.pageY);
            // console.log('ps_shoppingcart pageX', prestashop.event.pageX);

            $(modal)
                .appendTo($body)
                .css({
                    position: 'fixed',
                    top: prestashop.event.pageY /!*- $('#blockcart-modal').outerHeight() - $(document).scrollTop()*!/,
                    left: prestashop.event.pageX/!* - ($('#blockcart-modal').outerWidth() / 2)*!/
                })
                .fadeIn(300)
                .delay(1000);


            $body.one('click', '#blockcart-modal', function (event) {
                if (event.target.id === 'blockcart-modal') {
                    $(event.target).remove();
                }
            });

        };*/

});