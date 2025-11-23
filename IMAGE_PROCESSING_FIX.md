# Image Processing Fix - RMagick to MiniMagick Migration

## ✅ Issue Resolved

**Error**: `LoadError: cannot load such file -- RMagick`

**Solution**: Migrated all uploaders from RMagick to MiniMagick

---

## 🔧 Changes Made

### Files Updated:

1. **app/uploaders/admin/home_slider_uploader.rb**
   - Changed: `include CarrierWave::RMagick`
   - To: `include CarrierWave::MiniMagick`

2. **app/uploaders/admin/image_uploader.rb**
   - Changed: `include CarrierWave::RMagick`
   - To: `include CarrierWave::MiniMagick`
   - Updated `store_file_info` method:
     - From: `::Magick::Image::read(file.file).first`
     - To: `::MiniMagick::Image.open(file.file)`
     - Changed `img.columns` → `img.width`
     - Changed `img.rows` → `img.height`

3. **app/uploaders/admin/blog_cover_photo_uploader.rb**
   - Changed: `include CarrierWave::RMagick`
   - To: `include CarrierWave::MiniMagick`

---

## 📦 Dependencies

✅ **mini_magick** gem (version 5.3.1) - Already in Gemfile and installed

---

## 🖼️ ImageMagick Installation Required

MiniMagick requires ImageMagick or GraphicsMagick to be installed on your system.

### Install ImageMagick on Ubuntu/Debian:

```bash
sudo apt-get update
sudo apt-get install imagemagick libmagickwand-dev
```

### Verify Installation:

```bash
convert --version
```

You should see output like:
```
Version: ImageMagick 6.9.x or 7.x.x
```

### Alternative: GraphicsMagick

If you prefer GraphicsMagick:

```bash
sudo apt-get install graphicsmagick
```

---

## 🚀 Restart Your Application

After installing ImageMagick:

```bash
# Stop the Rails server (Ctrl+C if running)

# Restart Spring (if using)
spring stop

# Start the server again
rails server
```

---

## ✨ Why MiniMagick?

### Advantages over RMagick:

1. **Lighter Memory Usage**: MiniMagick shells out to ImageMagick CLI instead of loading the entire library
2. **Better Rails 8 Compatibility**: MiniMagick is actively maintained
3. **Carrierwave 3.x Recommendation**: MiniMagick is the recommended choice
4. **Easier Installation**: No need for RMagick native extensions compilation

### API Comparison:

| RMagick | MiniMagick |
|---------|-----------|
| `::Magick::Image::read(file).first` | `::MiniMagick::Image.open(file)` |
| `img.columns` | `img.width` |
| `img.rows` | `img.height` |

---

## 🧪 Testing

After installation, test image uploads:

1. Go to your admin panel
2. Try uploading an image (product, blog, slider, etc.)
3. Verify thumbnails are generated correctly

---

## 🐛 Troubleshooting

### If you still see errors:

1. **Verify ImageMagick is installed**:
   ```bash
   which convert
   # Should output: /usr/bin/convert
   ```

2. **Check ImageMagick version**:
   ```bash
   convert --version
   ```

3. **Restart Spring**:
   ```bash
   spring stop
   rails restart
   ```

4. **Check mini_magick gem**:
   ```bash
   bundle exec rails runner "puts MiniMagick.cli_version"
   ```

### If ImageMagick command not found:

Make sure it's in your PATH:
```bash
export PATH="/usr/bin:$PATH"
```

Or add to `~/.bashrc`:
```bash
echo 'export PATH="/usr/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

---

## 📋 Summary

✅ All uploaders migrated to MiniMagick  
✅ mini_magick gem installed (5.3.1)  
⚠️ ImageMagick system installation required  
✅ Code compatible with Rails 8 and Carrierwave 3  

---

## 🔗 Resources

- MiniMagick: https://github.com/minimagick/minimagick
- Carrierwave: https://github.com/carrierwaveuploader/carrierwave
- ImageMagick: https://imagemagick.org/

---

**Next Step**: Install ImageMagick with the command above, then restart your Rails server!

