#!/bin/bash
# Complete Reset Script for Rails 8 Application
# This script will completely reset all caches and restart Rails

echo "════════════════════════════════════════════════════════════════"
echo "  Rails 8 Complete Reset & Restart Script"
echo "════════════════════════════════════════════════════════════════"
echo ""

cd /home/asraf/Projects/Rails/mihishop

echo "Step 1: Killing all Rails/Spring/Puma processes..."
pkill -9 -f spring 2>/dev/null
pkill -9 -f puma 2>/dev/null
pkill -9 -f rails 2>/dev/null
sleep 2
echo "✅ All processes killed"
echo ""

echo "Step 2: Removing all cache directories..."
rm -rf tmp/cache/*
rm -rf tmp/pids/*
rm -rf tmp/sockets/*
rm -rf tmp/storage/*
rm -rf public/assets/*
echo "✅ All caches removed"
echo ""

echo "Step 3: Clearing Rails caches..."
bundle exec rails tmp:clear 2>/dev/null
bundle exec rails assets:clobber 2>/dev/null
echo "✅ Rails caches cleared"
echo ""

echo "Step 4: Verifying admin.js configuration..."
if grep -q "// //= require ckeditor/init" vendor/assets/javascripts/admin.js; then
    echo "✅ CKEditor properly commented out in admin.js"
else
    echo "⚠️  WARNING: CKEditor might not be commented out!"
fi
echo ""

echo "════════════════════════════════════════════════════════════════"
echo "  ✅ Reset Complete!"
echo "════════════════════════════════════════════════════════════════"
echo ""
echo "Now start your Rails server:"
echo "  $ bundle exec rails server"
echo ""
echo "Or use Puma directly:"
echo "  $ bundle exec puma -C config/puma.rb"
echo ""
echo "Then visit: http://localhost:3000/admin"
echo ""
echo "════════════════════════════════════════════════════════════════"

