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