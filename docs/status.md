# Workload Status

This page outlines which Unreal Engine development and deployment workloads are currently known to function correctly under Wine.

## Contents

- [Asset cooking workloads](#asset-cooking-workloads)
- [Code compilation workloads](#code-compilation-workloads)


## Asset cooking workloads

**Status:** Supported for Win64, but still experimental

Asset cooking workloads have been tested thoroughly, and most common cook scenarios should function correctly when targeting the Win64 platform. Cooking assets for other target platforms is not guaranteed to function correctly.


## Code compilation workloads

**Status:** Only partially supported for Win64, and still under active investigation

Code compilation workloads targeting the Win64 platform have received preliminary testing, but there are a number of known issues and breakages. Some of these have been documented and addressed (see the [*Mitigations for Known Issues*](./mitigations.md) page for details), but there are still outstanding issues that have not yet been resolved. It is not yet possible to build Unreal Engine from source without modifying the code, and resources are not provided for doing so. It is recommended that developers wait until code compilation workloads have received further testing and refinement prior to attempting to run these workloads under Wine.
