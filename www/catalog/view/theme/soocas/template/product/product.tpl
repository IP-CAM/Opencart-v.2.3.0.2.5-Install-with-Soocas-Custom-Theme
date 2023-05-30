<?= $header; ?>

<section class="device">
  <div class="container device__container">
    <nav class="breadcrumb">
      <ul class="breadcrumb__list">
        <? foreach ($breadcrumbs as $id => $breadcrumb) { ?>
          <? if (!isset($breadcrumb['last'])) { ?>
            <li class="breadcrumb__item">
              <a class="breadcrumb__link breadcrumb__link_active" href="<?= $breadcrumb['href']; ?>">
                <?= $breadcrumb['text']; ?>
              </a>
            </li>
          <? } else { ?>
            <li class="breadcrumb__item">
              <span class="breadcrumb__link">
                <?= $breadcrumb['text']; ?>
              </span>
            </li>
          <? } ?>
        <? } ?>
      </ul>
    </nav>
    <div class="device__wrapper">
      <div class="device__view">
        <div class="swiper device__preview">
          <div class="swiper-wrapper">
            <div class="swiper-slide device__slide">
              <div class="swiper-zoom-container">
                <img class="device__img img-big" src="<?= $image; ?>" alt="<?= $heading_title; ?>" width="555" height="540" data-zoom-image="<?= $popup; ?>">
              </div>
            </div>
            <? if ($images) { ?>
              <? foreach ($images as $image) { ?>
                <div class="swiper-slide device__slide">
                  <div class="swiper-zoom-container">
                    <img class="device__img img-big" src="<?= $image['image']; ?>" alt="<?= $heading_title; ?>" width="555" height="540" data-zoom-image="<?= $image['popup']; ?>" loading="lazy">
                  </div>
                </div>
              <? } ?>
            <? } ?>
          </div>
        </div>
        <div thumbsSlider="" class="swiper device__thumbs">
          <div class="swiper-wrapper">
            <div class="swiper-slide device__slide">
              <img class="device__img" src="<?= $thumb; ?>" alt="<?= $heading_title; ?>" width="107" height="122">
            </div>
            <? if ($images) { ?>
              <? foreach ($images as $image) { ?>
                <div class="swiper-slide device__slide">
                  <img class="device__img" src="<?= $image['thumb']; ?>" alt="<?= $heading_title; ?>" width="107" height="122">
                </div>
              <? } ?>
            <? } ?>
          </div>
        </div>
      </div>
      <form class="device__info" id="add-to-cart">
        <h1 class="title-h3 device__title">
          <?= $heading_title; ?>
        </h1>
        <div class="device__rating rating">
          <div class="rating__result">
            <? for ($i = 1; $i <= 5; $i++) { ?>
              <? if ($rating < $i) { ?>
                <svg class="rating__star" viewBox="0 0 20 19">
                  <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                </svg>
              <? } else { ?>
                <svg class="rating__star rating__star_active" viewBox="0 0 20 19">
                  <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                </svg>
              <? } ?>
            <? } ?>
          </div>
          <span class="device__vendor-code">Артикул: <?= $model; ?></span>
        </div>
        <? if ($options) { ?>
          <? foreach ($options as $option) { ?>
            <div class="device__colors">
              <? foreach ($option['product_option_value'] as $id => $value) { ?>
                <input <? if ($id == 0) echo 'checked'; ?> class="device__input" hidden type="radio" name="option[<?= $option['product_option_id']; ?>]" value="<?= $value['product_option_value_id']; ?>" id="option_value_id-<?= $value['option_value_id']; ?>">

                <label class="device__label" for="option_value_id-<?= $value['option_value_id']; ?>">
                  <img src="<?= $value['image']; ?>" alt="<?= $value['name']; ?>" width="32" height="32">
                </label>
              <? } ?>
            </div>
          <? } ?>
        <? } ?>
        <? if ($description) { ?>
          <div class="device__description">
            <?= $description; ?>
          </div>
        <? } ?>
        <div class="device__area">
          <div class="device__price">
            <div class="device__left">
              <div class="device__price-wrap">
                <? if ($special) { ?>
                  <div class="device__new-price device__new-price_active">
                    <span class="device__name">Цена со скидкой:</span>
                    <span class="device__new-value">
                      <?= $special; ?>
                    </span>
                  </div>
                  <div class="device__old-price device__old-price_active">
                    <span class="device__old-name">Старая цена:</span>
                    <span class="device__old-value">
                      <?= $price; ?>
                    </span>
                  </div>
                <? } else { ?>
                  <div class="device__normal-price device__normal-price_active">
                    <span class="device__name">Цена:</span>
                    <span class="device__normal-value">
                      <?= $price; ?>
                    </span>
                  </div>
                <? } ?>
              </div>
              <input type="hidden" name="quantity" value="1">
              <input type="hidden" name="product_id" value="<?= $product_id; ?>">
              <? if ($in_cart) { ?>
                <a class="btn btn_black device__button" href="<?= $cart_link; ?>">
                  Добавлено в корзину
                </a>
              <? } else { ?>
                <button class="btn btn_black device__button" id="button-cart" type="sumbit">
                  Добавить в корзину
                </button>
              <? } ?>
            </div>
          </div>
          <?= $column_left; ?>
        </div>
      </form>
    </div>
  </div>
</section>

<? if ($products_combo) { ?>
  <section class="set">
    <div class="container set__container">
      <h2 class="title-h2 set__title-h2">Вместе дешевле</h2>
      <? foreach ($products_combo as $combo) { ?>
        <form class="add-combo">
          <ul class="set__list">
            <? foreach ($combo['items'] as $id => $product) { ?>
              <? if ($id <= 1) { ?>
                <li class="set__item">
                  <a href="<?= $product['href']; ?>" class="set__link">
                    <div class="set__img-wrap">
                      <img src="<?= $product['image']; ?>" class="set__img" alt="<?= $product['name']; ?>" width="200" height="236" loading="lazy">
                    </div>
                    <div class="set__description">
                      <p class="set__name">
                        <?= $product['name']; ?>
                      </p>
                      <span class="set__price">
                        <?= $product['price']; ?>
                      </span>
                    </div>
                  </a>
                </li>
              <? } ?>
            <? } ?>
            <li class="set__item">
              <div class="set__wrap">
                <div class="set__discount">
                  <span class="set__weight">Скидка <?= $combo['discount']; ?>%</span>
                  при покупке комплекта
                </div>
                <div class="set__old-price">
                  <span class="set__text">Цена:</span>
                  <span class="set__value"><?= $combo['previous_price']; ?></span>
                </div>
                <input type="hidden" name="combo_id" value="<?= $combo['combo_id'] ?>">
                <button class="btn btn_black set__button">Купить за <span class="set__new-price"><?= $combo['new_price']; ?></span></button>
              </div>
            </li>
          </ul>
        </form>
      <? } ?>
    </div>
  </section>
<? } ?>

<?= $content_top; ?>

<section class="review">
  <div class="container review__container">

    <h2 class="title-h2 review__title-h2">Обзор продукта</h2>

    <div class="review__block">

      <? foreach ($product_tabs as $id => $tab) { ?>
        <? if (($id + 1) % 2 == 0) { ?>
          <div class="block">
            <div class="block__wrapper wrapper-content wrapper-content_bottom" style="background: <?= $tab['color']; ?>;">
              <h3 class="title-h3"><?= $tab['title'] ?></h3>
              <? if ($tab['description']) { ?>
                <p class="text">
                  <?= $tab['description'] ?>
                </p>
              <? } ?>
              <? if ($tab['subtitle']) { ?>
                <span class="block__clarification">
                  <?= $tab['subtitle']; ?>
                </span>
              <? } ?>
            </div>
            <div class="block__wrapper block__wrapper_image">
              <img class="block__img" src="<?= $tab['image'] ?>" alt="<?= $tab['title'] ?>" width="585" height="585" loading="lazy">
            </div>
          </div>
        <? } else { ?>
          <div class="block">
            <div class="block__wrapper block__wrapper_image">
              <img class="block__img" src="<?= $tab['image'] ?>" alt="<?= $tab['title'] ?>" width="585" height="585" loading="lazy">
            </div>
            <div class="block__wrapper wrapper-content" style="background: <?= $tab['color']; ?>;">
              <h3 class="title-h3"><?= $tab['title'] ?></h3>
              <? if ($tab['description']) { ?>
                <p class="text">
                  <?= $tab['description']; ?>
                </p>
              <? } ?>
              <? if ($tab['subtitle']) { ?>
                <span class="block__clarification">
                  <?= $tab['subtitle']; ?>
                </span>
              <? } ?>
            </div>
          </div>
        <? } ?>
      <? } ?>
    </div>
  </div>
</section>

<div class="feedbacks">
  <div class="container feedbacks__container">
    <h2 class="title-h2 feedbacks__title-h2">Отзывы</h2>

    <div class="swiper feedbacks__gallery swiper-initialized swiper-horizontal swiper-backface-hidden">

      <div class="feedbacks__info">
        <div class="feedbacks__left">
          <h3 class="title-h3 feedbacks__title-h3">
            <?= $heading_title; ?>
          </h3>

          <div class="feedbacks__rating rating">
            <div class="rating__result rating__result_big">
              <? for ($i = 1; $i <= 5; $i++) { ?>
                <? if ($rating < $i) { ?>
                  <svg class="rating__star rating__star_big" viewBox="0 0 20 19">
                    <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                  </svg>
                <? } else { ?>
                  <svg class="rating__star rating__star_big  rating__star_active" viewBox="0 0 20 19">
                    <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                  </svg>
                <? } ?>
              <? } ?>
            </div>
            <span class="feedbacks__amount"><?= $rating; ?> на основе <?= $reviews; ?></span>
          </div>
        </div>

        <div class="feedbacks__right">
          <button class="btn btn_black feedbacks__btn">Написать отзыв</button>

          <div class="feedbacks__buttons">
            <div class="swiper-button-prev feedbacks__button feedbacks__button-pev">
              <svg class="feedbacks__arrow" viewBox="0 0 10 16">
                <path d="M0 8L7.93103 16L10 13.913L4.13793 8L10 2.08696L7.93103 0L0 8Z"></path>
              </svg>
            </div>
            <div class="swiper-button-next feedbacks__button feedbacks__button-next swiper-button-disabled">
              <svg class="feedbacks__arrow" viewBox="0 0 10 16">
                <path d="M10 8L2.06897 -6.93353e-07L1.21632e-06 2.08695L5.86207 8L1.82448e-07 13.913L2.06897 16L10 8Z"></path>
              </svg>
            </div>
          </div>
        </div>
      </div>

      <!-- slider -->
      <div class="swiper-wrapper" style="transform: translate3d(-3.936px, 0px, 0px); transition-duration: 0ms; cursor: grab;">

        <? foreach ($review_list as $review) { ?>
          <div class="swiper-slide feedbacks__slide swiper-slide-active" style="margin-right: 18px;">
            <div class="feedbacks__wrap">
              <div class="feedbacks__data">
                <div class="feedbacks__rating-small rating">
                  <span class="feedbacks__name">
                    <?= $review['author']; ?>
                  </span>
                  <div class="rating__result">

                    <? for ($i = 1; $i <= 5; $i++) { ?>
                      <? if ($review['rating'] < $i) { ?>
                        <svg class="rating__star rating__star_small" viewBox="0 0 20 19">
                          <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                        </svg>
                      <? } else { ?>
                        <svg class="rating__star rating__star_small rating__star_active" viewBox="0 0 20 19">
                          <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
                        </svg>
                      <? } ?>
                    <? } ?>
                  </div>
                </div>
                <time class="feedbacks__time" datetime="<?= $review['date_html']; ?>"><?= $review['date_added']; ?></time>
              </div>

              <p class="feedbacks__text">
                <?= $review['text']; ?>
              </p>

              <? if ($review['image']) { ?>
                <? foreach ($review['image'] as $image) { ?>
                  <div class="feedbacks__img-wrap">
                    <img class="feedbacks__img" src="<?= $image['thumb']; ?>" alt="User photo" width="237" height="157" loading="lazy" data-zoom-image="<?= $image['image']; ?>">
                  </div>
                <? } ?>
              <? } ?>
            </div>
          </div>
        <? } ?>

      </div>

    </div>
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', () => {
    if (document.getElementById('review-form')) {
      document.getElementById('review-form').addEventListener('submit', event => {
        event.preventDefault();
        const form = event.target;
        form.querySelector('button').disabled = true;
        const formData = new FormData(form);
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "index.php?route=product/product/write&product_id=<?= $product_id; ?>");
        xhr.send(formData);

        xhr.onloadend = function() {
          if (xhr.status == 200) {
            const response = JSON.parse(xhr.response);
            if (response['success']) {
              const modalList = document.querySelectorAll('.modal');
              modalList[1].classList.toggle('modal_open-form');
              document.querySelector('#feedback-modal').classList.toggle('feedback_open');
              document.querySelector('.page__cover').classList.toggle('page__cover_open-form');
              document.querySelector('.page').classList.toggle('page_active-form');

              modalList[2].classList.toggle('modal_open-successful');
              document.querySelector('#successful-modal').classList.toggle('successful-3_open');
              document.querySelector('.page__cover').classList.toggle('page__cover_open-successful');
              document.querySelector('.page').classList.toggle('page_active-successful');
              form.reset();
              document.getElementById('feedback-error').innerHTML = '';
            } else {
              document.getElementById('feedback-error').innerHTML = response['error'] ? response['error'] : "Форма не отправлена";
            }
            form.querySelector('button').disabled = false;
          } else {
            document.getElementById('feedback-error').innerHTML = "Ошибка " + this.status;
            form.querySelector('button').disabled = false;
          }
        };
      });
    }
  });
</script>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    if (document.getElementById('button-cart')) {
      document.querySelector('#add-to-cart').addEventListener('submit', event => {
        event.preventDefault();
        const form = event.target;
        form.querySelector('button').disabled = true;
        const formData = new FormData(form);
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "index.php?route=checkout/cart/add");
        xhr.send(formData);

        xhr.onloadend = function() {
          if (xhr.status == 200) {
            const response = JSON.parse(xhr.response);
            if (response['success']) {
              const headerCart = document.querySelector('#header-cart');
              headerCart.classList.add('header__cart-num_active');
              headerCart.innerHTML = response['count'];

              form.querySelector('#button-cart').remove();
              form.querySelector('.device__left').innerHTML += `
                <a class="btn btn_black device__button" href="<?= $cart_link; ?>">
                  Добавлено в корзину
                </a>
              `;

            } else {
              alert(response['error'] ? Object.entries(response['error']).join('\n') : "Форма не отправлена");
              form.querySelector('button').disabled = false;
            }
          } else {
            alert("Ошибка " + this.status);
            form.querySelector('button').disabled = false;
          }
        };
      })
    }
  });
</script>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    if (document.querySelector('.add-combo')) {
      document.querySelectorAll('.add-combo').forEach(combo => {
        combo.addEventListener('submit', event => {
          event.preventDefault();
          const form = event.target;
          form.querySelector('button').disabled = true;
          const formData = new FormData(form);
          const xhr = new XMLHttpRequest();
          xhr.open("POST", "index.php?route=checkout/cart/add_combo");
          xhr.send(formData);

          xhr.onloadend = function() {
            if (xhr.status == 200) {
              const response = JSON.parse(xhr.response);
              if (response['success']) {
                const headerCart = document.querySelector('#header-cart');
                headerCart.classList.add('header__cart-num_active');
                headerCart.innerHTML = response['count'];
                alert('Товары добавлены в корзину');
              } else {
                alert(response['error'] ? Object.entries(response['error']).join('\n') : "Форма не отправлена");
              }
              form.querySelector('button').disabled = false;
            } else {
              alert("Ошибка " + this.status);
              form.querySelector('button').disabled = false;
            }
          };
        });

      });
    }
  });
</script>

<?= $content_bottom; ?>
<?= $footer; ?>