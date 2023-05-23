<?= $header; ?>

<div class="container category__container">

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

  <div id="category-1">
    <h1 class="category__title-h2">
      <?= $heading_title; ?>
    </h1>


    <ul class="product__list product__list_big-gap">
      <? foreach ($products as $product) { ?>
        <li class="product__item">
          <a href="<?= $product['href']; ?>" class="product__link">
            <div class="product__img-wrap">
              <img src="<?= $product['thumb']; ?>" class="product__img" alt="<?= $product['name']; ?>" width="242" height="320">
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

    <?= $pagination ?>

  </div>

</div>


<?= $content_top; ?>
<?= $content_bottom; ?>
<?= $footer; ?>