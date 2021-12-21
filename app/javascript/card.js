const pay = () => {
  Payjp.setPublicKey("pk_test_2c832e9d0832b7947e2283e4");
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buy_shipping_addresse[number]"),
      cvc: formData.get("buy_shipping_addresse[cvc]"),
      exp_month: formData.get("buy_shipping_addresse[exp_month]"),
      exp_year: `20${formData.get("buy_shipping_addresse[exp_year]")}`,
    };
    // console.log(card);
    // debugger;

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);