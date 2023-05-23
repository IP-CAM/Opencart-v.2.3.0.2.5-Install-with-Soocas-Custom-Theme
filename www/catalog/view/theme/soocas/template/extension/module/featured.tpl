<section class="leaders">
  <div class="container leaders__container">
    <h2 class="title-h2 leaders__title-h2">
      Лидеры продаж
    </h2>
    <ul class="product__list">
      <? foreach ($products as $product) { ?>
        <li class="product__item">
          <a href="<?= $product['href']; ?>" class="product__link">
            <div class="product__img-wrap">
              <img src="<?= $product['thumb']; ?>" class="product__img" alt="Изображение <?= $product['name']; ?>" width="275" height="320">
            </div>
            <div class="product__description">
              <p class="product__name">
                <?= $product['name']; ?>
              </p>
              <span class="product__price">
                <?
                  if (!$product['special']) {
                    echo $product['price'];
                  } else {
                    echo $product['special'];
                  }
                ?>
              </span>
            </div>
          </a>
        </li>
      <? } ?>
    </ul>
  </div>
</section>