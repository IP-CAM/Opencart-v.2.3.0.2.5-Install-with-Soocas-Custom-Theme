document.addEventListener('DOMContentLoaded', () => {

	function stickyHeader() {
		const header = document.querySelector('.header');
		let scrollPrev = 0;
			
		window.addEventListener('scroll', () => {
			let scrolled = window.pageYOffset;

			if (scrolled > 100 && scrolled > scrollPrev) {
				header.classList.add('header_out');
			} else {
				header.classList.remove('header_out');
			}

			scrollPrev = scrolled;
		})
	}

	stickyHeader();

	const body = document.querySelector('.page');
	const cover = document.querySelector('.page__cover');
	const modalList = document.querySelectorAll('.modal');
	const btnsClose = document.querySelectorAll('.modal__close');

	function toggleBurger() {
		const nav = document.querySelector('.nav');
		const navLinks = document.querySelectorAll('.nav__link');
		const burger = document.querySelector('.burger');
		
		const toggleClasses = () => {
			burger.classList.toggle('burger_open');
			nav.classList.toggle('nav_open');
			cover.classList.toggle('page__cover_open-menu');
			body.classList.toggle('page_active-burger');
		}

		burger.addEventListener('click', toggleClasses);

		cover.addEventListener('click', () => {
			if (document.querySelector('.page_active-burger')) toggleClasses();
		})

		navLinks.forEach(link => link.addEventListener('click', () => {
			const menuActive = body.classList.contains('page_active-burger');
			const firstIndex = link.getAttribute('href').indexOf('#') === 0;

			if (menuActive & firstIndex) toggleClasses();				
		}))
	}

	toggleBurger();

	function toggleCart() {
		const btnsOpen = document.querySelectorAll('.header__btn_cart');
		const btnContinue = document.querySelector('.cart__continue');
		const btnOrder = document.querySelector('.cart__order');
		const cart = document.querySelector('#cart-modal');
		const listProducts = document.querySelectorAll('.cart__content');

		const toggleClasses = () => {
			modalList[0].classList.toggle('modal_open-cart');
			cart.classList.toggle('cart_big_open');
			cover.classList.toggle('page__cover_open-cart');
			body.classList.toggle('page_active-cart');
		}

		btnsOpen.forEach(btn => btn.addEventListener('click', toggleClasses));

		btnsClose[0].addEventListener('click', () => {
			if (document.querySelector('.page_active-cart')) toggleClasses();
		})

		btnContinue.addEventListener('click', toggleClasses);
		btnOrder.addEventListener('click', toggleClasses);

		cover.addEventListener('click', () => {
			if (document.querySelector('.page_active-cart')) toggleClasses();
		})

		listProducts.forEach(product => product.addEventListener('click', toggleClasses));
	}

	toggleCart();

	function toggleSearch() {
		const searchPanel = document.querySelector('.window');
		const links = document.querySelectorAll('.window__item');
		const searchBtns = document.querySelectorAll('.header__btn_search');
		const closeBtn = document.querySelector('.window__close');
		const btn = document.querySelector('.window__button');

		const toggleClasses = () => {
			searchPanel.classList.toggle('window_open');
			cover.classList.toggle('page__cover_open-search');
			body.classList.toggle('page_active-search');
		}

		if (window.location.toString().indexOf('search') < 0) {
			searchBtns.forEach(btn => btn.addEventListener('click', toggleClasses));
			closeBtn.addEventListener('click', toggleClasses);
			btn.addEventListener('click', toggleClasses);
			cover.addEventListener('click', () => {
				if (document.querySelector('.page_active-search')) toggleClasses();
			})
			links.forEach(link => link.addEventListener('click', toggleClasses));
		} else {
			return;
		}
	}

	toggleSearch();

	function toggleForm() {
		const btnOpen = document.querySelector('.feedbacks__btn');
		const btnSend = document.querySelector('.feedback__button');
		const form = document.querySelector('#feedback-modal');

		const toggleClasses = () => {
			modalList[1].classList.toggle('modal_open-form');
			form.classList.toggle('feedback_open');
			cover.classList.toggle('page__cover_open-form');
			body.classList.toggle('page_active-form');
		}

		if(btnOpen) btnOpen.addEventListener('click', toggleClasses);

		btnsClose[1].addEventListener('click', () => {
			if (document.querySelector('.page_active-form')) toggleClasses();
		})

		if(btnSend) btnSend.addEventListener('click', toggleClasses);

		cover.addEventListener('click', () => {
			if (document.querySelector('.page_active-form')) toggleClasses();
		})
	}

	toggleForm();

	function toggleSuccessfulModal() {
		const btnOpen = document.querySelector('.successful__btn');
		const btnReady = document.querySelector('.successful-3__button');
		const successful = document.querySelector('#successful-modal');

		const toggleClasses = () => {
			modalList[2].classList.toggle('modal_open-successful');
			successful.classList.toggle('successful-3_open');
			cover.classList.toggle('page__cover_open-successful');
			body.classList.toggle('page_active-successful');
		}

		if(btnOpen) btnOpen.addEventListener('click', toggleClasses);

		btnsClose[2].addEventListener('click', () => {
			if (document.querySelector('.page_active-successful')) toggleClasses();
		})

		if(btnReady) btnReady.addEventListener('click', toggleClasses);

		cover.addEventListener('click', () => {
			if (document.querySelector('.page_active-successful')) toggleClasses();
		})
	}

	toggleSuccessfulModal();

	function checkboxColor() {
		const checkboxList = document.querySelectorAll('.device__input');
		
		checkboxList.forEach(checkbox => checkbox.addEventListener('click', () => {		
			checkboxList.forEach(checkbox => checkbox.checked = false);
			checkbox.checked = true;
		}))
	}

	checkboxColor();

	function countProducts() {
		const btnsPlus = document.querySelectorAll('.cart__plus');
		const btnsMinus = document.querySelectorAll('.cart__minus');

		btnsPlus.forEach(btn => btn.addEventListener("click", () => {
			let input = btn.closest('.cart__amount').querySelector('.cart__input');

			if(input.value >= 99) return;
			input.value = Number(input.value) + 1;
		}))

		btnsMinus.forEach(btn => btn.addEventListener("click", () => {
			let input = btn.closest('.cart__amount').querySelector('.cart__input');

			if(input.value <= 1) return;
			input.value = Number(input.value) - 1;
		}))
	}

	countProducts();

	function toggleImgModal() {
		const listImages1 = document.querySelectorAll('.feedbacks__img');
		const listImages2 = document.querySelectorAll('.img-big');
		const imgWrap = document.querySelector('#img-modal');
		const tegImg = document.querySelector('.image__photo');
		
		const toggleClasses = () => {
			modalList[3].classList.toggle('modal_open-image');
			imgWrap.classList.toggle('image_open');
			cover.classList.toggle('page__cover_open-image');
			body.classList.toggle('page_active-image');
		}

		const getSrc = (e) => {
			let src = e.target.src;
			tegImg.src = src;
			toggleClasses();
		} 

		listImages1.forEach(img => img.addEventListener("click", getSrc));
		listImages2.forEach(img => img.addEventListener("click", getSrc));

		btnsClose[3].addEventListener('click', () => {
			if (document.querySelector('.page_active-image')) toggleClasses();
		})

		cover.addEventListener('click', () => {
			if (document.querySelector('.page_active-image')) toggleClasses();
		})
	}

	toggleImgModal();
})