<?= $header; ?>
<section class="successful-2">
  <div class="container successful-2__container">

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

    <div class="successful-2__wrap">
      <div class="successful-2__thanks">
        <div class="successful-2__content">
          <h3 class="successful-2__title-3">Ваше сообщение отправлено</h3>
          <p class="successful-2__text">Мы получили ваше сообщение и ответим на него как можно скорее</p>
        </div>
        <a class="btn btn_black" href="/">На главную</a>
      </div>

      <div class="successful-2__img-wrap">
        <img class="successful-2__img" src="catalog/view/theme/soocas/images/dist/contacts/image.png" alt="<?= $heading_title; ?>" width="522" height="530">
      </div>
    </div>

  </div>
</section>


<?= $footer; ?>