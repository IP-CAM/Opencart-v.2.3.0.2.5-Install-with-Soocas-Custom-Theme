<div class="slider">
  <div class="swiper-wrapper slider__wrapper">

    <? foreach ($banners as $banner) { ?>
      <div class="swiper-slide slider__slide">
        <? if ($banner['image'] && $banner['image_mobile']) { ?>
          <picture class="slider__img">
            <source media="(max-width: 576px)" srcset="<?= $banner['image_mobile']; ?>">
            <img class="slider__img" src="<?= $banner['image']; ?>" alt="<?= $banner['title']; ?>">
          </picture>
        <? } ?>

        <div class="container slider__container">
          <?
          if ($banner['textarea']) {
            echo $banner['textarea'];
          }
          ?>
        </div>
      </div>
    <? } ?>

  </div>

  <!-- Buttons  -->
  <div class="slider__buttons">
    <div class="swiper-button-prev slider__button">
      <svg class="slider__arrow" viewBox="0 0 10 16">
        <path d="M0 8L7.93103 16L10 13.913L4.13793 8L10 2.08696L7.93103 0L0 8Z" />
      </svg>
    </div>
    <div class="swiper-button-next slider__button">
      <svg class="slider__arrow" viewBox="0 0 10 16">
        <path d="M10 8L2.06897 -6.93353e-07L1.21632e-06 2.08695L5.86207 8L1.82448e-07 13.913L2.06897 16L10 8Z" />
      </svg>
    </div>
  </div>

  <!-- Pagination  -->
  <div class="swiper-pagination"></div>

</div>