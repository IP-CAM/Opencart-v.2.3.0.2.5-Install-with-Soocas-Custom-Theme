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
  </div>

</div>

<?= $content_top; ?>
<?= $content_bottom; ?>
<?= $footer; ?>