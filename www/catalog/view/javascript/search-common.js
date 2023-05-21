document.addEventListener("DOMContentLoaded", () => {
  document.querySelector('#search input[name=\'search\']').addEventListener('keyup', function (e) {
    let value = this.value;
    const searchResult = document.querySelector('#search_result')
    searchResult.innerHTML = '';
    if (value.length < 1) {
      searchResult.innerHTML = '';
    }
    if (value.length > 1) {
      let request = new XMLHttpRequest();
      request.open("GET", `/index.php?route=product/product/autocomplete&filter_name=${value}`, true);
      request.responseType = 'json';
      request.onload = function () {
        if (this.status >= 200 && this.status < 400) {
          let html = '';
          let json = this.response;
          if (json.length) {
            json.forEach(item => {
              html += `<a class="window__item" href="${item.link}"><div class="window__content"><div class="window__img-wrap"><img class="window__img" src="${item.image}" alt="${item.name}"></div><div class="window__description"><div class="window__name">${item.name}</div><div class="window__price">${item.price}</div></div></div></a>`;
              document.querySelector('#search_result').innerHTML = html;
            });
          } else {
            html += `<li>По вашему запросу ничего не найдено</li>`;
          }
        } else {
          console.log('Что-то не так :х');
        }
      };
      request.onerror = function () {
        console.log('Ошибка подключения 0_0');
      };
      request.send();
    }
  });
});