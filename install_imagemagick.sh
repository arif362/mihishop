#!/bin/bash
# ImageMagick Installation Script for Rails 8 Application

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                                                                ║"
echo "║        ImageMagick Installation for MiniMagick                 ║"
echo "║                                                                ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "⚠️  This script is for Linux systems."
    echo "For macOS, use: brew install imagemagick"
    echo "For Windows, download from: https://imagemagick.org/script/download.php"
    exit 1
fi

# Check if ImageMagick is already installed
if command -v convert &> /dev/null; then
    echo "✅ ImageMagick is already installed!"
    echo ""
    convert --version | head -3
    echo ""
    echo "You can now restart your Rails server:"
    echo "  $ rails server"
    exit 0
fi

echo "📦 Installing ImageMagick..."
echo ""

# Update package list
echo "1. Updating package list..."
sudo apt-get update -qq

# Install ImageMagick
echo "2. Installing imagemagick and libmagickwand-dev..."
sudo apt-get install -y imagemagick libmagickwand-dev

# Verify installation
echo ""
echo "3. Verifying installation..."
if command -v convert &> /dev/null; then
    echo ""
    echo "✅ ImageMagick installed successfully!"
    echo ""
    convert --version | head -3
    echo ""
    echo "════════════════════════════════════════════════════════════════"
    echo ""
    echo "🎉 Installation Complete!"
    echo ""
    echo "Next steps:"
    echo "  1. Restart your Rails server:"
    echo "     $ rails server"
    echo ""
    echo "  2. Test image uploads in your application"
    echo ""
    echo "════════════════════════════════════════════════════════════════"
else
    echo ""
    echo "❌ Installation failed. Please try manually:"
    echo "   $ sudo apt-get install imagemagick libmagickwand-dev"
    exit 1
fi

