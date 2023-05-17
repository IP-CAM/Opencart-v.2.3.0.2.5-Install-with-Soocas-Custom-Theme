</main>
<footer class="footer">
  <div class="container footer__container">

    <div class="footer__content">

      <div class="footer__left">
        <div class="footer__logo">
          <a href="<? echo $home; ?>" class="logo">
            <img class="logo__img" src="<? echo $logo; ?>" alt="Soocas logo" width="137" height="30">
          </a>
          <span class="country country_dark">Россия</span>
        </div>
        <?
        if ($categories) {
          $menu_arrays = array_chunk($categories, ceil(count($categories) / 2));
        ?>
          <nav class="footer-nav">
            <? foreach ($menu_arrays as $menu) { ?>
              <ul class="footer-nav__list">
                <? foreach ($menu as $category) { ?>
                  <li class="footer-nav__item">
                    <a href="<?= $category['href']; ?>" class="footer-nav__link">
                      <?= $category['name']; ?>
                    </a>
                  </li>
                <? } ?>
              </ul>
            <? } ?>
          </nav>
        <? } ?>
      </div>

      <div class="footer__right">
        <div class="footer__contacts">
          <span class="footer__address">
            <?= $address; ?>
          </span>
          <a class="footer__tel-link" href="tel:<?= str_replace([' ', '(', ')', '-'], '', $telephone); ?>">
            <?= $telephone; ?>
          </a>
        </div>
        <div class="footer__links">
          <? if ($link_facebook) { ?>
            <a class="footer__link" href="<?= $link_facebook; ?>" aria-label="Soocas в facebook">
              <svg class="footer__icon" viewBox="0 0 20 20">
                <path d="M11.5487 20V10.8777H14.6094L15.0686 7.32156H11.5487V5.05147C11.5487 4.0222 11.8333 3.32076 13.311 3.32076L15.1925 3.31999V0.13923C14.8671 0.0969453 13.7502 0 12.4502 0C9.73561 0 7.87715 1.65697 7.87715 4.69927V7.32156H4.80713V10.8777H7.87715V20H11.5487Z" />
              </svg>
            </a>
          <? } ?>
          <? if ($link_youtube) { ?>
            <a class="footer__link" href="<?= $link_youtube; ?>" aria-label="Soocas в youtube">
              <svg class="footer__icon" viewBox="0 0 20 15">
                <path d="M19.5835 2.19783C19.353 1.33227 18.6763 0.652068 17.8153 0.420369C16.2545 0 10 0 10 0C10 0 3.74547 0 2.18637 0.420369C1.32532 0.652068 0.648666 1.33227 0.418176 2.19783C0 3.76511 0 7.03704 0 7.03704C0 7.03704 0 10.309 0.418176 11.8762C0.648666 12.7418 1.32532 13.422 2.18637 13.6537C3.74547 14.0741 10 14.0741 10 14.0741C10 14.0741 16.2545 14.0741 17.8136 13.6537C18.6747 13.422 19.3513 12.7418 19.5818 11.8762C20 10.309 20 7.03704 20 7.03704C20 7.03704 20 3.76511 19.5835 2.19783Z" />
                <path d="M7.99951 10.0523V4.02148L13.1971 7.03689L7.99951 10.0523Z" fill="white" />
              </svg>
            </a>
          <? } ?>
          <? if ($link_instagram) { ?>
            <a class="footer__link" href="<?= $link_instagram; ?>" aria-label="Soocas в instagram">
              <svg class="footer__icon" viewBox="0 0 20 20">
                <path d="M10.0008 0C7.285 0 6.94417 0.0118752 5.8775 0.0604169C4.81292 0.109167 4.08625 0.277708 3.45042 0.525C2.79271 0.780417 2.23479 1.12208 1.67896 1.67813C1.12271 2.23396 0.781041 2.79187 0.524791 3.44937C0.276875 4.08542 0.108125 4.81229 0.0602082 5.87646C0.0124999 6.94312 0 7.28417 0 10C0 12.7158 0.0120835 13.0556 0.0604168 14.1223C0.109375 15.1869 0.277917 15.9135 0.525 16.5494C0.780625 17.2071 1.12229 17.765 1.67833 18.3208C2.23396 18.8771 2.79187 19.2196 3.44917 19.475C4.08542 19.7223 4.81229 19.8908 5.87667 19.9396C6.94333 19.9881 7.28396 20 9.99958 20C12.7156 20 13.0554 19.9881 14.1221 19.9396C15.1867 19.8908 15.9142 19.7223 16.5504 19.475C17.2079 19.2196 17.765 18.8771 18.3206 18.3208C18.8769 17.765 19.2185 17.2071 19.4748 16.5496C19.7206 15.9135 19.8894 15.1867 19.9394 14.1225C19.9873 13.0558 19.9998 12.7158 19.9998 10C19.9998 7.28417 19.9873 6.94333 19.9394 5.87667C19.8894 4.81208 19.7206 4.08542 19.4748 3.44958C19.2185 2.79187 18.8769 2.23396 18.3206 1.67813C17.7644 1.12188 17.2081 0.780208 16.5498 0.525C15.9123 0.277708 15.1852 0.109167 14.1206 0.0604169C13.054 0.0118752 12.7144 0 9.99771 0H10.0008ZM9.10375 1.80208C9.37 1.80167 9.66708 1.80208 10.0008 1.80208C12.6708 1.80208 12.9873 1.81167 14.0417 1.85958C15.0167 1.90417 15.5458 2.06708 15.8983 2.20396C16.365 2.38521 16.6977 2.60187 17.0475 2.95187C17.3975 3.30187 17.6142 3.63521 17.7958 4.10187C17.9327 4.45396 18.0958 4.98312 18.1402 5.95812C18.1881 7.01229 18.1985 7.32896 18.1985 9.99771C18.1985 12.6665 18.1881 12.9831 18.1402 14.0373C18.0956 15.0123 17.9327 15.5415 17.7958 15.8935C17.6146 16.3602 17.3975 16.6925 17.0475 17.0423C16.6975 17.3923 16.3652 17.609 15.8983 17.7902C15.5462 17.9277 15.0167 18.0902 14.0417 18.1348C12.9875 18.1827 12.6708 18.1931 10.0008 18.1931C7.33062 18.1931 7.01417 18.1827 5.96 18.1348C4.985 18.0898 4.45583 17.9269 4.10312 17.79C3.63646 17.6087 3.30312 17.3921 2.95312 17.0421C2.60312 16.6921 2.38646 16.3596 2.20479 15.8927C2.06792 15.5406 1.90479 15.0115 1.86042 14.0365C1.8125 12.9823 1.80292 12.6656 1.80292 9.99521C1.80292 7.32479 1.8125 7.00979 1.86042 5.95563C1.905 4.98063 2.06792 4.45146 2.20479 4.09896C2.38604 3.63229 2.60312 3.29896 2.95312 2.94896C3.30312 2.59896 3.63646 2.38229 4.10312 2.20062C4.45562 2.06312 4.985 1.90063 5.96 1.85583C6.8825 1.81417 7.24 1.80167 9.10375 1.79958V1.80208ZM15.3387 3.4625C14.6762 3.4625 14.1387 3.99937 14.1387 4.66208C14.1387 5.32458 14.6762 5.86208 15.3387 5.86208C16.0012 5.86208 16.5387 5.32458 16.5387 4.66208C16.5387 3.99958 16.0012 3.4625 15.3387 3.4625ZM10.0008 4.86458C7.16479 4.86458 4.86542 7.16396 4.86542 10C4.86542 12.836 7.16479 15.1344 10.0008 15.1344C12.8369 15.1344 15.1354 12.836 15.1354 10C15.1354 7.16396 12.8369 4.86458 10.0008 4.86458ZM10.0008 6.66667C11.8417 6.66667 13.3342 8.15896 13.3342 10C13.3342 11.8408 11.8417 13.3333 10.0008 13.3333C8.15979 13.3333 6.6675 11.8408 6.6675 10C6.6675 8.15896 8.15979 6.66667 10.0008 6.66667Z" />
              </svg>
            </a>
          <? } ?>
        </div>
      </div>

    </div>

    <p class="footer__copyright">
      <?= $text_copyright; ?>
    </p>

  </div>
</footer>
</div>

<script src="catalog/view/theme/soocas/js/app.min.js"></script>

</body>

</html>