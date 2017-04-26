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
