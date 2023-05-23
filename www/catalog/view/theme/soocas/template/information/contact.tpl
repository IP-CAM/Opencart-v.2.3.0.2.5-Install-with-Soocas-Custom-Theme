<?= $header; ?>

<section class="contacts">
  <div class="container contacts__container">

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

    <div class="contacts__wrap">
      <h2 class="title-h2 contacts__title-h2">Контакты</h2>
      <p class="contacts__time">
        <? echo $open ?>
      </p>
    </div>

    <div class="contacts__data">

      <div class="contacts__left">
        <ul class="contacts__list">
          <li class="contacts__item">
            <span class="contacts__name">Телефон:</span>
            <a class="contacts__link contacts__link_big" href="tel:<?= str_replace([' ', '(', ')', '-'], '', $telephone); ?>">
              <?= $telephone; ?>
            </a>
          </li>

          <? if ($email_clients) { ?>
            <li class="contacts__item">
              <span class="contacts__name">Клиентам:</span>
              <a class="contacts__link" href="mailto:<?= $email_clients; ?>">
                <?= $email_clients; ?>
              </a>
            </li>
          <? } ?>

          <? if ($email_wholesale) { ?>
            <li class="contacts__item">
              <span class="contacts__name">Оптовым клиентам:</span>
              <a class="contacts__link" href="mailto:<?= $email_wholesale; ?>">
                <?= $email_wholesale; ?>
              </a>
            </li>
          <? } ?>

          <? if ($email_cooperation) { ?>
            <li class="contacts__item">
              <span class="contacts__name">По вопросам сотрудничества:</span>
              <a class="contacts__link" href="mailto:<?= $email_cooperation; ?>">
                <?= $email_cooperation; ?>
              </a>
            </li>
          <? } ?>

          <? if ($legal_address) { ?>
            <li class="contacts__item">
              <span class="contacts__name">Юридический адресс:</span>
              <span class="contacts__description">
                <?= $legal_address; ?>
              </span>
            </li>
          <? } ?>

        </ul>
      </div>

      <div class="contacts__right">
        <div class="form">
          <form method="POST" class="form-id" id="send-form">
            <h3 class="title-h3 form__title-3">Форма обратной связи</h3>
            <input type="hidden" name="email_subject" value="Обратная связь">

            <div class="form__item form__item_big-margin">
              <label for="forName" class="form__label">Имя</label>
              <input type="text" id="forName" class="form__input" name="Имя">
            </div>

            <div class="form__item form__item_big-margin">
              <label for="forEmail" class="form__label">Email *</label>
              <input type="email" id="forEmail" class="form__input" name="E-mail" required minlength="5">
            </div>

            <div class="form__item form__item_big-margin">
              <label for="forMessage" class="form__label form__label_top">Сообщение *</label>
              <textarea id="forMessage" class="form__input form__input_big" name="Комментарий" required></textarea>
            </div>

            <div class="form__wrap">
              <button type="submit" class="btn btn_black form__button">Отправить</button>
              <span class="form__politics">Нажимая кнопку отправить, я даю согласие на обработку своих данных в соответствии с текущим законодательством</span>
            </div>
          </form>
        </div>
      </div>

    </div>

    <? if ($link_telegram || $link_vk || $link_instagram) { ?>
      <div class="social-links">
        <span class="social-links__text">Наши социальные сети</span>
        <div class="social-links__list">
          <a class="social-links__link" href="<?= $link_telegram; ?>">
            <img class="social-links__icon" src="catalog/view/theme/soocas/images/dist/contacts/telegram.svg" alt="Telegram icon">
          </a>

          <a class="social-links__link" href="<?= $link_vk; ?>">
            <img class="social-links__icon" src="catalog/view/theme/soocas/images/dist/contacts/vk.svg" alt="Vk icon">
          </a>

          <a class="social-links__link" href="<?= $link_instagram; ?>">
            <img class="social-links__icon" src="catalog/view/theme/soocas/images/dist/contacts/instagram.svg" alt="Instagram icon">
          </a>
        </div>
      </div>
    <? } ?>

  </div>
</section>

<?= $content_bottom; ?>
<?= $footer; ?>