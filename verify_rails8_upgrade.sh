#!/bin/bash
# Rails 8 Upgrade Verification Script
# This script verifies that the Rails 8 upgrade was successful

echo "================================"
echo "Rails 8 Upgrade Verification"
echo "================================"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check Ruby version
echo "1. Checking Ruby version..."
ruby_version=$(ruby -v)
echo "   $ruby_version"
if [[ $ruby_version == *"3.3.4"* ]]; then
    echo -e "   ${GREEN}✓ Ruby version is correct${NC}"
else
    echo -e "   ${RED}✗ Ruby version mismatch${NC}"
fi
echo ""

# Check Rails version
echo "2. Checking Rails version..."
rails_version=$(bundle exec rails -v 2>&1 | grep -o "Rails [0-9.]*" | head -1)
echo "   $rails_version"
if [[ $rails_version == *"8."* ]]; then
    echo -e "   ${GREEN}✓ Rails 8+ is installed${NC}"
else
    echo -e "   ${RED}✗ Rails version is not 8+${NC}"
fi
echo ""

# Check Puma version
echo "3. Checking Puma version..."
puma_version=$(bundle list | grep "puma " | grep -o "[0-9.]*")
echo "   Puma $puma_version"
if [[ $puma_version == 6.* ]]; then
    echo -e "   ${GREEN}✓ Puma 6+ is installed (Rack 3 compatible)${NC}"
else
    echo -e "   ${RED}✗ Puma needs to be version 6+${NC}"
fi
echo ""

# Check Rack version
echo "4. Checking Rack version..."
rack_version=$(bundle list | grep "rack " | grep -o "[0-9.]*" | head -1)
echo "   Rack $rack_version"
if [[ $rack_version == 3.* ]]; then
    echo -e "   ${GREEN}✓ Rack 3+ is installed${NC}"
else
    echo -e "   ${RED}✗ Rack needs to be version 3+${NC}"
fi
echo ""

# Check for CoffeeScript files
echo "5. Checking for CoffeeScript files..."
coffee_files=$(find app/assets -name "*.coffee" 2>/dev/null | wc -l)
if [ $coffee_files -eq 0 ]; then
    echo -e "   ${GREEN}✓ No CoffeeScript files found${NC}"
else
    echo -e "   ${YELLOW}⚠ Found $coffee_files .coffee files - consider converting to .js${NC}"
fi
echo ""

# Check database configuration
echo "6. Checking database configuration..."
if [ -f config/database.yml ]; then
    echo -e "   ${GREEN}✓ database.yml exists${NC}"
else
    echo -e "   ${RED}✗ database.yml not found${NC}"
fi
echo ""

# Check if Gemfile.lock is up to date
echo "7. Checking Gemfile.lock..."
if bundle check > /dev/null 2>&1; then
    echo -e "   ${GREEN}✓ All gems are properly installed${NC}"
else
    echo -e "   ${YELLOW}⚠ Run 'bundle install' to ensure all gems are installed${NC}"
fi
echo ""

# Check for deprecated patterns (common ones)
echo "8. Checking for deprecated patterns..."
deprecated_found=0

if grep -r "before_filter" app/ --include="*.rb" > /dev/null 2>&1; then
    echo -e "   ${YELLOW}⚠ Found 'before_filter' - replace with 'before_action'${NC}"
    deprecated_found=1
fi

if grep -r "table_exists?" app/ --include="*.rb" > /dev/null 2>&1; then
    echo -e "   ${YELLOW}⚠ Found 'table_exists?' - replace with 'data_source_exists?'${NC}"
    deprecated_found=1
fi

if [ $deprecated_found -eq 0 ]; then
    echo -e "   ${GREEN}✓ No common deprecated patterns found${NC}"
fi
echo ""

# Summary
echo "================================"
echo "Verification Summary"
echo "================================"
echo ""
echo "Next steps:"
echo "1. Create database: rails db:create"
echo "2. Run migrations: rails db:migrate"
echo "3. Start server: rails server"
echo "4. Run tests: bundle exec rspec"
echo ""
echo "For detailed upgrade notes, see: RAILS_8_UPGRADE.md"
echo ""

