# 🛍️ MihiShop - Modern E-Commerce Platform

[![Rails Version](https://img.shields.io/badge/Rails-8.1.1-red.svg)](https://rubyonrails.org/)
[![Ruby Version](https://img.shields.io/badge/Ruby-3.3.4-red.svg)](https://www.ruby-lang.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A full-featured, production-ready e-commerce platform built with Ruby on Rails 8, featuring a modern tech stack with Turbo (Hotwire), responsive design, and comprehensive inventory management.

## 🌟 Features

### 🛒 Customer Features
- **Product Catalog** - Browse products with advanced filtering and search
- **Shopping Cart** - Real-time cart updates with Turbo
- **Wishlist** - Save favorite products for later
- **Quick View** - Preview products without leaving the page
- **Product Reviews & Ratings** - Customer feedback system
- **Responsive Design** - Mobile-first, works on all devices
- **Image Gallery** - Lightbox gallery with multiple product images
- **Social Sharing** - Share products on social media
- **Newsletter Subscription** - Stay updated with latest offers
- **Contact Forms** - Easy customer support communication

### 🎨 Product Features
- **Variants Management** - Size, color, and custom attributes
- **Product Categories** - Hierarchical category organization
- **Featured Products** - Highlight special items
- **New Arrivals** - Automatically tagged recent products
- **Discount System** - Percentage-based discounts
- **Stock Tracking** - Real-time inventory management
- **Product Search** - Fast full-text search functionality
- **SEO-Friendly URLs** - Slugified product and category URLs

### 💳 Checkout & Payments
- **Multi-Step Checkout** - Address, Delivery, Payment flow
- **Payment Gateway Integration**:
  - PayPal Express Checkout
  - SSL Commerz (Bangladesh)
  - Extensible for more gateways
- **Order Management** - Complete order lifecycle tracking
- **Guest Checkout** - Purchase without registration
- **Order History** - Customer order tracking

### 📦 Inventory & Fulfillment
- **Multi-Location Stock** - Manage inventory across locations
- **Stock Movements** - Track all inventory changes with audit trail
- **Backorder Support** - Allow orders when out of stock
- **Stock Transfers** - Move inventory between locations
- **Low Stock Alerts** - Automatic notifications
- **Batch Stock Updates** - Efficient inventory management

### 👨‍💼 Admin Panel
- **Dashboard** - Sales analytics and key metrics
- **Product Management** - Full CRUD operations
- **Order Management** - Process and fulfill orders
- **Customer Management** - User accounts and history
- **Inventory Control** - Stock levels and movements
- **Category Management** - Organize product taxonomy
- **Brand Management** - Manage product brands
- **Blog System** - Content marketing with CKEditor
- **Slider Management** - Homepage carousel control
- **Settings** - Store configuration and preferences
- **Reports** - Sales and inventory reports

### 🔐 Authentication & Authorization
- **User Authentication** - Powered by Devise
- **Role-Based Access** - Admin and customer roles
- **CanCanCan Authorization** - Granular permissions
- **Secure Sessions** - Industry-standard security
- **Password Recovery** - Email-based reset

### 🎯 Marketing & SEO
- **Blog System** - Content marketing with rich text editor
- **Testimonials** - Customer reviews showcase
- **Social Media Integration** - Share buttons
- **Meta Tags** - SEO optimization
- **Sitemaps** - Better search engine indexing
- **Newsletter System** - Email marketing integration

## 🚀 Technology Stack

### Backend
- **Ruby 3.3.4** - Latest stable Ruby version
- **Rails 8.1.1** - Modern Rails with all latest features
- **MySQL** - Robust relational database
- **Puma 6.6.1** - High-performance web server

### Frontend
- **Turbo (Hotwire)** - Fast SPA-like navigation without JavaScript frameworks
- **Bootstrap 3** - Responsive UI framework
- **jQuery** - DOM manipulation and AJAX
- **Slick Carousel** - Product and image sliders
- **Select2** - Enhanced dropdowns
- **LightGallery** - Beautiful image galleries
- **Font Awesome** - Icon library

### File Processing
- **CarrierWave 3.1.2** - File upload management
- **MiniMagick 5.3.1** - Image processing
- **ImageMagick** - Image manipulation backend

### Development Tools
- **RSpec Rails 8.0.2** - Comprehensive testing
- **FactoryBot** - Test data generation
- **SimpleCov** - Code coverage analysis
- **Better Errors** - Enhanced error pages
- **Bullet** - N+1 query detection

### Deployment
- **Capistrano** - Automated deployment
- **Puma** - Production web server
- **systemd** - Service management

## 📋 Prerequisites

- Ruby 3.3.4
- Rails 8.1.1
- MySQL 5.7+ or MariaDB 10.3+
- Node.js 16+ and Yarn
- ImageMagick (for image processing)
- Redis (optional, for caching)

## 🔧 Installation

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/mihishop.git
cd mihishop
```

### 2. Install Dependencies
```bash
# Install Ruby gems
bundle install

# Install JavaScript packages
yarn install

# Install ImageMagick (Ubuntu/Debian)
sudo apt-get install imagemagick libmagickwand-dev

# macOS
brew install imagemagick
```

### 3. Database Setup
```bash
# Create database configuration
cp config/database_example.yml config/database.yml

# Edit database.yml with your MySQL credentials

# Create and setup database
rails db:create
rails db:migrate
rails db:seed
```

### 4. Configuration
```bash
# Create secrets file
cp config/secrets.yml.example config/secrets.yml

# Generate secret keys
rails secret

# Edit secrets.yml and add your keys
```

### 5. Start the Server
```bash
# Development server
rails server

# Visit http://localhost:3000
```

### 6. Default Admin Account
```
Email: admin@gmail.com
Password: password123
```
**⚠️ Change this immediately in production!**

## 🧪 Testing

```bash
# Run all tests
bundle exec rspec

# Run specific test file
bundle exec rspec spec/models/product_spec.rb

# Generate coverage report
COVERAGE=true bundle exec rspec
```

## 📦 Deployment

### Production Setup

```bash
# Precompile assets
RAILS_ENV=production rails assets:precompile

# Run migrations
RAILS_ENV=production rails db:migrate

# Start production server
RAILS_ENV=production bundle exec puma -C config/puma.rb
```

### Using Capistrano

```bash
# Deploy to production
cap production deploy

# Deploy to staging
cap staging deploy
```

## 🏗️ Architecture

### Models
- **Product** - Core product with variants support
- **Order** - Order management with state machine
- **User** - Customer and admin accounts
- **StockItem** - Inventory tracking
- **StockMovement** - Inventory change audit trail
- **StockLocation** - Warehouse/store locations
- **Payment** - Payment transaction records
- **Shipment** - Order fulfillment tracking

### Key Design Patterns
- **Service Objects** - Order processing logic
- **Concerns** - Shared model behaviors
- **Decorators** - View presentation logic
- **State Machines** - Order workflow management
- **Polymorphic Associations** - Flexible relationships

## 🔐 Security Features

- ✅ CSRF Protection
- ✅ SQL Injection Prevention
- ✅ XSS Protection
- ✅ Secure Password Hashing (bcrypt)
- ✅ SSL/TLS Support
- ✅ Content Security Policy
- ✅ Role-Based Authorization
- ✅ Session Management
- ✅ Audit Trail for Critical Actions

## 📊 Performance Optimizations

- **Database Indexing** - Optimized queries
- **Eager Loading** - N+1 query prevention
- **Caching** - Fragment and page caching
- **CDN Support** - Asset delivery optimization
- **Image Optimization** - Automatic resizing and compression
- **Turbo Drive** - Fast page transitions

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Follow Ruby Style Guide
- Write descriptive commit messages
- Add tests for new features
- Update documentation

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Rails community for the amazing framework
- All contributors who helped shape this project
- Open source libraries that make this possible

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/mihishop/issues)
- **Documentation**: Check the `/docs` folder for detailed guides

## 🗺️ Roadmap

### Upcoming Features
- [ ] Multi-currency support
- [ ] Advanced analytics dashboard
- [ ] Subscription products
- [ ] Gift cards
- [ ] Customer loyalty program
- [ ] Mobile app (React Native)
- [ ] Advanced SEO tools
- [ ] Email marketing automation
- [ ] Live chat support
- [ ] Multi-vendor marketplace

## 💡 Use Cases

MihiShop is perfect for:
- 🛍️ Small to medium-sized online stores
- 📦 Inventory-heavy businesses
- 🏪 Multi-location retailers
- 🎨 Fashion and apparel stores
- 📱 Electronics stores
- 📚 Bookstores
- 🏠 Home goods retailers

## 🌟 Why MihiShop?

- ✅ **Production-Ready** - Battle-tested in real e-commerce scenarios
- ✅ **Modern Stack** - Rails 8 with Turbo for lightning-fast performance
- ✅ **Scalable** - Handles thousands of products and orders
- ✅ **Customizable** - Easy to extend and modify
- ✅ **Well-Documented** - Comprehensive guides and comments
- ✅ **Active Development** - Regular updates and improvements
- ✅ **SEO Optimized** - Built with search engines in mind

---

Made with ❤️ by the MihiShop Team

**⭐ Star us on GitHub — it motivates us a lot!**
