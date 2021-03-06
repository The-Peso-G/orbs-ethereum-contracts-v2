pragma solidity 0.5.16;

import "./spec_interfaces/ICertification.sol";
import "./ContractRegistryAccessor.sol";
import "./WithClaimableFunctionalOwnership.sol";

contract Certification is ICertification, ContractRegistryAccessor, WithClaimableFunctionalOwnership, Lockable {

    mapping (address => bool) guardianCertification;

    /*
     * External methods
     */

    function isGuardianCertified(address addr) external view returns (bool isCertified) {
        return guardianCertification[addr];
    }

    function setGuardianCertification(address addr, bool isCertified) external onlyFunctionalOwner onlyWhenActive {
        guardianCertification[addr] = isCertified;
        emit GuardianCertificationUpdate(addr, isCertified);
        getElectionsContract().guardianCertificationChanged(addr, isCertified);
    }

}
