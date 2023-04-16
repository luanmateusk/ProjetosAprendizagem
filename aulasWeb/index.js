// import readline from 'readline'
// import axios from 'axios'

// const api = 'https://api1.binance.com/api/v3/exchangeInfo';
// const rl = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// rl.question('Informe uma criptomoeda: ', (moeda) => {
//   if(moeda !=""){
//       try{
//         var valor;
//         axios.get('https://api1.binance.com/api/v3/exchangeInfo?symbol='+moeda+'BRL')
//         .then((response)=>{
//           valor=response.data.symbols
//           console.log(valor)
//       })
//       }
//       catch{console.log('Essa moeda, ${moeda} não existe');}
//   }else{
//     console.log("Informe a moeda correta")
//   }

// });

import readline from 'readline'
import axios from 'axios'

const api = 'https://api1.binance.com/api/v3/exchangeInfo';
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Você deseja comprar qual moeda? ', (moeda) => {
    if (moeda != "") {

        try {
            var valor;
            axios.get('https://api1.binance.com/api/v3/exchangeInfo?symbol='+ moeda+ 'BRL')
                .then((response) => {
                    valor = response.data.symbols
                    console.log(valor)
                })

        }
        catch { console.log(`Essa moeda,' ${moeda} não existe!` );
       }

    } else {
        console.log('informe a moeda correta dentro desta lista:' );
    }

}
);