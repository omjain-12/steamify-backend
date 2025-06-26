#!/bin/bash

# StreamHub Platform - Complete Git History Cleanup Script
# This script removes ALL git history and creates a fresh repository

echo "🧹 Starting complete Git history cleanup for StreamHub Platform..."
echo "⚠️  WARNING: This will permanently delete ALL git history!"
echo ""

# Function to ask for confirmation
confirm() {
    read -p "Are you sure you want to proceed? (yes/no): " choice
    case "$choice" in 
        yes|YES|y|Y ) return 0;;
        * ) echo "Cleanup cancelled."; exit 1;;
    esac
}

# Ask for confirmation
confirm

echo ""
echo "🔄 Step 1: Removing existing Git repository..."

# Remove the entire .git directory
if [ -d ".git" ]; then
    rm -rf .git
    echo "✅ Removed .git directory"
else
    echo "ℹ️  No .git directory found"
fi

# Remove .gitignore to create a fresh one
if [ -f ".gitignore" ]; then
    rm .gitignore
    echo "✅ Removed old .gitignore"
fi

echo ""
echo "🔄 Step 2: Creating fresh .gitignore..."

# Create a comprehensive .gitignore
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*

# Production builds
dist/
build/
.next/
out/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE and Editor files
.vscode/
.idea/
*.swp
*.swo
*~

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Desktop.ini
Thumbs.db

# Logs
logs/
*.log

# Runtime data
pids/
*.pid
*.seed
*.pid.lock

# Coverage directory used by tools like istanbul
coverage/
*.lcov

# nyc test coverage
.nyc_output

# Dependency directories
jspm_packages/

# Optional npm cache directory
.npm

# Optional eslint cache
.eslintcache

# Microbundle cache
.rpt2_cache/
.rts2_cache_cjs/
.rts2_cache_es/
.rts2_cache_umd/

# Optional REPL history
.node_repl_history

# Output of 'npm pack'
*.tgz

# Yarn Integrity file
.yarn-integrity

# dotenv environment variables file
.env.test

# parcel-bundler cache (https://parceljs.org/)
.cache
.parcel-cache

# Next.js build output
.next

# Nuxt.js build / generate output
.nuxt

# Gatsby files
.cache/
public

# Storybook build outputs
.out
.storybook-out

# Temporary folders
tmp/
temp/
public/temp/*
!public/temp/.gitkeep

# Local database files
*.sqlite
*.sqlite3
*.db

# StreamHub specific ignores
uploads/
media/
logs/
sessions/

# Security and sensitive files
*.pem
*.key
*.cert
*.p12
*.pfx

# Backup files
*.bak
*.backup
*.old

# Editor specific
.vscode/settings.json
.vscode/launch.json
.vscode/extensions.json
*.sublime-project
*.sublime-workspace

# Package manager files
package-lock.json
yarn.lock
pnpm-lock.yaml

# TypeScript cache
*.tsbuildinfo

# ESLint cache
.eslintcache

# Prettier cache
.prettiercache
EOF

echo "✅ Created comprehensive .gitignore"

echo ""
echo "🔄 Step 3: Initializing fresh Git repository..."

# Initialize new git repository
git init

echo "✅ Initialized fresh Git repository"

echo ""
echo "🔄 Step 4: Setting up initial commit..."

# Configure git with generic info (you can change this later)
git config user.name "StreamHub Developer"
git config user.email "developer@streamhub.platform"

# Add all files to staging
git add .

# Create initial commit with StreamHub branding
git commit -m "🎬 Initial commit: StreamHub Media Platform v2.0.0

✨ Features:
- Modern video streaming platform
- Advanced social interactions
- Content management system
- User profiles and analytics
- Secure authentication system
- Real-time notifications
- Mobile-responsive design

🛠️ Tech Stack:
- Node.js & Express.js
- MongoDB with Mongoose
- Cloudinary for media storage
- JWT Authentication
- React.js Frontend

🚀 Built with modern architecture and best practices"

echo "✅ Created initial commit"

echo ""
echo "🔄 Step 5: Cleaning up temporary files..."

# Remove any potential traces
find . -name "*.orig" -delete 2>/dev/null || true
find . -name "*.rej" -delete 2>/dev/null || true
find . -name ".DS_Store" -delete 2>/dev/null || true

echo "✅ Cleaned up temporary files"

echo ""
echo "🎉 Git history cleanup completed successfully!"
echo ""
echo "📋 Summary:"
echo "  ✅ Removed all previous Git history"
echo "  ✅ Created fresh repository"
echo "  ✅ Added comprehensive .gitignore"
echo "  ✅ Made initial commit as StreamHub Platform"
echo "  ✅ Cleaned up temporary files"
echo ""
echo "🔐 Your repository is now completely clean and shows as:"
echo "   📅 Created: $(date)"
echo "   👤 Author: StreamHub Developer"
echo "   💬 Message: StreamHub Media Platform v2.0.0"
echo ""
echo "🚀 Next steps:"
echo "   1. Review and update git config if needed:"
echo "      git config user.name 'Your Name'"
echo "      git config user.email 'your.email@example.com'"
echo ""
echo "   2. Add remote repository (if you have one):"
echo "      git remote add origin <your-new-repo-url>"
echo ""
echo "   3. Push to your repository:"
echo "      git push -u origin main"
echo ""
echo "✨ Your StreamHub Platform is ready!"
