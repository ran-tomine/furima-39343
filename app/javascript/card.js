const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵

  const elements = payjp.elements();
  const cardNumberElement = elements.create('cardNumber');
  const cardExpiryElement = elements.create('cardExpiry');
  const cardCvcElement = elements.create('cardCvc');

  cardNumberElement.mount('#card-number');
  cardExpiryElement.mount('#expiry-form');
  cardCvcElement.mount('#card-cvc');
  const form = document.getElementById('charge-form');
  form.addEventListener('submit', (e) => {
    e.preventDefault();

    payjp.createToken(cardNumberElement).then((result) => {
      if (result.error) {

      } else {
        const token = result.id;

        const hiddenInput = document.createElement('input');
        hiddenInput.setAttribute('type', 'hidden');
        hiddenInput.setAttribute('name', 'token');
        hiddenInput.setAttribute('value', token);
        form.appendChild(hiddenInput);

        cardNumberElement.clear();
        cardExpiryElement.clear();
        cardCvcElement.clear();
        document.getElementById("charge-form").submit();
        
      }
    });
  });
};

window.addEventListener('load', pay);




