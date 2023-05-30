<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<? echo $direction; ?>" lang="<? echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<? echo $direction; ?>" lang="<? echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<? echo $direction; ?>" lang="<? echo $lang; ?>">
<!--<![endif]-->

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><? echo $title; ?></title>
  <base href="<? echo $base; ?>">
  <? if ($description) { ?>
    <meta name="description" content="<? echo $description; ?>">
  <? } ?>
  <? if ($keywords) { ?>
    <meta name="keywords" content="<? echo $keywords; ?>">
  <? } ?>
  <? foreach ($styles as $style) { ?>
    <link href="<? echo $style['href']; ?>" type="text/css" rel="<? echo $style['rel']; ?>" media="<? echo $style['media']; ?>">
  <? } ?>
  <? foreach ($links as $link) { ?>
    <link href="<? echo $link['href']; ?>" rel="<? echo $link['rel']; ?>">
  <? } ?>
  <? foreach ($scripts as $script) { ?>
    <script src="<? echo $script; ?>"></script>
  <? } ?>
  <? foreach ($analytics as $analytic) { ?>
    <? echo $analytic; ?>
  <? } ?>

  <link rel="stylesheet" href="catalog/view/theme/soocas/css/app.min.css">

</head>

<body class="<? echo $class; ?> page">
  <div class="page__cover"></div>
  <div class="wrapper">

    <header class="header">
      <div class="container header__container">
        <div class="panel">
          <a href="./category.html" class="panel__link">
            Cуперцена на товары 2022 года к праздникам
            <img class="panel__arrow" src="catalog/view/theme/soocas/images/dist/header/arrow-link.svg" alt="Soocas логотип" width="18" height="10">
          </a>
        </div>
        <div class="header__info">
          <span class="country country_light header__country">Россия</span>
          <a href="<? echo $home; ?>" class="logo">
            <? if ($logo) { ?>
              <img class="logo__img" src="<? echo $logo; ?>" alt="Soocas логотип" width="137" height="30">
            <? } ?>
          </a>
          <div class="header__buttons">
            <button class="header__btn header__btn_cart" aria-label="Корзина">
              <svg class="header__icon" viewBox="0 0 15 20">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M7.61496 0C5.32454 0 3.46111 1.83524 3.46111 4.0909V5.90918H0.692371C0.309869 5.90918 0 6.21442 0 6.59102V17.9546C0 19.0826 0.931837 20.0001 2.07686 20.0001H12.923C14.0683 20.0001 15 19.0826 15 17.9546V6.59097C14.9999 6.21442 14.69 5.90918 14.3076 5.90918H11.7688V4.0909C11.7687 1.83524 9.90526 0 7.61496 0ZM4.15348 10.4546C3.77098 10.4546 3.46111 10.1493 3.46111 9.77274V7.27281H1.38462V17.9546C1.38462 18.3305 1.69523 18.6364 2.07686 18.6364H12.923C13.3046 18.6364 13.6153 18.3305 13.6153 17.9546V7.27281H11.7688V9.77274C11.7688 10.1493 11.4588 10.4546 11.0764 10.4546C10.6941 10.4546 10.3842 10.1493 10.3842 9.77274V7.27281H4.84573V9.77274C4.84573 10.1493 4.53586 10.4546 4.15348 10.4546ZM7.61496 1.36363C6.08793 1.36363 4.84573 2.58703 4.84573 4.0909V5.90918H10.3842V4.0909C10.3842 2.58703 9.14199 1.36363 7.61496 1.36363Z" />
                <path fill-rule="evenodd" clip-rule="evenodd" d="M7.61496 0C5.32454 0 3.46111 1.83524 3.46111 4.0909V5.90918H0.692371C0.309869 5.90918 0 6.21442 0 6.59102V17.9546C0 19.0826 0.931837 20.0001 2.07686 20.0001H12.923C14.0683 20.0001 15 19.0826 15 17.9546V6.59097C14.9999 6.21442 14.69 5.90918 14.3076 5.90918H11.7688V4.0909C11.7687 1.83524 9.90526 0 7.61496 0ZM4.15348 10.4546C3.77098 10.4546 3.46111 10.1493 3.46111 9.77274V7.27281H1.38462V17.9546C1.38462 18.3305 1.69523 18.6364 2.07686 18.6364H12.923C13.3046 18.6364 13.6153 18.3305 13.6153 17.9546V7.27281H11.7688V9.77274C11.7688 10.1493 11.4588 10.4546 11.0764 10.4546C10.6941 10.4546 10.3842 10.1493 10.3842 9.77274V7.27281H4.84573V9.77274C4.84573 10.1493 4.53586 10.4546 4.15348 10.4546ZM7.61496 1.36363C6.08793 1.36363 4.84573 2.58703 4.84573 4.0909V5.90918H10.3842V4.0909C10.3842 2.58703 9.14199 1.36363 7.61496 1.36363Z" />
              </svg>
              <span class="header__cart-num<?= $count_cart ? ' header__cart-num_active' : ''; ?>" id="header-cart">
                <?= $count_cart; ?>
              </span>
            </button>
            <button class="header__btn header__btn_search" aria-label="Поиск">
              <svg class="header__icon" viewBox="0 0 20 20">
                <path d="M13.3502 2.28698C10.3009 -0.762326 5.33846 -0.762326 2.28698 2.28698C-0.762326 5.33737 -0.762326 10.3009 2.28698 13.3502C3.7647 14.828 5.72918 15.6421 7.81916 15.6421C9.53098 15.6421 11.1537 15.0879 12.498 14.0783L18.0923 19.6726C18.3106 19.8909 18.5965 20 18.8824 20C19.1684 20 19.4543 19.8909 19.6726 19.6726C20.1091 19.236 20.1091 18.5288 19.6726 18.0923L14.0783 12.498C15.0879 11.1537 15.6421 9.53098 15.6421 7.81916C15.6421 5.72918 14.828 3.7647 13.3502 2.28698ZM3.86729 11.7699C1.6889 9.59155 1.6889 6.04677 3.86729 3.86729C4.95648 2.7781 6.38837 2.2335 7.81916 2.2335C9.24995 2.2335 10.6807 2.7781 11.7699 3.86729C12.8253 4.92265 13.407 6.32616 13.407 7.81916C13.407 9.31107 12.8253 10.7146 11.7699 11.7699C10.7146 12.8253 9.31107 13.407 7.81916 13.407C6.32616 13.407 4.92265 12.8253 3.86729 11.7699Z" />
              </svg>
            </button>
            <button class="header__burger burger" aria-label="Меню">
              <span class="burger__line burger__line_line1"></span>
              <span class="burger__line burger__line_line2"></span>
              <span class="burger__line burger__line_line3"></span>
            </button>
          </div>
        </div>
        <? if ($categories) { ?>
          <div class="header__menu">
            <nav class="nav header__nav">
              <ul class="nav__list">
                <? foreach ($categories as $category) { ?>
                  <li class="nav__item">
                    <a href="<?= $category['href']; ?>" class="nav__link">
                      <?= $category['name']; ?>
                    </a>
                  </li>
                <? } ?>
              </ul>
              <span class="country nav__country">Россия</span>
            </nav>
          </div>
        <? } ?>
      </div>
    </header>
    <main class="main">