pragma solidity ^0.8.0;

library Secp256r1 {
    uint256 constant ORDER = 0xffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551;

    function isScalar(uint256 scalar) internal pure returns (bool) {
        return scalar > 0 && scalar < ORDER;
    }
}
