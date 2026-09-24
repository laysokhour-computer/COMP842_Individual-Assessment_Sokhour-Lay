# COMP842 — Individual Technical Assessment Portfolio

**Student:** Sokhour Lay
**Student ID:** 25314544
**Course:** COMP842 Applied Blockchains and Cryptocurrencies — 2026 Semester 2

Source code for the COMP842 individual portfolio. The written answers, screenshots
and reflections are submitted separately as a single PDF. This repository holds the
runnable source files behind those screenshots.

## Contents

| File | Exercise | What it contains |
| --- | --- | --- |
| `COMP842_Exercise 1.ipynb` | 1 — Blockchain structure and tamper detection | A `Block` and `Blockchain` class using SHA-256, with a Merkle root computed over each block's records. The validator checks the Merkle root, the block hash and the previous-hash link, and reports the first invalid block. Themed as an academic records ledger of enrolments, grades and credentials. |
| `COMP842_Exercise 2.ipynb` | 2 — Proof of Work | Nonce mining to a target number of leading zeros, run over 30 blocks at each of four difficulty levels, with timing, hash-attempt and throughput metrics compared against the theoretical 16^difficulty. |
| `COMP842_Exercise 3.ipynb` | 3 — Elliptic curve cryptography | ECDSA key-pair generation on secp256k1, key size comparison in bytes and hexadecimal characters, public key compression per SEC 1, and signature verification using the compressed key. |
| `COMP842_Exercise 4.ipynb` | 4 — Scalability and Layer-2 | Bitcoin throughput calculations at 1 MB, 2 MB and 4 MB block sizes, a comparison against a traditional payment system, and the supporting tables and chart. |
| `Exercise6.sol` | 6 — Solidity smart contract | The tutorial `HelloWorld` contract extended with a `studentId` variable, an `owner` set in the constructor, and an `onlyOwner` modifier guarding the setter. |

**Exercise 5 has no source file.** It was completed entirely in MetaMask on the
Sepolia test network and verified on Sepolia Etherscan, so its evidence is the
wallet address, transaction hash and explorer screenshots in the PDF.

## Environment

| | |
| --- | --- |
| Operating system | Windows |
| Python | 3.11.15 |
| Distribution | Anaconda |
| Environment name | `COMP842` (dedicated conda environment) |
| Editor | JupyterLab |
| Solidity compiler | 0.8.34+commit.80d5c536, run in Remix |
| Contract pragma | `^0.8.0` |
| Wallet | MetaMask browser extension |
| Network | Sepolia Ethereum test network |
| Block explorer | Sepolia Etherscan |

No real funds were used anywhere in this portfolio. All Ether is Sepolia test
Ether obtained from a public faucet.

## Libraries used

### Python standard library, no installation required

| Library | Used in | Purpose |
| --- | --- | --- |
| `hashlib` | Exercises 1, 2 | SHA-256 hashing for block hashes, Merkle roots and Proof-of-Work mining |
| `datetime` | Exercise 1 | Block timestamps |
| `time` | Exercise 2 | Measuring mining time per block |
| `statistics` | Exercise 2 | Mean, minimum, maximum and standard deviation of mining times |

### Third-party packages

| Package | Import | Used in | Purpose |
| --- | --- | --- | --- |
| pandas | `import pandas as pd` | Exercises 2, 4 | Building the results and comparison tables |
| matplotlib | `import matplotlib.pyplot as plt` | Exercises 2, 4 | The log-scale mining chart and the throughput chart |
| cryptography | `from cryptography.hazmat...` | Exercise 3 | ECDSA on secp256k1, PEM serialisation, signing and verification |

The exact imports used in Exercise 3 are:

```python
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives import serialization, hashes
from cryptography.exceptions import InvalidSignature
```

Exercise 1 deliberately uses only the standard library, so the blockchain
implementation has no external dependencies at all.

## How to run the notebooks

1. Create and activate the environment:

   ```bash
   conda create -n COMP842 python=3.11
   conda activate COMP842
   conda install pandas matplotlib
   pip install cryptography
   ```

2. Launch JupyterLab and open the notebook.

3. Run every cell top to bottom with **Kernel → Restart Kernel and Run All Cells**.

Running in order matters in Exercise 1, because the later cells deliberately
tamper with the ledger in place and the output depends on that sequence.

## How to run the smart contract

1. Open [Remix](https://remix.ethereum.org) and create `Exercise6.sol` in the
   `contracts` folder, or upload the file from this repository.
2. Compile with Solidity 0.8.34 or any compatible 0.8.x compiler.
3. In **Deploy & Run Transactions**, set the environment to **Injected Provider —
   MetaMask** and confirm MetaMask is on the Sepolia test network.
4. Deploy, then use `setStudentId` and `studentId` to store and retrieve the value.

Only the account that deployed the contract can call `setStudentId`. A call from any
other account reverts with `Only the owner can update the student ID`.

### Deployed instance

| | |
| --- | --- |
| Contract address | `0x0a7bd6d5769e299332da34400fedc3e40d29652a` |
| Network | Sepolia |
| Deployment block | 11757074 |

## Notes

Notebook outputs are committed on purpose, so the results in the PDF can be checked
against the code without re-running anything.
