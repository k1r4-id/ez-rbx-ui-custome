#!/bin/bash

# EzUI Bundler Script
# Quick wrapper untuk menjalankan Python bundler

echo "======================================"
echo "  EzUI Bundler - Quick Start"
echo "======================================"
echo ""

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 tidak ditemukan!"
    echo "   Install Python 3 terlebih dahulu."
    exit 1
fi

# Run the bundler
python3 bundler.py

# Check if bundling was successful
if [ $? -eq 0 ]; then
    echo ""
    echo "======================================"
    echo "✅ Bundling berhasil!"
    echo ""
    echo "Files tersedia di:"
    echo "  - output/bundle.lua (Main library)"
    echo "  - output/example.lua (Example code)"
    echo ""
    echo "Silakan upload ke Roblox Studio!"
    echo "======================================"
else
    echo ""
    echo "======================================"
    echo "❌ Bundling gagal!"
    echo "   Check error messages di atas."
    echo "======================================"
    exit 1
fi
