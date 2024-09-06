# 🌐 SOLToken - Criação de uma Criptomoeda na Rede Ethereum

#### 🚀 Este projeto é um exemplo de criação de uma criptomoeda (SOL Coin) utilizando a linguagem Solidity e contratos inteligentes na rede Ethereum. O código foi desenvolvido utilizando a ChainIDE e validado em uma blockchain de teste criada com o Ganache, com o gerenciamento de carteiras feito via MetaMask.

## 🎯 Objetivo
O objetivo deste projeto é fornecer um exemplo prático de como criar e implementar um token ERC-20 na rede Ethereum. O token **SOL Coin** segue o padrão ERC-20, que é amplamente utilizado para a criação de tokens fungíveis em contratos inteligentes na blockchain Ethereum.

## 🛠 Ferramentas Utilizadas
1. **ChainIDE:📝** Utilizada para escrever e compilar o código Solidity.

    •  [Link para o ChainIDE](https://chainide.com/) 🔗

2. **Ganache:🍥** Usado para criar uma blockchain Ethereum de teste para deploy e validação do contrato inteligente.

    •  [Link para o Ganache](https://archive.trufflesuite.com/ganache/) 🔗

3. **MetaMask:🦊** Usado para gerenciar as contas e carteiras durante o processo de desenvolvimento e teste.

    •  [Link para o MetaMask](https://metamask.io/) 🔗

## 📄 Contrato Inteligente - SOLToken

O contrato **SOLToken** é uma implementação da interface **IERC20**, contendo todas as funções necessárias para seguir o padrão ERC-20. Ele define um token chamado **SOL Coin**, com símbolo **SOL** e 18 casas decimais. Pode estar conferindo o código completo [AQUI](https://github.com/marceloansantos/Criando-uma-Criptomoeda-na-Rede-Ethereum_SOLToken/blob/main//codigo/SOLToken.sol)

## 🔑 Variáveis e Mapeamentos

**•  name, symbol, decimals:** Constantes que definem o nome, o símbolo e a precisão (decimais) do token.

**• balances:** Mapeamento que armazena o saldo de tokens de cada endereço.

**•  allowed:** Mapeamento que guarda as permissões (allowance) entre endereços, ou seja, quanto um endereço pode gastar em nome de outro.

**•  totalSupply_:** Variável privada que guarda o total de tokens emitidos.

## ⚙️ Constructor

O **constructor** do contrato inicializa o total de tokens emitidos e atribui todos eles ao criador do contrato (endereço que fez o deploy). No exemplo, 10 tokens com 18 decimais são criados:

```
constructor() {
    totalSupply_ = 10 * 10 ** uint256(decimals);
    balances[msg.sender] = totalSupply_;
}
```

## 📝 Funções Implementadas

1. **•  totalSupply():** Retorna o total de tokens existentes. O valor é armazenado na variável totalSupply_.

2. **•  balanceOf(address tokenOwner):** Retorna o saldo de tokens de um determinado endereço.

3. **•  transfer(address recipient, uint256 amount):** Realiza a transferência de tokens do remetente para o destinatário. Essa função:

    •  Verifica se o remetente tem saldo suficiente.

    •  Garante que o destinatário não seja um endereço nulo.

    •  Atualiza os saldos e emite o evento **Transfer**.

4. **•  approve(address spender, uint256 amount):** Permite que um terceiro (spender) gaste uma quantidade limitada de tokens em nome do proprietário. Isso é útil para situações como contratos que requerem transferências automatizadas.

5. **•  allowance(address owner, address spender):** Retorna o valor que um endereço pode gastar em nome de outro, com base na função **approve**.

6. **•  transferFrom(address sender, address recipient, uint256 amount):** Transfere tokens de um endereço para outro usando a permissão concedida via **approve**. A função verifica se o remetente tem saldo suficiente e se o valor permitido não foi excedido.

## 📢 Eventos

**•  Transfer:** Emitido em todas as transferências, incluindo aquelas feitas via **transferFrom**.

**•  Approval:** Emitido quando um proprietário aprova um terceiro para gastar seus tokens.

## 📚 Referencias

Este projeto foi baseado no exemplo fornecido pelo professor **Cassiaone Peres** no Diretório do Github da DIO ([Clique aqui para visualizar o código](https://github.com/digitalinnovationone/formacao-blockchain-dio/blob/main/Modulo%2003%20Desenvolvimento%20com%20Solidity/Curso%2002%20Desenvolvimento%20de%20Smart%20Contracts/Criando%20a%20sua%20primeira%20criptomoeda%20da%20Rede%20Ethereum/DIOToken.sol)). Algumas modificações foram feitas para melhorar a experiência de desenvolvimento e adicionar funcionalidades.