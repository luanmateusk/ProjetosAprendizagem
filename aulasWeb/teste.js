const fetch = require('node-fetch');

const url = "https://api1.binance.com/api/v3/exchangeInfo";

fetch(url)
  .then(response => {
    if (response.ok) {
      return response.json();
    }
    throw new Error("Falha ao obter informações de troca. Código de status HTTP: " + response.status);
  })
  .then(exchange_info => {
    // Filtrar os pares de negociação que envolvem a moeda BTC
    const btc_pairs = exchange_info.symbols
      .filter(symbol => symbol.symbol.includes("BTC"))
      .map(symbol => symbol.symbol);

    // Imprimir os pares de negociação encontrados
    console.log(btc_pairs);
  })
  .catch(error => {
    console.error(error);
  });
