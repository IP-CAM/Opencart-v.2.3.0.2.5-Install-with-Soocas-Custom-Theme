document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('send-form')) {

    document.getElementById('send-form').addEventListener('submit', event => {
      event.preventDefault();
      const form = event.target;
      form.querySelector('button').disabled = true;
      const formData = new FormData(form);
      const xhr = new XMLHttpRequest();
      xhr.open("POST", "/index.php?route=information/contact/sendmail");
      xhr.send(formData);

      xhr.onloadend = function () {
        if (xhr.status == 200) {
          const response = JSON.parse(xhr.response);
          if (response['success']) {
            location.href = response['success'];
          } else {
            alert(response['error'] ? response['error'] : "Форма не отправлена");
          }
          form.querySelector('button').disabled = false;
        } else {
          alert("Ошибка " + this.status);
          form.querySelector('button').disabled = false;
        }
      };
      
    });

  }
});