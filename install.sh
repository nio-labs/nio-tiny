#!/bin/sh
# Nio Orca Sovereign Pod Fleet Installer (Linux, macOS, WSL)
# One-liner: curl -fsSL https://raw.githubusercontent.com/nio-labs/nio-orca/main/install.sh | bash
set -eu

REPO="nio-labs/nio-orca"
MODEL_REPO="nio-labs/nio-xs-models"
NIOXS_DIR="${HOME}/.nioxs"
MODELS_DIR="${NIOXS_DIR}/models"

echo "🐋 ========================================================"
echo "   Nio Orca: Sovereign vMicroLM Pod Fleet Installer"
echo "   0.5B/1.5B Pod Fleets Beating 7B INT4 on Consumer CPUs"
echo "========================================================"

mkdir -p "${MODELS_DIR}"

# 1. Check if nioxs engine is present
if ! command -v nioxs >/dev/null 2>&1 && ! command -v nio-xs >/dev/null 2>&1; then
    echo "⚙️ nioxs engine not found in PATH."
    echo "📦 Installing NioXS core runtime from nio-labs/nio-xs..."
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL https://raw.githubusercontent.com/nio-labs/nio-xs/main/install.sh | bash || {
            echo "⚠️ Could not auto-install nioxs. Please install manually from https://github.com/nio-labs/nio-xs"
        }
    fi
fi

# 2. Print Orca Fleet commands
echo "📦 Orca weights are hosted at https://github.com/${MODEL_REPO}/releases/tag/v0.6.0"
echo ""
echo "✅ Nio Orca configuration initialized!"
echo ""
echo "To pull Orca Nano (13 pods × 380 MB = ~4.9 GB, ~582 MB RAM, 85.37% HE):"
echo "   nioxs pull orca-nano"
echo ""
echo "To pull Orca Mini (13 pods × 941 MB = ~12.2 GB, ~1,839 MB RAM, 86.59% HE):"
echo "   nioxs pull orca-mini"
echo ""
echo "To pull Orca Omni (26 pods = ~17.1 GB, 0.5B Fast + 1.5B Escalation, 92.07% HE):"
echo "   nioxs pull orca-omni"
echo ""
echo "To run Orca (--verify is enabled by default):"
echo "   nioxs orca-nano \"Write a Python function fib(n) with assert fib(6) == 8\""
echo "   nioxs orca-mini \"Implement a persistent B-tree node split in Python with tests\""
echo "   nioxs orca-omni \"Implement a lock-free ring buffer in Python with tests\""
echo "========================================================"
