<?= $header; ?>
<?= $content_top; ?>


<section class="result">

  <div class="search">
    <div class="container search__container">
      <h2 class="search__title">Результаты по поиску “<span class="search__result"><?= $search_result; ?></span>”</h2>
      <form class="search__item" id="page-search-form">
        <input type="search" placeholder="Что вы хотите найти?" class="search__input" name="search" value="<?= $search_result; ?>">
        <button style="opacity: 0; visibility: hidden; position: absolute;">Поиск</button>
      </form>
    </div>
  </div>

  <div class="container result__container">
    <? if ($products) { ?>
      <ul class="product__list product__list_big-gap">
        <? foreach ($products as $product) { ?>
          <li class="product__item">
            <a href="<?= $product['href']; ?>" class="product__link">
              <div class="product__img-wrap">
                <img src="<?= $product['thumb']; ?>" class="product__img" alt="<?= $product['name']; ?>" width="273" height="320">
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
    <? } else { ?>
      <p>Ничего не найдено</p>
    <? } ?>

    <?= $pagination; ?>
  </div>

</section>


<?= $content_bottom; ?>
<?= $footer; ?>