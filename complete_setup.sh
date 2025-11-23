#!/bin/bash
# Complete Rails 8 Setup - Install ImageMagick and Start Server

echo "══════════════════════════════════════════════════════════════════"
echo "  Rails 8 Application - Final Setup"
echo "══════════════════════════════════════════════════════════════════"
echo ""

# Check if ImageMagick is installed
if command -v convert &> /dev/null; then
    echo "✅ ImageMagick is already installed!"
    convert --version | head -1
    echo ""
else
    echo "📦 Installing ImageMagick..."
    echo ""
    sudo apt-get update -qq
    sudo apt-get install -y imagemagick libmagickwand-dev
    echo ""
    if command -v convert &> /dev/null; then
        echo "✅ ImageMagick installed successfully!"
        convert --version | head -1
        echo ""
    else
        echo "❌ ImageMagick installation failed"
        echo "Please install manually: sudo apt-get install imagemagick libmagickwand-dev"
        exit 1
    fi
fi

# Stop Spring
echo "🔄 Stopping Spring..."
bundle exec spring stop 2>/dev/null || true
echo ""

# Check database
echo "🗄️  Checking database..."
if bundle exec rails runner "ActiveRecord::Base.connection" 2>&1 | grep -q "Unknown database"; then
    echo "Creating database..."
    bundle exec rails db:create
    echo "Running migrations..."
    bundle exec rails db:migrate
else
    echo "✅ Database ready"
fi
echo ""

echo "══════════════════════════════════════════════════════════════════"
echo "  ✅ Setup Complete!"
echo "══════════════════════════════════════════════════════════════════"
echo ""
echo "Your Rails 8.1.1 application is ready!"
echo ""
echo "To start the server:"
echo "  $ rails server"
echo ""
echo "Then visit: http://localhost:3000"
echo ""
echo "══════════════════════════════════════════════════════════════════"

