const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); //PAY.JPテスト公開鍵
  const buyBtn = document.getElementById("charge-form");
  buyBtn.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("form_object[number]"),
      cvc: formData.get("form_object[cvc]"),
      exp_month: formData.get("form_object[exp_month]"),
      exp_year: `20${formData.get("form_object[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const token0bj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", token0bj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load",pay)