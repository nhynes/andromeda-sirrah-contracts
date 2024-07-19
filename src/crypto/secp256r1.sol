pragma solidity ^0.8.0;

library Secp256r1 {
    uint256 constant ORDER = 0xffffffff00000000ffffffffffffffffbce6faada7179e84f3b9cac2fc632551;

    function isScalar(uint256 scalar) internal pure returns (bool) {
        return scalar > 0 && scalar < ORDER;
    }

    function encodeScalarPkcs8Der(uint256 scalar) internal pure returns (bytes memory) {
        // PrivateKeyInfo ::= SEQUENCE {
        //   version                   Version,
        //   privateKeyAlgorithm       AlgorithmIdentifier,
        //   privateKey                OCTET STRING,
        //   attributes           [0]  IMPLICIT Attributes OPTIONAL }
        //
        // 30 81 41         ; SEQUENCE (0x41 bytes)
        //    02 01 00       ; INTEGER (0)
        //    30 13          ; SEQUENCE (0x13 bytes)
        //       06 07       ; OBJECT IDENTIFIER (ecdsaWithSHA1)
        //          2A 86 48 CE 3D 02 01
        //       06 08       ; OBJECT IDENTIFIER (prime256v1)
        //          2A 86 48 CE 3D 03 01 07
        //    04 27          ; OCTET STRING (0x27 bytes)
        //       30 25       ; SEQUENCE (0x25 bytes)
        //          02 01 01 ; INTEGER (1)
        //          04 20    ; OCTET STRING (32 bytes)
        //             <32 byte private key>
        return
            bytes.concat(hex"308141020100301306072a8648ce3d020106082a8648ce3d030107042730250201010420", bytes32(scalar));
    }
}
