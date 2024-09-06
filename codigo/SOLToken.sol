// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

interface IERC20 {

    // Getters
    function totalSupply() external view returns(uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    // Functions
    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract SOLToken is IERC20 {

    // Variáveis ​​constantes públicas
    string public constant name = "SOL Coin";
    string public constant symbol = "SOL";
    uint8 public constant decimals = 18;

    // Mappings
    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowed;

    // Fornecimento total do token
    uint256 private totalSupply_;

    // Constructor
    constructor() {
        totalSupply_ = 10 * 10 ** uint256(decimals); // 10 tokens com 18 casas decimais
        balances[msg.sender] = totalSupply_; // Atribuir o fornecimento total ao criador do contrato
    }

    // Functions

    function totalSupply() public view override returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view override returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount <= balances[msg.sender], "Insufficient balance");
        require(recipient != address(0), "Invalid recipient address");

        balances[msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        require(spender != address(0), "Invalid spender address");

        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return allowed[owner][spender];
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        require(amount <= balances[sender], "Insufficient balance");
        require(amount <= allowed[sender][msg.sender], "Allowance exceeded");
        require(recipient != address(0), "Invalid recipient address");

        balances[sender] -= amount;
        allowed[sender][msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }
}
