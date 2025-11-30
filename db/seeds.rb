# Comprehensive Seed Data for MihiShop
# This seed file will populate the database with realistic fake data
require 'faker'

puts '🌱 Starting database seeding...'
puts ''

# Clear existing data (optional - uncomment if you want to start fresh)
# puts '🗑️  Clearing existing data...'
# [Review, Image, StockItem, Product, ProductCategory, Admin::Category, Admin::Brand, User].each(&:destroy_all)
# puts '✅ Data cleared'
# puts ''

# ========================================
# 1. CREATE ADMIN USER
# ========================================
puts '👤 Creating admin user...'
admin = User.find_or_create_by(email: "admin@gmail.com") do |user|
  user.password = "password"
  user.password_confirmation = 'password'
  user.role = "admin"
  user.name = "Admin User"
end
admin.save!
puts "✅ Admin user created: #{admin.email}"
puts ''

# ========================================
# 2. CREATE REGULAR USERS
# ========================================
puts '👥 Creating regular users...'
10.times do |i|
  User.find_or_create_by(email: "user#{i + 1}@example.com") do |user|
    user.password = 'password'
    user.password_confirmation = 'password'
    user.role = 'user'
    user.name = Faker::Name.name
  end
end
puts "✅ Created #{User.where(role: 'user').count} regular users"
puts ''

# ========================================
# 3. CREATE BRANDS
# ========================================
puts '🏷️  Creating brands...'
brands_data = [
  { name: 'Apple', description: 'Think Different - Premium electronics and devices' },
  { name: 'Samsung', description: 'Innovation for tomorrow - Electronics and appliances' },
  { name: 'Nike', description: 'Just Do It - Athletic wear and sportswear' },
  { name: 'Adidas', description: 'Impossible is Nothing - Sports equipment and apparel' },
  { name: 'Sony', description: 'Make.Believe - Electronics and entertainment' },
  { name: 'Dell', description: 'Technology that empowers you' },
  { name: 'HP', description: 'Keep Reinventing - Computing and printing solutions' },
  { name: 'Puma', description: 'Forever Faster - Athletic and casual footwear' },
  { name: 'LG', description: 'Life\'s Good - Home appliances and electronics' },
  { name: 'Canon', description: 'Delighting You Always - Imaging and optical products' },
  { name: 'Nikon', description: 'At the heart of the image - Camera and imaging' },
  { name: 'Reebok', description: 'Be More Human - Fitness and lifestyle brand' },
  { name: 'Under Armour', description: 'I WILL - Performance apparel and equipment' },
  { name: 'The North Face', description: 'Never Stop Exploring - Outdoor recreation products' },
  { name: 'Levi\'s', description: 'Quality never goes out of style - Denim and casual wear' }
]

brands = []
brands_data.each do |brand_data|
  brand = Admin::Brand.find_or_create_by(name: brand_data[:name]) do |b|
    b.description = brand_data[:description]
    b.is_active = true
    b.keywords = "#{brand_data[:name].downcase}, brand, quality"
    b.meta_title = "#{brand_data[:name]} Products"
    b.meta_desc = brand_data[:description]
  end
  brand.save!
  brands << brand
end
puts "✅ Created #{brands.count} brands"
puts ''

# ========================================
# 4. CREATE CATEGORIES
# ========================================
puts '📂 Creating categories...'
categories_data = [
  { name: 'Electronics', description: 'Latest electronic gadgets and devices', keywords: 'electronics, gadgets, devices' },
  { name: 'Computers & Laptops', description: 'Desktop computers, laptops, and accessories', keywords: 'computers, laptops, pc' },
  { name: 'Smartphones & Tablets', description: 'Mobile phones and tablet devices', keywords: 'smartphones, tablets, mobile' },
  { name: 'Audio & Headphones', description: 'Speakers, headphones, and audio equipment', keywords: 'audio, headphones, speakers' },
  { name: 'Cameras & Photography', description: 'Digital cameras and photography equipment', keywords: 'cameras, photography, dslr' },
  { name: 'Men\'s Clothing', description: 'Fashionable clothing for men', keywords: 'mens, clothing, fashion' },
  { name: 'Women\'s Clothing', description: 'Stylish apparel for women', keywords: 'womens, clothing, fashion' },
  { name: 'Kids\' Clothing', description: 'Comfortable and cute clothes for children', keywords: 'kids, children, clothing' },
  { name: 'Shoes & Footwear', description: 'Comfortable and stylish footwear', keywords: 'shoes, footwear, sneakers' },
  { name: 'Sports Equipment', description: 'Equipment for various sports activities', keywords: 'sports, equipment, fitness' },
  { name: 'Home Appliances', description: 'Appliances for your home', keywords: 'home, appliances, kitchen' },
  { name: 'Furniture', description: 'Quality furniture for home and office', keywords: 'furniture, home, office' },
  { name: 'Books & Media', description: 'Books, magazines, and media', keywords: 'books, reading, media' },
  { name: 'Toys & Games', description: 'Fun toys and games for all ages', keywords: 'toys, games, children' },
  { name: 'Beauty & Personal Care', description: 'Beauty products and personal care items', keywords: 'beauty, care, cosmetics' }
]

categories = []
categories_data.each do |cat_data|
  category = Admin::Category.find_or_create_by(name: cat_data[:name]) do |cat|
    cat.description = cat_data[:description]
    cat.keywords = cat_data[:keywords]
    cat.meta_title = cat_data[:name]
    cat.meta_desc = cat_data[:description]
  end
  category.save!
  categories << category
end
puts "✅ Created #{categories.count} categories"
puts ''

# ========================================
# 5. CREATE STOCK LOCATIONS
# ========================================
puts '📍 Creating stock locations...'
stock_locations_data = [
  { name: 'Main Warehouse', address: '123 Main St, New York, NY 10001', default: true },
  { name: 'West Coast Warehouse', address: '456 Pacific Ave, Los Angeles, CA 90001', default: false },
  { name: 'Central Distribution', address: '789 Central Blvd, Chicago, IL 60601', default: false }
]

stock_locations = []
stock_locations_data.each do |location_data|
  location = StockLocation.find_or_create_by(name: location_data[:name]) do |loc|
    loc.address = location_data[:address]
    loc.default = location_data[:default]
    loc.active = true
  end
  location.save!
  stock_locations << location
end
puts "✅ Created #{stock_locations.count} stock locations"
puts ''

# ========================================
# 6. CREATE PRODUCTS WITH DETAILS
# ========================================
puts '📦 Creating products (this may take a while)...'

# Product templates for different categories
product_templates = {
  'Electronics' => [
    { prefix: 'Smart', types: ['Watch', 'TV', 'Speaker', 'Display', 'Hub'], price_range: 150..800 },
    { prefix: 'Wireless', types: ['Charger', 'Mouse', 'Keyboard', 'Adapter'], price_range: 20..150 }
  ],
  'Computers & Laptops' => [
    { prefix: '', types: ['MacBook Pro', 'MacBook Air', 'Gaming Laptop', 'Business Laptop', 'Chromebook'], price_range: 500..2500 },
    { prefix: 'Desktop', types: ['Gaming PC', 'Workstation', 'All-in-One'], price_range: 600..3000 }
  ],
  'Smartphones & Tablets' => [
    { prefix: '', types: ['iPhone 15', 'Galaxy S24', 'Pixel 8', 'iPad Pro', 'Galaxy Tab'], price_range: 400..1500 }
  ],
  'Audio & Headphones' => [
    { prefix: 'Wireless', types: ['Headphones', 'Earbuds', 'Over-Ear Headphones'], price_range: 50..400 },
    { prefix: 'Bluetooth', types: ['Speaker', 'Soundbar', 'Portable Speaker'], price_range: 40..500 }
  ],
  'Cameras & Photography' => [
    { prefix: 'DSLR', types: ['Camera', 'Camera Kit'], price_range: 500..3000 },
    { prefix: 'Mirrorless', types: ['Camera', 'Full Frame Camera'], price_range: 800..4000 }
  ],
  'Men\'s Clothing' => [
    { prefix: '', types: ['T-Shirt', 'Jeans', 'Jacket', 'Hoodie', 'Shirt', 'Pants'], price_range: 20..150 }
  ],
  'Women\'s Clothing' => [
    { prefix: '', types: ['Dress', 'Blouse', 'Skirt', 'Jeans', 'Jacket', 'Sweater'], price_range: 25..200 }
  ],
  'Kids\' Clothing' => [
    { prefix: '', types: ['T-Shirt', 'Shorts', 'Dress', 'Hoodie', 'Jeans'], price_range: 15..80 }
  ],
  'Shoes & Footwear' => [
    { prefix: 'Running', types: ['Shoes', 'Sneakers'], price_range: 60..200 },
    { prefix: 'Casual', types: ['Sneakers', 'Loafers', 'Boots'], price_range: 50..250 }
  ],
  'Sports Equipment' => [
    { prefix: '', types: ['Yoga Mat', 'Dumbbell Set', 'Resistance Bands', 'Exercise Ball', 'Jump Rope'], price_range: 15..300 }
  ],
  'Home Appliances' => [
    { prefix: '', types: ['Blender', 'Coffee Maker', 'Toaster', 'Air Fryer', 'Microwave'], price_range: 40..400 }
  ],
  'Furniture' => [
    { prefix: '', types: ['Office Chair', 'Desk', 'Bookshelf', 'Sofa', 'Dining Table'], price_range: 100..1500 }
  ],
  'Books & Media' => [
    { prefix: '', types: ['Fiction Book', 'Non-Fiction Book', 'Cookbook', 'Biography', 'Magazine'], price_range: 10..50 }
  ],
  'Toys & Games' => [
    { prefix: '', types: ['Board Game', 'Puzzle', 'Action Figure', 'Doll', 'Building Blocks'], price_range: 15..100 }
  ],
  'Beauty & Personal Care' => [
    { prefix: '', types: ['Moisturizer', 'Shampoo', 'Perfume', 'Makeup Kit', 'Skincare Set'], price_range: 20..150 }
  ]
}

products = []
colors = ['Black', 'White', 'Blue', 'Red', 'Green', 'Gray', 'Silver', 'Gold', 'Rose Gold', 'Navy']
sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'One Size']

product_templates.each do |category_name, templates|
  category = categories.find { |c| c.name == category_name }
  next unless category

  templates.each do |template|
    template[:types].each do |type|
      1.times do |i|  # Reduced from 3 to 1 for faster seeding
        # Select appropriate brand
        brand = if ['Electronics', 'Computers & Laptops', 'Smartphones & Tablets', 'Audio & Headphones', 'Cameras & Photography'].include?(category_name)
          brands.select { |b| ['Apple', 'Samsung', 'Sony', 'Dell', 'HP', 'LG', 'Canon', 'Nikon'].include?(b.name) }.sample
        elsif ['Men\'s Clothing', 'Women\'s Clothing', 'Kids\' Clothing', 'Shoes & Footwear', 'Sports Equipment'].include?(category_name)
          brands.select { |b| ['Nike', 'Adidas', 'Puma', 'Reebok', 'Under Armour', 'The North Face', 'Levi\'s'].include?(b.name) }.sample
        else
          brands.sample
        end

        product_name = "#{template[:prefix]} #{type}".strip
        product_name += " #{i + 1}" if i > 0
        
        price = rand(template[:price_range])
        cost_price = price * 0.6
        discount = [0, 5, 10, 15, 20, 25].sample
        
        product = Product.create!(
          name: product_name,
          code: "PROD-#{SecureRandom.hex(4).upcase}",
          description: "High quality #{product_name.downcase} from #{brand.name}. Perfect for everyday use with excellent durability and performance. Available in various colors and sizes.",
          brand_id: brand.id,
          sale_price: price,
          cost_price: cost_price,
          discount: discount,
          discountable: discount > 0,
          whole_sale: cost_price * 0.8,
          is_active: true,
          is_featured: [true, false, false, false].sample, # 25% chance of being featured
          track_inventory: true,
          color: colors.sample,
          size: ['Men\'s Clothing', 'Women\'s Clothing', 'Kids\' Clothing', 'Shoes & Footwear'].include?(category_name) ? sizes.sample : nil,
          weight: "#{rand(0.1..5.0).round(2)} kg",
          keywords: "#{product_name.downcase}, #{brand.name.downcase}, #{category_name.downcase}",
          meta_title: "#{product_name} - #{brand.name}",
          meta_desc: "Buy #{product_name} from #{brand.name}. #{Faker::Lorem.sentence}",
          reward_point: rand(5..50)
        )
        
        # Associate product with category
        ProductCategory.create!(product: product, category: category)
        
        products << product
      end
    end
  end
end

puts "✅ Created #{products.count} products"
puts ''

# ========================================
# 7. CREATE PRODUCT IMAGES
# ========================================
puts '🖼️  Creating product images...'
puts '⚠️  Skipping image creation - requires actual file uploads'
puts '   Images can be uploaded through the admin panel after seeding'
puts ''

# Note: Image creation requires actual file uploads through CarrierWave
# For demo purposes, you can either:
# 1. Upload images manually through the admin panel
# 2. Set up a script to download and attach real images
# 3. Configure a cloud storage service (AWS S3, Cloudinary, etc.)

# ========================================
# 8. CREATE STOCK ITEMS
# ========================================
puts '📊 Creating stock items...'
stock_items_count = 0
main_location = stock_locations.find { |loc| loc.default }

products.each do |product|
  # Create stock item only in main warehouse (uniqueness constraint)
  stock_count = rand(50..200)

  StockItem.find_or_create_by!(product_id: product.id, stock_location: main_location) do |item|
    item.count_on_hand = stock_count
    item.backorderable = [true, false].sample
  end
  stock_items_count += 1
end

puts "✅ Created #{stock_items_count} stock items"
puts ''

# ========================================
# 9. CREATE PRODUCT REVIEWS
# ========================================
puts '⭐ Creating product reviews...'
users = User.where(role: 'user')
reviews_count = 0

products.each do |product|
  # Each product gets 3-8 reviews
  num_reviews = rand(3..8)
  
  num_reviews.times do
    user = users.sample
    
    rating = rand(3..5)
    review_texts = [
      "Great product! Highly recommend it.",
      "Excellent quality and fast shipping.",
      "Very satisfied with this purchase.",
      "Good value for money.",
      "Works as expected, no complaints.",
      "Amazing product, will buy again!",
      "Perfect for my needs.",
      "Quality is top notch."
    ]
    
    Review.create!(
      product: product,
      user: user,
      name: user.name,
      email: user.email,
      rating: rating,
      text: review_texts.sample,
      is_approved: [true, true, true, false].sample # 75% approved
    )
    reviews_count += 1
  end
end

puts "✅ Created #{reviews_count} reviews"
puts ''

# ========================================
# 10. CREATE RELATED PRODUCTS
# ========================================
puts '🔗 Creating related products...'
related_count = 0

products.each do |product|
  # Find products in the same category
  same_category_products = product.categories.first&.products&.where&.not(id: product.id) || []
  
  # Add 3-5 related products
  same_category_products.sample(rand(3..5)).each do |related|
    RelatedProduct.find_or_create_by!(
      product_id: product.id,
      relative_id: related.id
    )
    related_count += 1
  end
end

puts "✅ Created #{related_count} related product associations"
puts ''

# ========================================
# 11. CREATE SHIPPING METHODS
# ========================================
puts '🚚 Creating shipping methods...'
shipping_methods_data = [
  { name: 'Standard Shipping', admin_name: 'Standard', rate: '5.99', code: 'STANDARD', tracking_url: 'https://track.example.com' },
  { name: 'Express Shipping', admin_name: 'Express', rate: '15.99', code: 'EXPRESS', tracking_url: 'https://track.example.com' },
  { name: 'Overnight Shipping', admin_name: 'Overnight', rate: '29.99', code: 'OVERNIGHT', tracking_url: 'https://track.example.com' },
  { name: 'Free Shipping', admin_name: 'Free', rate: '0.00', code: 'FREE', tracking_url: 'https://track.example.com' }
]

shipping_methods_data.each do |method_data|
  ShippingMethod.find_or_create_by(code: method_data[:code]) do |method|
    method.name = method_data[:name]
    method.admin_name = method_data[:admin_name]
    method.rate = method_data[:rate]
    method.tracking_url = method_data[:tracking_url]
  end
end

puts "✅ Created #{shipping_methods_data.count} shipping methods"
puts ''

# ========================================
# SUMMARY
# ========================================
puts '✨ Seeding complete!'
puts ''
puts '📊 Summary:'
puts "   - Users: #{User.count}"
puts "   - Brands: #{Admin::Brand.count}"
puts "   - Categories: #{Admin::Category.count}"
puts "   - Products: #{Product.count}"
puts "   - Images: #{Image.count}"
puts "   - Stock Locations: #{StockLocation.count}"
puts "   - Stock Items: #{StockItem.count}"
puts "   - Reviews: #{Review.count}"
puts "   - Related Products: #{RelatedProduct.count}"
puts "   - Shipping Methods: #{ShippingMethod.count}"
puts ''
puts '🎉 Your store is now fully populated with fake data!'
puts '🔐 Admin Login: admin@gmail.com / password'
puts '👤 User Login: user1@example.com / password (or user2, user3, etc.)'