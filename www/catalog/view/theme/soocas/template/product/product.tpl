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

      <div class="device__info">
        <h1 class="title-h3 device__title">
          <?= $heading_title; ?>
        </h1>

        <div class="device__rating rating">
          <div class="rating__result">
            <svg class="rating__star rating__star_active" viewBox="0 0 20 19">
              <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
            </svg>
            <svg class="rating__star rating__star_active" viewBox="0 0 20 19">
              <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
            </svg>
            <svg class="rating__star rating__star_active" viewBox="0 0 20 19">
              <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
            </svg>
            <svg class="rating__star rating__star_active" viewBox="0 0 20 19">
              <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
            </svg>
            <svg class="rating__star" viewBox="0 0 20 19">
              <path d="M10 0L12.645 6.35942L19.5106 6.90983L14.2798 11.3906L15.8779 18.0902L10 14.5L4.12215 18.0902L5.72025 11.3906L0.489435 6.90983L7.35497 6.35942L10 0Z" />
            </svg>
          </div>
          <span class="device__vendor-code">Артикул: <?= $model; ?></span>
        </div>

        <div class="device__colors">
          <input type="checkbox" checked name="color" value="pink" class="device__input device__input_pink">
          <input type="checkbox" name="color" value="blue" class="device__input device__input_blue">
        </div>

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
              <button class="btn btn_black device__button">Добавить в корзину</button>
            </div>
          </div>

          <?= $column_left; ?>
        </div>

      </div>
    </div>

  </div>
</section>

<?= $footer; ?>