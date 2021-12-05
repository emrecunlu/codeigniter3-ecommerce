function bodyScrollHidden() {
    document.body.style.overflow = 'hidden';
}
function bodyScrollVisible() {
    document.body.style.overflow = 'inherit';
}

const thumbs = document.querySelectorAll('.swiper-slide > img');
let images = [];
let closeNav = document.querySelector('.close'),
    navbar = document.getElementById('navbar'),
    toggler = document.querySelector('.header__toggler');

toggler.addEventListener('click', () => {
    if (navbar.classList.contains('active')) {
        navbar.classList.remove('active');
        bodyScrollVisible();
    }else {
        navbar.classList.add('active');
        bodyScrollHidden();
    }
});
closeNav.addEventListener('click', () => {
    if (navbar.classList.contains('active')) {
        navbar.classList.remove('active');
        bodyScrollVisible();
    }
});

thumbs.forEach((image, key) => {
    images[key] = {
        src: image.getAttribute('src'),
        alt: image.getAttribute('alt')
    }
});

const swiper = new Swiper('.swiper.thumbs-gallery', {
    direction: 'horizontal',
    autoplay: {
        delay: 3000,
    },
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
        disableOnInteraction: false,
        renderBullet: function (index, className) {
            return '<span class="' + className + '"><img src="' + images[index].src + '"></img></span>'
        },
    },
});

toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": false,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}