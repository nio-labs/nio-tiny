# 🐾 Nio Tiny — Sub-300MB RAM `135M` Sovereign Edge Fleets

[![License: BSL 1.1](https://img.shields.io/badge/License-BSL%201.1-blue.svg)](LICENSE)
[![Engine: nio-xs](https://img.shields.io/badge/Engine-nio--xs-orange.svg)](https://github.com/nio-labs/nio-xs)
[![Models: v0.6.4](https://img.shields.io/badge/Models-v0.6.4-emerald.svg)](https://github.com/nio-labs/nio-xs-models/releases/tag/v0.6.4)
[![RAM: ~250 MB](https://img.shields.io/badge/Active%20RAM-~250%20MB-purple.svg)](#quick-start)

## 💡 Why Nio Tiny?

> **Why should a Raspberry Pi Zero, a `512 MB` IoT board, or an old netbook be locked out of agentic AI?**

Even `0.5B`–`1.5B` models need `~600 MB–1.8 GB` of RAM. **Nio Tiny** shrinks Nio Labs' full specialist architecture — **Lead routing, Web Scout grounding, Anti-Hallucination Guard, `/teach` memory, and `--verify` self-repair** — down to **`135M` parameters (`101 MB` per pod, `~200–300 MB` active RAM)**:
- **`Tiny Orca` (`23 × 135M`):** `23` specialist micro-pods loaded **1 at a time** so active RAM stays `~250 MB`, with `3.4×` HumanEval recovery under 16-round `--verify`.
- **`Tiny Meerkat` (`2 × 135M`):** Just **`202 MB` total disk** (`Tiny Scout + Tiny Builder`), running in `~2.7s` on CPU with `/teach` memory and `--verify`.

---

## 🧩 Tiny Models Included (`v0.6.4`)

| Model | Command | Topology (`SmolLM2-135M-Instruct` `Q4_K_M`) | Disk Size | Active RAM |
| :--- | :--- | :--- | :---: | :---: |
| **Tiny Orca** | `nioxs tiny-orca` | **`23 × 135M`** (`Lead`, `Web Scout`, `Guard`, `Reasoning-Think`, + `19` specialist pods; 1 active at a time) | `~2.3 GB` | **`~200–300 MB`** |
| **Tiny Meerkat** | `nioxs tiny-meerkat` | **`2 × 135M`** (`Tiny Scout` + `Tiny Builder` + `/teach` episodic memory + `--verify`) | **`202 MB`** | **`~250 MB`** |

---

## 📊 Ranked Benchmark Leaderboard (HumanEval `164` & MBPP `100`)

| Rank | Model / Fleet | Active Params | Pods & Total Size (`Q4_K_M`) | HumanEval (`164`) | MBPP (`100`) | Host RAM (`VmHWM`) | CPU Speed |
| :---: | :--- | :---: | :--- | :--- | :--- | :--- | :--- |
| **1** | `SmolLM2-1.7B-Instruct` (`FP16`, Pass@1)* | `1.7B` | `1` pod | `~37.2%` | — | `~3.4 GB` | — |
| **2** | `SmolLM2-360M-Instruct` (`FP16`, Pass@1)* | `360M` | `1` pod | `~16.5%` | — | `~750 MB` | — |
| **3** | **`Tiny Orca`** (`23× 135M`, 16-round) | **`135M`** | **`23 pods / 3.11B`** (`~2.3 GB`, `101 MB/pod`) | **`14.63%`** (`24/164`) | **`26.0%`** (`26/100`) | **`~200–300 MB`** | **`~40+ w/s`** |
| **4** | **`Tiny Meerkat`** (`2× 135M`, 16-round) | **`135M`** | **`2 pods / 270M`** (`202 MB` total) | **`10.37%`** (`17/164`) | **`26.0%`** (`26/100`) | **`~250 MB`** | **`~40+ w/s`** |
| **5** | `SmolLM2-135M-Instruct` (`FP16`, Pass@1)* | `135M` | `1` pod | `~7.9%` | — | `~300 MB` | — |
| **6** | `SmolLM2-135M` (`Base`, `FP16`, Pass@1)* | `135M` | `1` pod | `0.0% – 2.2%` | — | `~300 MB` | — |

*\*Tiny Orca & Tiny Meerkat evaluated on Modal L4 (`Q4_K_M`, 16-round `--verify`). Published single-shot Pass@1 baselines are from HuggingFaceTB (`SmolLM2`).*

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
