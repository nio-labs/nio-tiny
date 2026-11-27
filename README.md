# 🐾 Nio Tiny — Experimental `135M` Edge Coding Assistants & Micro-Models (`~250 MB` RAM)

[![License: BSL 1.1](https://img.shields.io/badge/License-BSL%201.1-blue.svg)](LICENSE)
[![Engine: nio-xs](https://img.shields.io/badge/Engine-nio--xs-orange.svg)](https://github.com/nio-labs/nio-xs)
[![Models: v0.6.6](https://img.shields.io/badge/Models-v0.6.6-emerald.svg)](https://github.com/nio-labs/nio-xs-models/releases/tag/v0.6.6)
[![RAM: ~250 MB](https://img.shields.io/badge/Active%20RAM-~250%20MB-purple.svg)](#quick-start)

## 💡 Why Nio Tiny?

> **How small can a self-verifying coding assistant get before it stops fitting in `250 MB` of RAM?**

Even `0.5B`–`1.5B` AI models need `~600 MB–1.8 GB` of RAM, which leaves out Raspberry Pi Zeros, `512 MB` IoT boards, and legacy hardware. **Nio Tiny** is our **experimental `135M` edge line** (`Tiny Orca` & `Tiny Meerkat`) testing how far **specialist routing, web grounding, `/teach` memory, and `--verify` self-repair** can stretch at `101 MB` per pod and `~250 MB` active RAM.

> **Honest expectations:** At `135M` parameters, Nio Tiny is best suited for **short scripts, simple helper functions, quick offline Q&A, and edge AI experiments** — not complex multi-file software engineering. For heavy daily coding, use [**Nio Orca**](https://github.com/nio-labs/nio-orca) (`85–92%` HumanEval) or [**Nio Meerkat**](https://github.com/nio-labs/nio-meerkat).
- **`Tiny Orca` (`23 × 135M`):** `23` specialist micro-pods loaded **1 at a time** so active RAM stays `~250 MB`, with `3.4×` HumanEval recovery under 16-round `--verify`.
- **`Tiny Meerkat` (`0.5B IQ3_XXS`):** Upgraded from `2×135M` (`10.37%` HE) to a **`319 MB`** `IQ3_XXS` `0.5B` Reflex model (`67.68%` HumanEval, `70.0%` MBPP, `624 MB` RSS) with `/teach` memory and `--verify`.

---

## 🧩 Tiny Models Included (`v0.6.6`)

| Model | Command | Topology | Disk Size | Active RAM |
| :--- | :--- | :--- | :---: | :---: |
| **Tiny Orca** | `nioxs tiny-orca` | **`23 × 135M`** (`Lead`, `Web Scout`, `Guard`, `Reasoning-Think`, + `19` specialist pods; 1 active at a time) | `~2.3 GB` | **`~200–300 MB`** |
| **Tiny Meerkat** | `nioxs tiny-meerkat` | **`0.5B IQ3_XXS`** (`Tiny Reflex` + `0.5B` Wave 1 LoRAs + `/teach` memory + `--verify`) | **`319 MB`** | **`~624 MB`** |

---

## 📊 Ranked Benchmark Leaderboard (HumanEval `164` & MBPP `100`)

| Rank | Model / Fleet | Active Params | Pods & Total Size | HumanEval (`164`) | MBPP (`100`) | Host RAM (`VmHWM`) | CPU Speed |
| :---: | :--- | :---: | :--- | :--- | :--- | :--- | :--- |
| **1** | **`Tiny Meerkat`** (`0.5B IQ3_XXS`, 16-round) | **`0.5B`** | **`1` pod (`319 MB`)** | **`67.68%`** (`111/164`) | **`70.0%`** (`70/100`) | **`624.1 MB`** | **`~15–25 w/s`** |
| **2** | `SmolLM2-1.7B-Instruct` (`FP16`, Pass@1)* | `1.7B` | `1` pod | `~37.2%` | — | `~3.4 GB` | — |
| **3** | `SmolLM2-360M-Instruct` (`FP16`, Pass@1)* | `360M` | `1` pod | `~16.5%` | — | `~750 MB` | — |
| **4** | **`Tiny Orca`** (`23× 135M`, 16-round) | **`135M`** | **`23 pods / 3.11B`** (`~2.3 GB`, `101 MB/pod`) | **`14.63%`** (`24/164`) | **`26.0%`** (`26/100`) | **`~333 MB`** | **`~40+ w/s`** |
| **5** | `Tiny Meerkat` (`2× 135M` legacy, 16-round) | `135M` | `2 pods` (`202 MB`) | `10.37%` (`17/164`) | `26.0%` (`26/100`) | `~334 MB` | `~40+ w/s` |
| **6** | `SmolLM2-135M-Instruct` (`FP16`, Pass@1)* | `135M` | `1` pod | `~7.9%` | — | `~300 MB` | — |

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
