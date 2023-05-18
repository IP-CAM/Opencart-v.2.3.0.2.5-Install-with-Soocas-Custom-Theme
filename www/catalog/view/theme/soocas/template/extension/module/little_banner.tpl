<section class="presentation">
  <? if ($image && $image_small) { ?>
    <picture>
      <source media="(max-width: 700px)" srcset="<?= $image_small; ?>">
      <source media="(min-width: 701px)" srcset="<?= $image; ?>">
      <img class="presentation__img" src="<?= $image; ?>" alt="Background, toothbrush">
    </picture>
  <? } ?>
  <div class="container presentation__container">
    <? if ($module_title) { ?>
      <h2 class="title-h2 presentation__title">
        <?= $module_title; ?>
      </h2>
    <? } ?>
    <? if ($module_text) { ?>
      <p class="presentation__description">
        <?= $module_text; ?>
      </p>
    <? } ?>
    <? if ($module_link && $module_text) { ?>
      <a href="<?= $module_link; ?>" class="btn btn_red presentation__btn" target="_blank">
        <?= $module_button_text; ?>
      </a>
    <? } ?>
  </div>
</section>