<?= $header; ?>


<section class="info">
  <div class="container info__container">

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

    <article class="info__description">
      <h2 class="info__title-h2">О нас</h2>
      <p class="info__text">
        <?= $description; ?>
      </p>
    </article>

  </div>
</section>


<?= $content_top; ?>
<?= $content_bottom; ?>
<?= $footer; ?>