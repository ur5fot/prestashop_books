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