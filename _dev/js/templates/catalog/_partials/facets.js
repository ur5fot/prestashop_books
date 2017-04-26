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