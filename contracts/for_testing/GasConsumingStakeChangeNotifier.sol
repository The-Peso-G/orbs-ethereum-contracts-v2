pragma solidity 0.5.16;

import "../IStakeChangeNotifier.sol";

/// @title An interface for notifying of stake change events (e.g., stake, unstake, partial unstake, restate, etc.).
contract GasConsumingStakeChangeNotifier is IStakeChangeNotifier {

    uint counter;
    mapping (uint => uint) state;

    function consumeGas() private {
        for (uint i = 0; i < 400; i++) {
            state[counter++] = 1;
        }
    }

    function stakeChange(address, uint256, bool, uint256) external {
        consumeGas();
    }

    function stakeChangeBatch(address[] calldata, uint256[] calldata, bool[] calldata, uint256[] calldata) external {
        consumeGas();
    }

    function stakeMigration(address, uint256) external {
        consumeGas();
    }
}
