//@prepros-append extends/mario_popup.js
//@prepros-append pruduct_tabs.js
//@prepros-append pruduct_filter.js
//@prepros-append blockcart-modal.js
//@prepros-append templates/catalog/_partials/product-cover-thumbnails.js
//@prepros-append link_add_cart.js
//@prepros-append cart.js
/*костыль показывает фото-заглушку если  нет фото*/
//@prepros-append add_foto_defolt.js
//@prepros-append modules/ps_categorytree/ps_categorytree.js
//@prepros-append templates/catalog/_partials/facets.js

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
$(function () {

    var tabs = $('.tabs');
    // console.log(tabs);
    var nav = tabs.find('[data-content]');
    var content = tabs.find('.content');

    nav.on('click', function(e){
        var _this = $(this);

        content.find('section').removeClass('active');
        content.find('.' + _this.attr('data-content')).addClass('active');

        nav.removeClass('active');
        _this.addClass('active');
    })

});
// console.log($);
$(function () {
    var body = $('body'); // Our events are usually attached to the body

    var event = $.Event('click');

    event.target = body.find('#main');

    body.trigger(event);

    var activeSearchFilters = $('#js-active-search-filters');

    console.log('prestashop', prestashop);

// console.log('hhhh')

    /* $('.templates--catalog--_partials--facets').find('label').on('click', function (e) {
     var _this = $(this);

     /!*console.log(_this.find('.ps-shown-by-js').attr('data-search-url')) ;
     prestashop.emit('updateProductList', _this.find('.ps-shown-by-js').attr('data-search-url'));*!/
     console.log(e.target);

     if (e.target + '' === HTMLAnchorElement) {
     alert('lll');
     }
     return false

     });*/

    const parseSearchUrl = function (event) {
        if (event.target.dataset.searchUrl !== undefined) {
            return event.target.dataset.searchUrl;
        }

        if ($(event.target).parent()[0].dataset.searchUrl === undefined) {
            throw new Error('Can not parse search URL');
        }

        return $(event.target).parent()[0].dataset.searchUrl;
    };

    $('body').on('change', '#search_filters input[data-search-url]', function (event) {
        prestashop.emit('updateFacets', parseSearchUrl(event));
    });

    $('body').on('click', '.js-search-filters-clear-all', function (event) {
        event.preventDefault();
        prestashop.emit('updateFacets', parseSearchUrl(event));
    });

    $('body').on('click', '.js-search-link', function (event) {
        event.preventDefault();
        prestashop.emit('updateFacets', $(event.target).closest('a').get(0).href);
    });

    $('body').on('change', '#search_filters select', function (event) {
        const form = $(event.target).closest('form');
        prestashop.emit('updateFacets', '?' + form.serialize());
    });

    prestashop.on('updateProductList', function (data) {
        updateProductListDOM(data);
    });


    function updateProductListDOM(data) {
        $('#search_filters').replaceWith(data.rendered_facets);
        $('.js-active-search-filters').replaceWith(data.rendered_active_filters);
        $('#js-product-list-top').replaceWith(data.rendered_products_top);
        $('#js-product-list').replaceWith(data.rendered_products);
        $('#js-product-list-bottom').replaceWith(data.rendered_products_bottom);

        // let productMinitature = new ProductMinitature();
        // productMinitature.init();

    }

// console.log('activeSearchFilters.replaceWith()', activeSearchFilters);

// console.log(prestashop);
});
$(function () {

});
$(function () {


    var productCoverThumbnails = $('.templates--catalog--_partials--product-cover-thumbnails');
    var imageThumb = productCoverThumbnails.find('.js-image-thumb');
    var imageMedium = productCoverThumbnails.find('.js-image-medium');

    imageThumb.on('click',function (e) {
        imageMedium.attr('src', $(this).attr('data-image-medium-src'));
        imageMedium.attr('data-image-large-src', $(this).attr('data-image-large-src'));
        imageThumb.removeClass('selected');
        $(this).addClass('selected');
    });

    imageMedium.click(function (e) {

        /*if ($('.templates--catalog--_partials--product-cover-thumbnails').hasClass('.full')) {
            $('.templates--catalog--_partials--product-cover-thumbnails.full').remove();
        }*/

        $('body').addClass('modal-open');

        productCoverThumbnails
            .clone()
            .addClass('full')
            .appendTo('body')
            .fadeIn(300)
        ;

        var full = $('.templates--catalog--_partials--product-cover-thumbnails.full');

        /*imageThumb.add(full.find('.js-image-thumb').on('click',function (e) {

            imageThumb.removeClass('selected');
            $(this).addClass('selected');
        }));*/

        full
            .find('.js-image-medium')
            .attr('src', full.find('.js-image-medium').attr('data-image-large-src'))
            .end()
            .find('.js-image-thumb')
            .click(function (e) {
                full.find('.js-image-thumb').removeClass('selected');
                $(this).addClass('selected');
                full.find('.js-image-medium').attr('src', $(this).attr('data-image-large-src'));
            })
        ;

        full.click(function (e) {
            var $target = $(e.target);
            if ($target.hasClass('full')) {
                $(this).fadeOut(300, function () {
                    $('.templates--catalog--_partials--product-cover-thumbnails.full').remove();


                });
                $('body').removeClass('modal-open');
            }
        })

    });


});
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
$(function () {
    var  $item;

    function add_kostil() {
        $('.img').find('img').each(function (i,item) {
            $item = $(item);

            // console.log(!$item.attr('src'));

            if (!$item.attr('src')) {
                $item.attr('src', prestashop.urls.img_ps_url + 'silver_250_250.png');
            }

        })
    }

    add_kostil();
    $('body').click(function () {
        setTimeout(add_kostil, 2000)
    })


});

$(function () {
    var $modulesPs_categorytree = $('.js-modules--ps_categorytree');
    var $subCategory = $modulesPs_categorytree.find('.sub-category');
    var $iconPlus = $modulesPs_categorytree.find('.icon.plus');
    var $iconMinus = $modulesPs_categorytree.find('.icon.minus');

    if ($subCategory.find('*').is('*')) {

        $iconPlus.addClass('show').removeClass('hide');
    }

    $modulesPs_categorytree.on('click', '.icon', function (e) {
        // e.preventDefault();
        var $this = $(this);
        // console.log();
        $subCategory.slideToggle(400);

        $iconPlus.toggleClass('hide');
        $iconMinus.toggleClass('hide');

        $iconPlus.toggleClass('show');
        $iconMinus.toggleClass('show');

    })

});
$(function () {


    var getQuery = function (elem, query) {
        query = query.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
        var expr = "[\\?&]" + query + "=([^&#]*)";
        var regex = new RegExp(expr);
        var results = regex.exec(elem.attr('data-search-url'));
        if (results !== null) {
            return results[1];
            return decodeURIComponent(results[1].replace(/\+/g, " "));
        } else {
            return false;
        }
    };

    //console.log('facets', getQuery($radioButtons.find('[data-search-url]').first(), 'q'));
    //console.log('facets',$radioButtons.find('[data-search-url]').first().attr('data-search-url'));
    var currentUrl = prestashop.urls.current_url;

    function loadedSlider() {
        if ($("div").is(".facet-slider")) {
            var $facetSlider = $('.facet-slider');
            var $radioButtons = $('.js-radio-buttons');
            var $facetPriceForm = $('#facet-price-form');
            var $inputMin = $('.js-input-min');
            var $inputMax = $('.js-input-max');

            var qMin = getQuery($radioButtons.find('[data-search-url]').first(), 'q');
            var qMax = getQuery($radioButtons.find('[data-search-url]').last(), 'q');

            var min = qMin.split('.')[1].split('-')[1];
            var max = qMax.split('.')[1].split('-')[2];
            var qS = qMax.split('.')[0];

            console.log(prestashop.urls.current_url);
            console.log(qS);
            console.log(min);
            console.log(max);

            $inputMin.val(min);
            $inputMax.val(max);

            $facetPriceForm.submit(function (e) {

                prestashop.emit('updateFacets', currentUrl + '?q=' + qS + '.' + '-' +  $inputMin.val() + '-' + $inputMax.val());
                return false;

            });

            //prestashop.emit('updateFacets', currentUrl + '?q=' + qS + '.' + '-' +  $inputMin.val() + '-' + $inputMax.val());


            $facetSlider.slider({
                range: true,
                min: +min,
                max: +max,
                values: [+min, +max],
                slide: function (event, ui) {
                    $inputMin.val(ui.values[0]);
                    $inputMax.val(ui.values[1]);
                },
                change: function (event, ui) {
                    // console.log('facets', ui);
                    //%D0%A6%D0%B5%D0%BD%D0%B0-%D1%80%D1%83%D0%B1



                }
            });
        }
    }

    loadedSlider();


    prestashop.on('updateProductList', function (data) {
        // console.log($('.facet-slider').hasClass('ui-slider'));
        //if (!$('.facet-slider').hasClass('ui-slider')) {

        loadedSlider();
        //}
    });

    // console.log('facet updateFacets',$('body').data('slider') );


});
