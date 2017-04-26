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