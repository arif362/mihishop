#!/bin/bash
# Quick setup script for Rails 8 application

echo "=========================================="
echo "Rails 8 Quick Setup"
echo "=========================================="
echo ""

# Check if database exists
echo "Step 1: Checking database..."
if bundle exec rails runner "ActiveRecord::Base.connection" 2>&1 | grep -q "Unknown database"; then
    echo "Creating database..."
    bundle exec rails db:create
    echo "✓ Database created"
else
    echo "✓ Database already exists"
fi
echo ""

# Run migrations
echo "Step 2: Running migrations..."
bundle exec rails db:migrate
echo "✓ Migrations complete"
echo ""

# Check for pending migrations
echo "Step 3: Checking migration status..."
bundle exec rails db:migrate:status | tail -5
echo ""

echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Your Rails 8 application is ready!"
echo ""
echo "To start the server:"
echo "  $ rails server"
echo ""
echo "Then visit: http://localhost:3000"
echo ""

