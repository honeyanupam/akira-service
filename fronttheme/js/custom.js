/*$(document).ready(function () {
    $.backstretch([
        "img/bg-1.jpg",
        "img/bg-2.jpg",
        "img/bg-3.jpg"
    ], {
        fade: 1000,
        duration: 7000
    });
});*/


$(document).ready(function () {
    $(window).load(function () {
        $('.newsslider').flexslider({
            animation: "slide",
            direction: "vertical",
            controlNav: false,
            directionNav: false
        });
    });
});

$(document).ready(function () {
    $(window).load(function () {
        $('.flexslider').flexslider({
            animation: "slide",
            controlNav: false,
            directionNav: true
        });
    });
});

$(document).ready(function () {

    $("#post-carousel").owlCarousel({
        items: 3,
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
        navigation: true,
        pagination: false,
        navigationText: ["<i class='fa fa-angle-left'>", "<i class='fa fa-angle-right'>"],
        slideSpeed: 2000,
        autoPlay: true
    });

});

$(document).ready(function () {

    $("#post-video").owlCarousel({
        items: 4,
        itemsDesktopSmall: [979, 4],
        itemsTablet: [768, 3],
        itemsMobile: [479, 1],
        navigation: true,
        pagination: false,
        navigationText: ["<i class='fa fa-angle-left'>", "<i class='fa fa-angle-right'>"],
        slideSpeed: 2000,
        autoPlay: true
    });

});

$(document).ready(function () {

    $("#testimonials").owlCarousel({
        singleItem: true,
        items: 1,
        transitionStyle: "godown",
        navigation: false

    });

});

