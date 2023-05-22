import Swiper, { Navigation, Pagination, Autoplay ,Thumbs, Zoom } from 'swiper';

const mainSlider = new Swiper('.slider', {
	modules: [Navigation, Pagination, Autoplay],

	loop: true,
	grabCursor: false,

	breakpoints: {
		320: {
			allowTouchMove: true,
		},
		768: {
			allowTouchMove: false,
		}
	},

	autoplay: {
        delay: 3000,
        disableOnInteraction: false,
    },

	pagination: {
	  	el: '.swiper-pagination',
	},

	navigation: {
	  	nextEl: '.swiper-button-next',
	  	prevEl: '.swiper-button-prev',
	},
});

const galleryInstagram = new Swiper('.instagram__gallery', {
	slidesPerView: "auto",
	freeMode: true,
	spaceBetween: 20,

	breakpoints: {
		320: {
			grabCursor: true,
			allowTouchMove: true,
		},
		1340: {
			grabCursor: false,
			allowTouchMove: false,
		}
	},
});

const galleryThumbs = new Swiper(".device__thumbs", {
	slidesPerView: 4,
	freeMode: true,
	watchSlidesProgress: true,
	grabCursor: true,

	breakpoints: {
		0: {
			direction: "vertical",
			spaceBetween: 10,
		},
		769: {
			direction: "horizontal",
			spaceBetween: 22,
		}
	},
});
const galleryTop = new Swiper(".device__preview", {
	modules: [Thumbs, Zoom],

	grabCursor: true,
	zoom: {
		maxRatio: 2,
		minRatio: 1
	},
	thumbs: {
		swiper: galleryThumbs,
	},
});

const galleryFeedback = new Swiper('.feedbacks__gallery', {
	modules: [Navigation],

	slidesPerView: "auto",
	loop: false,
	spaceBetween: 18,
	grabCursor: true,
	allowTouchMove: true,

	navigation: {
		nextEl: '.feedbacks__button-next',
		prevEl: '.feedbacks__button-pev',
  	},
});