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