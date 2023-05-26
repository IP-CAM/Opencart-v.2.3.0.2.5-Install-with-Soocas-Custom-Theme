</main>
<footer class="footer">
  <div class="container footer__container">

    <div class="footer__content">

      <div class="footer__left">
        <div class="footer__logo">
          <a href="<? echo $home; ?>" class="logo">
            <img class="logo__img" src="<? echo $logo; ?>" alt="Soocas logo" width="137" height="30">
          </a>
          <span class="country country_dark">Россия</span>
        </div>
        <?
        if ($categories) {
          $menu_arrays = array_chunk($categories, ceil(count($categories) / 2));
        ?>
          <nav class="footer-nav">
            <? foreach ($menu_arrays as $menu) { ?>
              <ul class="footer-nav__list">
                <? foreach ($menu as $category) { ?>
                  <li class="footer-nav__item">
                    <a href="<?= $category['href']; ?>" class="footer-nav__link">
                      <?= $category['name']; ?>
                    </a>
                  </li>
                <? } ?>
              </ul>
            <? } ?>
          </nav>
        <? } ?>
      </div>

      <div class="footer__right">
        <div class="footer__contacts">
          <span class="footer__address">
            <?= $address; ?>
          </span>
          <a class="footer__tel-link" href="tel:<?= str_replace([' ', '(', ')', '-'], '', $telephone); ?>">
            <?= $telephone; ?>
          </a>
        </div>
        <div class="footer__links">
          <? if ($link_facebook) { ?>
            <a class="footer__link" href="<?= $link_facebook; ?>" aria-label="Soocas в facebook" target="_blank">
              <svg class="footer__icon" viewBox="0 0 20 20">
                <path d="M11.5487 20V10.8777H14.6094L15.0686 7.32156H11.5487V5.05147C11.5487 4.0222 11.8333 3.32076 13.311 3.32076L15.1925 3.31999V0.13923C14.8671 0.0969453 13.7502 0 12.4502 0C9.73561 0 7.87715 1.65697 7.87715 4.69927V7.32156H4.80713V10.8777H7.87715V20H11.5487Z" />
              </svg>
            </a>
          <? } ?>
          <? if ($link_youtube) { ?>
            <a class="footer__link" href="<?= $link_youtube; ?>" aria-label="Soocas в youtube" target="_blank">
              <svg class="footer__icon" viewBox="0 0 20 15">
                <path d="M19.5835 2.19783C19.353 1.33227 18.6763 0.652068 17.8153 0.420369C16.2545 0 10 0 10 0C10 0 3.74547 0 2.18637 0.420369C1.32532 0.652068 0.648666 1.33227 0.418176 2.19783C0 3.76511 0 7.03704 0 7.03704C0 7.03704 0 10.309 0.418176 11.8762C0.648666 12.7418 1.32532 13.422 2.18637 13.6537C3.74547 14.0741 10 14.0741 10 14.0741C10 14.0741 16.2545 14.0741 17.8136 13.6537C18.6747 13.422 19.3513 12.7418 19.5818 11.8762C20 10.309 20 7.03704 20 7.03704C20 7.03704 20 3.76511 19.5835 2.19783Z" />
                <path d="M7.99951 10.0523V4.02148L13.1971 7.03689L7.99951 10.0523Z" fill="white" />
              </svg>
            </a>
          <? } ?>
          <? if ($link_instagram) { ?>
            <a class="footer__link" href="<?= $link_instagram; ?>" aria-label="Soocas в instagram" target="_blank">
              <svg class="footer__icon" viewBox="0 0 20 20">
                <path d="M10.0008 0C7.285 0 6.94417 0.0118752 5.8775 0.0604169C4.81292 0.109167 4.08625 0.277708 3.45042 0.525C2.79271 0.780417 2.23479 1.12208 1.67896 1.67813C1.12271 2.23396 0.781041 2.79187 0.524791 3.44937C0.276875 4.08542 0.108125 4.81229 0.0602082 5.87646C0.0124999 6.94312 0 7.28417 0 10C0 12.7158 0.0120835 13.0556 0.0604168 14.1223C0.109375 15.1869 0.277917 15.9135 0.525 16.5494C0.780625 17.2071 1.12229 17.765 1.67833 18.3208C2.23396 18.8771 2.79187 19.2196 3.44917 19.475C4.08542 19.7223 4.81229 19.8908 5.87667 19.9396C6.94333 19.9881 7.28396 20 9.99958 20C12.7156 20 13.0554 19.9881 14.1221 19.9396C15.1867 19.8908 15.9142 19.7223 16.5504 19.475C17.2079 19.2196 17.765 18.8771 18.3206 18.3208C18.8769 17.765 19.2185 17.2071 19.4748 16.5496C19.7206 15.9135 19.8894 15.1867 19.9394 14.1225C19.9873 13.0558 19.9998 12.7158 19.9998 10C19.9998 7.28417 19.9873 6.94333 19.9394 5.87667C19.8894 4.81208 19.7206 4.08542 19.4748 3.44958C19.2185 2.79187 18.8769 2.23396 18.3206 1.67813C17.7644 1.12188 17.2081 0.780208 16.5498 0.525C15.9123 0.277708 15.1852 0.109167 14.1206 0.0604169C13.054 0.0118752 12.7144 0 9.99771 0H10.0008ZM9.10375 1.80208C9.37 1.80167 9.66708 1.80208 10.0008 1.80208C12.6708 1.80208 12.9873 1.81167 14.0417 1.85958C15.0167 1.90417 15.5458 2.06708 15.8983 2.20396C16.365 2.38521 16.6977 2.60187 17.0475 2.95187C17.3975 3.30187 17.6142 3.63521 17.7958 4.10187C17.9327 4.45396 18.0958 4.98312 18.1402 5.95812C18.1881 7.01229 18.1985 7.32896 18.1985 9.99771C18.1985 12.6665 18.1881 12.9831 18.1402 14.0373C18.0956 15.0123 17.9327 15.5415 17.7958 15.8935C17.6146 16.3602 17.3975 16.6925 17.0475 17.0423C16.6975 17.3923 16.3652 17.609 15.8983 17.7902C15.5462 17.9277 15.0167 18.0902 14.0417 18.1348C12.9875 18.1827 12.6708 18.1931 10.0008 18.1931C7.33062 18.1931 7.01417 18.1827 5.96 18.1348C4.985 18.0898 4.45583 17.9269 4.10312 17.79C3.63646 17.6087 3.30312 17.3921 2.95312 17.0421C2.60312 16.6921 2.38646 16.3596 2.20479 15.8927C2.06792 15.5406 1.90479 15.0115 1.86042 14.0365C1.8125 12.9823 1.80292 12.6656 1.80292 9.99521C1.80292 7.32479 1.8125 7.00979 1.86042 5.95563C1.905 4.98063 2.06792 4.45146 2.20479 4.09896C2.38604 3.63229 2.60312 3.29896 2.95312 2.94896C3.30312 2.59896 3.63646 2.38229 4.10312 2.20062C4.45562 2.06312 4.985 1.90063 5.96 1.85583C6.8825 1.81417 7.24 1.80167 9.10375 1.79958V1.80208ZM15.3387 3.4625C14.6762 3.4625 14.1387 3.99937 14.1387 4.66208C14.1387 5.32458 14.6762 5.86208 15.3387 5.86208C16.0012 5.86208 16.5387 5.32458 16.5387 4.66208C16.5387 3.99958 16.0012 3.4625 15.3387 3.4625ZM10.0008 4.86458C7.16479 4.86458 4.86542 7.16396 4.86542 10C4.86542 12.836 7.16479 15.1344 10.0008 15.1344C12.8369 15.1344 15.1354 12.836 15.1354 10C15.1354 7.16396 12.8369 4.86458 10.0008 4.86458ZM10.0008 6.66667C11.8417 6.66667 13.3342 8.15896 13.3342 10C13.3342 11.8408 11.8417 13.3333 10.0008 13.3333C8.15979 13.3333 6.6675 11.8408 6.6675 10C6.6675 8.15896 8.15979 6.66667 10.0008 6.66667Z" />
              </svg>
            </a>
          <? } ?>
        </div>
      </div>

    </div>

    <p class="footer__copyright">
      <?= $text_copyright; ?>
    </p>

  </div>
</footer>


<div class="modal">
  <button class="modal__close">
    <img src="./images/dist/cart/close.svg" alt="Icon close" width="20" height="20" aria-label="Закрыть">
  </button>
  <div class="cart cart_big" id="cart-modal">
    <div class="cart__top">
      <h3 class="cart__title-3">Корзина</h3>
      <ul class="cart__list">
        <li class="cart__item">
          <a class="cart__content" href="product.html">
            <div class="cart__img-wrap">
              <img class="cart__img" src="./images/dist/cart/device-1.png" alt="Device SOOCAS">
            </div>
            <div class="cart__info">
              <div class="cart__name">Беспроводной ирригатор Soocas W3 Pro</div>
              <div class="cart__price">
                <span class="cart__new">11 900 ₽</span>
                <span class="cart__normal">12 900 ₽</span>
              </div>
            </div>
          </a>
          <div class="cart__amount">
            <button class="cart__plus" type="button" aria-label="Плюс 1">+</button>
            <input class="cart__input" type="number" value="2" min="1" max="99" readonly>
            <button class="cart__minus" type="button" aria-label="Минус 1">–</button>
          </div>
          <button type="button" class="cart__delete" aria-label="Удалить товар">
            <svg viewBox="0 0 16 16" class="cart__icon">
              <path d="M13.25 2H10.5V1.5C10.5 0.671562 9.82844 0 9 0H7C6.17156 0 5.5 0.671562 5.5 1.5V2H2.75C2.05966 2 1.5 2.55966 1.5 3.25V4.25C1.5 4.52616 1.72384 4.75 2 4.75H14C14.2762 4.75 14.5 4.52616 14.5 4.25V3.25C14.5 2.55966 13.9403 2 13.25 2ZM6.5 1.5C6.5 1.22438 6.72437 1 7 1H9C9.27563 1 9.5 1.22438 9.5 1.5V2H6.5V1.5Z" />
              <path d="M2.44921 5.75C2.35999 5.75 2.2889 5.82456 2.29315 5.91369L2.70565 14.5712C2.74377 15.3725 3.4019 16 4.20377 16H11.7969C12.5988 16 13.2569 15.3725 13.295 14.5712L13.7075 5.91369C13.7118 5.82456 13.6407 5.75 13.5515 5.75H2.44921ZM10.0003 7C10.0003 6.72375 10.2241 6.5 10.5003 6.5C10.7766 6.5 11.0003 6.72375 11.0003 7V13.5C11.0003 13.7762 10.7766 14 10.5003 14C10.2241 14 10.0003 13.7762 10.0003 13.5V7ZM7.50034 7C7.50034 6.72375 7.72409 6.5 8.00034 6.5C8.27659 6.5 8.50034 6.72375 8.50034 7V13.5C8.50034 13.7762 8.27659 14 8.00034 14C7.72409 14 7.50034 13.7762 7.50034 13.5V7ZM5.00034 7C5.00034 6.72375 5.22409 6.5 5.50034 6.5C5.77659 6.5 6.00034 6.72375 6.00034 7V13.5C6.00034 13.7762 5.77659 14 5.50034 14C5.22409 14 5.00034 13.7762 5.00034 13.5V7Z" />
            </svg>
          </button>
        </li>
        <li class="cart__item">
          <a class="cart__content" href="product.html">
            <div class="cart__img-wrap">
              <img class="cart__img" src="./images/dist/cart/device-2.png" alt="Device SOOCAS">
            </div>
            <div class="cart__info">
              <div class="cart__name">Электрическая зубная щетка Soocas X3U</div>
              <div class="cart__price">
                <span class="cart__new cart__new_active">8900 ₽</span>
                <span class="cart__normal cart__normal_active">9900 ₽</span>
              </div>
            </div>
          </a>
          <div class="cart__amount">
            <button class="cart__plus" type="button" aria-label="Плюс 1">+</button>
            <input class="cart__input" type="number" value="1" min="1" max="99" readonly>
            <button class="cart__minus" type="button" aria-label="Минус 1">–</button>
          </div>
          <button class="cart__delete" aria-label="Удалить товар">
            <svg viewBox="0 0 16 16" class="cart__icon">
              <path d="M13.25 2H10.5V1.5C10.5 0.671562 9.82844 0 9 0H7C6.17156 0 5.5 0.671562 5.5 1.5V2H2.75C2.05966 2 1.5 2.55966 1.5 3.25V4.25C1.5 4.52616 1.72384 4.75 2 4.75H14C14.2762 4.75 14.5 4.52616 14.5 4.25V3.25C14.5 2.55966 13.9403 2 13.25 2ZM6.5 1.5C6.5 1.22438 6.72437 1 7 1H9C9.27563 1 9.5 1.22438 9.5 1.5V2H6.5V1.5Z" />
              <path d="M2.44921 5.75C2.35999 5.75 2.2889 5.82456 2.29315 5.91369L2.70565 14.5712C2.74377 15.3725 3.4019 16 4.20377 16H11.7969C12.5988 16 13.2569 15.3725 13.295 14.5712L13.7075 5.91369C13.7118 5.82456 13.6407 5.75 13.5515 5.75H2.44921ZM10.0003 7C10.0003 6.72375 10.2241 6.5 10.5003 6.5C10.7766 6.5 11.0003 6.72375 11.0003 7V13.5C11.0003 13.7762 10.7766 14 10.5003 14C10.2241 14 10.0003 13.7762 10.0003 13.5V7ZM7.50034 7C7.50034 6.72375 7.72409 6.5 8.00034 6.5C8.27659 6.5 8.50034 6.72375 8.50034 7V13.5C8.50034 13.7762 8.27659 14 8.00034 14C7.72409 14 7.50034 13.7762 7.50034 13.5V7ZM5.00034 7C5.00034 6.72375 5.22409 6.5 5.50034 6.5C5.77659 6.5 6.00034 6.72375 6.00034 7V13.5C6.00034 13.7762 5.77659 14 5.50034 14C5.22409 14 5.00034 13.7762 5.00034 13.5V7Z" />
            </svg>
          </button>
        </li>
      </ul>
    </div>
    <div class="cart__bottom">
      <ul class="cart__results">
        <li class="cart__result">
          <span class="cart__text">Полная цена:</span>
          <span class="cart__sum">21 800 ₽</span>
        </li>
        <li class="cart__result">
          <span class="cart__text">Скидка за комплект:</span>
          <span class="cart__sum">- 2 900 ₽</span>
        </li>
        <li class="cart__result">
          <span class="cart__text cart__text_weight">Итого:</span>
          <span class="cart__sum cart__sum_big">19 900 ₽</span>
        </li>
      </ul>

      <div class="cart__buttons">
        <button class="btn btn_white cart__continue">Продолжить покупки</button>
        <a href="order.html" class="btn btn_black cart__order">Оформить заказ</a>
      </div>
    </div>
  </div>
</div>
<?= $search; ?>


<div class="modal">

  <button class="modal__close">
    <img src="catalog/view/theme/soocas/images/dist/cart/close.svg" alt="Icon close" width="20" height="20" aria-label="Закрыть">
  </button>

  <div class="feedback" id="feedback-modal">
    <h3 class="feedback__title-3">Написать отзыв</h3>
    <div class="form feedback__form">
      <form class="form__body form__body_small form-id" id="review-form">
        <h4 class="form__title-4">Электрическая зубная щетка Soocas X3 Pro</h4>

        <div class="form__container">
          <div class="form__fields form__fields_small">
            <div class="form__item">
              <label for="forName3" class="form__label">Имя *</label>
              <input type="text" id="forName3" class="form__input" name="name" required>
            </div>

            <div class="form__item">
              <label for="forEmail3" class="form__label">Email *</label>
              <input type="email" id="forEmail3" class="form__input" name="email" required>
            </div>

            <div class="form__item">
              <label for="forMessage3" class="form__label form__label_top">Текст отзыва</label>
              <textarea id="forMessage3" class="form__input feedback__input" name="text"></textarea>
            </div>
          </div>

          <div class="form__right">
            <div class="form__area">
              <label for="forfile" class="form__label-2">
                Добавить фото
                <input type="file" id="forfile" class="form__file" name="images[]" accept="image/jpeg, image/jpg, image/png" size="1048576">
              </label>
              <span class="form__text">В формате .jpg или .png размером до 1 мб.</span>
              <div id="output" class="form__preview"></div>
            </div>
            <div class="form__rating rating">
              <span class="rating__text">Рейтинг</span>
              <div class="rating__body">
                <div class="rating__inputs">
                  <input type="radio" class="rating__input" name="rating" value="0" disabled checked>

                  <label for="rating__1" class="rating__label">
                    <svg class="rating__icon" viewBox="0 0 20 19">
                      <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                    </svg>
                  </label>
                  <input type="radio" id="rating__1" class="rating__input" name="rating" value="1">

                  <label for="rating__2" class="rating__label">
                    <svg class="rating__icon" viewBox="0 0 20 19">
                      <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                    </svg>
                  </label>
                  <input type="radio" id="rating__2" class="rating__input" name="rating" value="2">

                  <label for="rating__3" class="rating__label">
                    <svg class="rating__icon" viewBox="0 0 20 19">
                      <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                    </svg>
                  </label>
                  <input type="radio" id="rating__3" class="rating__input" name="rating" value="3">

                  <label for="rating__4" class="rating__label">
                    <svg class="rating__icon" viewBox="0 0 20 19">
                      <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                    </svg>
                  </label>
                  <input type="radio" id="rating__4" class="rating__input" name="rating" value="4">

                  <label for="rating__5" class="rating__label">
                    <svg class="rating__icon" viewBox="0 0 20 19">
                      <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                    </svg>
                  </label>
                  <input type="radio" id="rating__5" class="rating__input" name="rating" value="5">
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="form__wrap feedback__wrap">
          <button type="submit" class="btn btn_black feedback__button">Отправить</button>
          <span class="form__politics feedback__politics">Нажимая кнопку отправить, я даю согласие на
            обработку своих данных в соответствии с текущим законодательством</span>
        </div>
      </form>
    </div>
  </div>

</div>

<div class="modal">

  <button class="modal__close">
    <img src="catalog/view/theme/soocas/images/dist/cart/close.svg" alt="Icon close" width="20" height="20" aria-label="Закрыть">
  </button>

  <div class="successful-3" id="successful-modal">

    <div class="successful-3__content">
      <h3 class="successful-3__title-3">Спасибо, ваш отзыв скоро будет опубликован</h3>
      <p class="successful-3__text">Мы отправим вам уведомление на почту после публикации отзыва,
        благодарим за выбор продукции Soocas!</p>
    </div>
    <div class="successful-3__wrap">
      <button class="btn btn_black successful-3__button">Готово</button>
    </div>

  </div>

</div>

<div class="modal">
  <button class="modal__close">
    <img src="catalog/view/theme/soocas/images/dist/cart/close.svg" alt="Icon close" width="20" height="20" aria-label="Закрыть">
  </button>
  <div class="image" id="img-modal">
    <img class="image__photo" src="./">
  </div>
</div>
</div>

<script src="catalog/view/theme/soocas/js/swiper-bundle.min.js"></script>
<script src="catalog/view/theme/soocas/js/app.js"></script>
<script src="catalog/view/javascript/search-common.js"></script>
<script src="catalog/view/javascript/send-form-contact.js"></script>

</body>

</html>