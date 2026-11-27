# 🐾 Nio Tiny — Sub-300MB RAM `135M` Sovereign Edge Fleets (`Tiny Orca` & `Tiny Meerkat`)

[![License: BSL 1.1](https://img.shields.io/badge/License-BSL%201.1-blue.svg)](LICENSE)
[![Engine: nio-xs](https://img.shields.io/badge/Engine-nio--xs-orange.svg)](https://github.com/nio-labs/nio-xs)
[![Models: v0.6.4](https://img.shields.io/badge/Models-v0.6.4-emerald.svg)](https://github.com/nio-labs/nio-xs-models/releases/tag/v0.6.4)
[![RAM: ~250 MB](https://img.shields.io/badge/Active%20RAM-~250%20MB-purple.svg)](#quick-start)

> **Ultra-Light Sovereign AI for `512 MB`–`1 GB` Edge Hardware:** **Nio Tiny** brings Nio Labs' specialist pod routing, anti-hallucination guard, web scout, and `--verify` self-repair down to **`135M` parameters (`101 MB` `Q4_K_M` per pod, `~200–300 MB` active RAM)**.

---

## 🧩 Tiny Models Included (`v0.6.4`)

| Model | Command | Topology (`SmolLM2-135M-Instruct` `Q4_K_M`) | Disk Size | Active RAM |
| :--- | :--- | :--- | :---: | :---: |
| **Tiny Orca** | `nioxs tiny-orca` | **`23 × 135M`** (`Lead`, `Web Scout`, `Guard`, `Reasoning-Think`, + `19` specialist pods; 1 active at a time) | `~2.3 GB` | **`~200–300 MB`** |
| **Tiny Meerkat** | `nioxs tiny-meerkat` | **`2 × 135M`** (`Tiny Scout` + `Tiny Builder` + `/teach` episodic memory + `--verify`) | **`202 MB`** | **`~250 MB`** |

---

## 📊 Verified Benchmarks (Modal L4, `Q4_K_M`)

Evaluated on full `openai/openai_humaneval` (`164` tasks) and `google-research-datasets/mbpp` (`sanitized`, `100` tasks):

| System | Active Params | HumanEval `pass@1` | HumanEval `16-Round` | MBPP `pass@1` | MBPP `16-Round` | Published `SmolLM2-135M-Instruct` (`FP16`) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Tiny Orca (`23× 135M`)** | `135M` | `4.27%` (`7/164`) | **`14.63%` (`24/164`)** | `16.0%` (`16/100`) | **`26.0%` (`26/100`)** | `~7.9%` HE |
| **Tiny Meerkat (`2× 135M`)** | `135M` | `6.10%` (`10/164`) | **`10.37%` (`17/164`)** | `11.0%` (`11/100`) | **`26.0%` (`26/100`)** | `~7.9%` HE |

---

## ⚡ Quick Start

### 1. Install `nioxs`
```bash
curl -fsSL https://raw.githubusercontent.com/nio-labs/nio-xs/main/install.sh | bash
```

### 2. Pull Tiny Models (`v0.6.4`)
```bash
# 2-model self-healing herd (~202 MB total)
nioxs pull tiny-meerkat

# 23-pod specialist fleet (~2.3 GB total, ~250 MB active RAM)
nioxs pull tiny-orca
```

### 3. Run Locally
```bash
# Tiny Meerkat (2× 135M)
nioxs tiny-meerkat "write a python function to check palindrome"
nioxs tiny-meerkat --retries 16 "write a python function to merge two sorted lists"

# Tiny Orca (23× 135M: Web Scout -> Lead -> Specialist Pod -> Guard -> Reasoning-Think)
nioxs tiny-orca "write a python function to add two numbers"
nioxs tiny-orca --relay --retries 8 "write me js lang do-while loop"
```

---

## 📜 License

- **Nio Tiny (`nio-tiny`) & Model Weights (`nio-xs-models`):** Licensed under [**Business Source License 1.1 (`BSL 1.1`)**](LICENSE).
- **Runtime (`nio-xs`):** Licensed under the **MIT License**.
