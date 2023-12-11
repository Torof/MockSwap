// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {IUV2Pair} from "./interfaces/IUV2Pair.sol";
import {SafeERC20, IERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import {FixedPointMathLib} from "solmate/utils/FixedPointMathLib.sol";
import {ERC20} from "solady/tokens/ERC20.sol";

contract UV2Pair is IUV2Pair, ReentrancyGuard, ERC20 {
    using SafeERC20 for IERC20;
    using FixedPointMathLib for uint256;

    uint public constant MINIMUM_LIQUIDITY = 10**3;
    address public immutable factory;
    address public token0;
    address public token1;
    uint112 public reserve0;
    uint112 public reserve1;
    uint32 public blockTimestampLast;
    uint public price0CumulativeLast;
    uint public price1CumulativeLast;
    uint public kLast;

    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Mint(address indexed sender, uint amount0, uint amount1);
    
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );

    event Sync(uint112 reserve0, uint112 reserve1);

    constructor() {
        factory = msg.sender;
    }

    function name() public override pure returns (string memory) {
        return "UV2Pair";
    }

    function symbol() public override pure returns (string memory) {
        return "UV2";
    }

    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external nonReentrant() {
        
    }

    function skim(address to) external nonReentrant() {}

    function sync() external {}

    function initialize(address, address) external {}

    // create version of a mint function that can be called as is, not through a router. msg.sender should have enough balance and enough aproved amounts of token0 and token1
    
    


    function mint(address to) external nonReentrant() returns (uint liquidity) {}

    function burn(address to) external nonReentrant() returns (uint amount0, uint amount1) {}

    function getReserves() public view returns (uint112 reserve0_, uint112 reserve1_, uint32 blockTimestampLast_) {
        reserve0_ = reserve0;
        reserve1_ = reserve1;
        blockTimestampLast_ = blockTimestampLast;
    }

    function _update(uint balance0, uint balance1, uint112 _reserve0, uint112 _reserve1) private {
        require(balance0 <= type(uint112).max && balance1 <= type(uint112).max, "UV2: OVERFLOW");
        uint32 blockTimestamp = uint32(block.timestamp % 2**32);
        uint32 timeElapsed = blockTimestamp - blockTimestampLast; // overflow is desired
        
    }

}