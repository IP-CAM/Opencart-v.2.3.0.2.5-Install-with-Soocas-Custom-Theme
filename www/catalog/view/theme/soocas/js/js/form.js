document.addEventListener('DOMContentLoaded', () => {
	function form() {
		const modalForm = document.querySelector('#feedback-modal');

		if (window.location.toString().indexOf('contacts') > 0 || window.location.toString().indexOf('order') > 0 || modalForm) {

			const form = document.querySelector('.form-id');
			const allInputs = form.querySelectorAll('.form__input');

			//смещение label вверх при фокусе ------------------------------------------------
			allInputs.forEach(input => input.onfocus = function() {
				const id = this.id;
				const label = form.querySelector(`[for=${id}]`);
		
				label.classList.add('form__label_active');
			});
		
			//смещение label обратно при переключении фокуса, если инпут пустой ----------------
			allInputs.forEach(input => input.addEventListener('focusout', function () {
				if (!this.value) {
					const id = this.id;
					const label = form.querySelector(`[for=${id}]`);
		
					label.classList.remove('form__label_active');
				} 
			}));

			//обработка input[type= file] ------------------------------------------------------
			const inputImage = document.querySelector('#forfile');
			const preview = document.querySelector('#output');
						
			inputImage.addEventListener('change', () => {
				uploadFile(inputImage.files[0]);
				preview.addEventListener('DOMSubtreeModified', deletePhoto);
			});

			function uploadFile (file) {
				//проверка типа
				if (!['image/jpeg', 'image/jpg', 'image/png'].includes(file.type)) {
					inputImage.value = '';
					return;
				}

				//проверка размера (до 1мб)
				if (file.size > 1024 * 1024) return;

				//полученние и вставка изображения
				let reader = new FileReader();
				reader.onload = function(e) {
					preview.innerHTML = `
					<div class="form__img-wrap">
						<img src="${e.target.result}" alt="photo" class="form__img">
					</div>
					<button type="button" class="form__delete">
						<svg viewBox="0 0 16 16" class="form__icon">
							<path d="M13.25 2H10.5V1.5C10.5 0.671562 9.82844 0 9 0H7C6.17156 0 5.5 0.671562 5.5 1.5V2H2.75C2.05966 2 1.5 2.55966 1.5 3.25V4.25C1.5 4.52616 1.72384 4.75 2 4.75H14C14.2762 4.75 14.5 4.52616 14.5 4.25V3.25C14.5 2.55966 13.9403 2 13.25 2ZM6.5 1.5C6.5 1.22438 6.72437 1 7 1H9C9.27563 1 9.5 1.22438 9.5 1.5V2H6.5V1.5Z"/>
							<path d="M2.44921 5.75C2.35999 5.75 2.2889 5.82456 2.29315 5.91369L2.70565 14.5712C2.74377 15.3725 3.4019 16 4.20377 16H11.7969C12.5988 16 13.2569 15.3725 13.295 14.5712L13.7075 5.91369C13.7118 5.82456 13.6407 5.75 13.5515 5.75H2.44921ZM10.0003 7C10.0003 6.72375 10.2241 6.5 10.5003 6.5C10.7766 6.5 11.0003 6.72375 11.0003 7V13.5C11.0003 13.7762 10.7766 14 10.5003 14C10.2241 14 10.0003 13.7762 10.0003 13.5V7ZM7.50034 7C7.50034 6.72375 7.72409 6.5 8.00034 6.5C8.27659 6.5 8.50034 6.72375 8.50034 7V13.5C8.50034 13.7762 8.27659 14 8.00034 14C7.72409 14 7.50034 13.7762 7.50034 13.5V7ZM5.00034 7C5.00034 6.72375 5.22409 6.5 5.50034 6.5C5.77659 6.5 6.00034 6.72375 6.00034 7V13.5C6.00034 13.7762 5.77659 14 5.50034 14C5.22409 14 5.00034 13.7762 5.00034 13.5V7Z"/>
						</svg>
					</button>
					`;
				}
				reader.readAsDataURL(file);
			}

			//удаление изображения
			function deletePhoto() {
				const btnDelete = document.querySelector('.form__delete');

				if(btnDelete) {
					btnDelete.addEventListener('click', () => {
						preview.innerHTML = '';
						inputImage.value = '';
					})
				}
			}
		}
	}

	form();
})