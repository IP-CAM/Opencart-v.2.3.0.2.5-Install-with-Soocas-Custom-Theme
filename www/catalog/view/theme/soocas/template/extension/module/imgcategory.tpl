<section class="categories" id="catalog">
  <div class="container categories__container">
    <h1 class="title-h1 categories__title-h1">Товары Soocas</h1>
    <ul class="categories__list">
      <? foreach ($categories as $category) { ?>
        <li class="categories__item">
          <a href="<?= $category['href']; ?>" class="categories__link">
            <img src="<?= $category['thumb']; ?>" class="categories__img" alt="<?= $category['name']; ?> Soocas">
            <p class="categories__description">
              <?= $category['name']; ?>
            </p>
          </a>
        </li>
      <? } ?>
    </ul>
  </div>
</section>