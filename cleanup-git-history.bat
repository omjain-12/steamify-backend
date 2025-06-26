@echo off
REM StreamHub Platform - Complete Git History Cleanup Script (Windows)
REM This script removes ALL git history and creates a fresh repository

echo 🧹 Starting complete Git history cleanup for StreamHub Platform...
echo ⚠️  WARNING: This will permanently delete ALL git history!
echo.

set /p choice=Are you sure you want to proceed? (yes/no): 
if /i "%choice%" neq "yes" (
    if /i "%choice%" neq "y" (
        echo Cleanup cancelled.
        exit /b 1
    )
)

echo.
echo 🔄 Step 1: Removing existing Git repository...

REM Remove the entire .git directory
if exist ".git" (
    rmdir /s /q ".git"
    echo ✅ Removed .git directory
) else (
    echo ℹ️  No .git directory found
)

REM Remove .gitignore to create a fresh one
if exist ".gitignore" (
    del ".gitignore"
    echo ✅ Removed old .gitignore
)

echo.
echo 🔄 Step 2: Creating fresh .gitignore...

REM Create a comprehensive .gitignore
(
echo # Dependencies
echo node_modules/
echo npm-debug.log*
echo yarn-debug.log*
echo yarn-error.log*
echo pnpm-debug.log*
echo.
echo # Production builds
echo dist/
echo build/
echo .next/
echo out/
echo.
echo # Environment variables
echo .env
echo .env.local
echo .env.development.local
echo .env.test.local
echo .env.production.local
echo.
echo # IDE and Editor files
echo .vscode/
echo .idea/
echo *.swp
echo *.swo
echo *~
echo.
echo # OS generated files
echo .DS_Store
echo .DS_Store?
echo ._*
echo .Spotlight-V100
echo .Trashes
echo ehthumbs.db
echo Desktop.ini
echo Thumbs.db
echo.
echo # Logs
echo logs/
echo *.log
echo.
echo # Runtime data
echo pids/
echo *.pid
echo *.seed
echo *.pid.lock
echo.
echo # Coverage directory used by tools like istanbul
echo coverage/
echo *.lcov
echo.
echo # nyc test coverage
echo .nyc_output
echo.
echo # Dependency directories
echo jspm_packages/
echo.
echo # Optional npm cache directory
echo .npm
echo.
echo # Optional eslint cache
echo .eslintcache
echo.
echo # Microbundle cache
echo .rpt2_cache/
echo .rts2_cache_cjs/
echo .rts2_cache_es/
echo .rts2_cache_umd/
echo.
echo # Optional REPL history
echo .node_repl_history
echo.
echo # Output of 'npm pack'
echo *.tgz
echo.
echo # Yarn Integrity file
echo .yarn-integrity
echo.
echo # dotenv environment variables file
echo .env.test
echo.
echo # parcel-bundler cache
echo .cache
echo .parcel-cache
echo.
echo # Next.js build output
echo .next
echo.
echo # Nuxt.js build / generate output
echo .nuxt
echo.
echo # Gatsby files
echo .cache/
echo public
echo.
echo # Storybook build outputs
echo .out
echo .storybook-out
echo.
echo # Temporary folders
echo tmp/
echo temp/
echo public/temp/*
echo !public/temp/.gitkeep
echo.
echo # Local database files
echo *.sqlite
echo *.sqlite3
echo *.db
echo.
echo # StreamHub specific ignores
echo uploads/
echo media/
echo logs/
echo sessions/
echo.
echo # Security and sensitive files
echo *.pem
echo *.key
echo *.cert
echo *.p12
echo *.pfx
echo.
echo # Backup files
echo *.bak
echo *.backup
echo *.old
echo.
echo # Editor specific
echo .vscode/settings.json
echo .vscode/launch.json
echo .vscode/extensions.json
echo *.sublime-project
echo *.sublime-workspace
echo.
echo # Package manager files
echo package-lock.json
echo yarn.lock
echo pnpm-lock.yaml
echo.
echo # TypeScript cache
echo *.tsbuildinfo
echo.
echo # ESLint cache
echo .eslintcache
echo.
echo # Prettier cache
echo .prettiercache
) > .gitignore

echo ✅ Created comprehensive .gitignore

echo.
echo 🔄 Step 3: Initializing fresh Git repository...

REM Initialize new git repository
git init

echo ✅ Initialized fresh Git repository

echo.
echo 🔄 Step 4: Setting up initial commit...

REM Configure git with generic info
git config user.name "StreamHub Developer"
git config user.email "developer@streamhub.platform"

REM Add all files to staging
git add .

REM Create initial commit with StreamHub branding
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

echo ✅ Created initial commit

echo.
echo 🔄 Step 5: Cleaning up temporary files...

REM Remove any potential traces
del /q "*.orig" 2>nul
del /q "*.rej" 2>nul
del /q ".DS_Store" 2>nul

echo ✅ Cleaned up temporary files

echo.
echo 🎉 Git history cleanup completed successfully!
echo.
echo 📋 Summary:
echo   ✅ Removed all previous Git history
echo   ✅ Created fresh repository
echo   ✅ Added comprehensive .gitignore
echo   ✅ Made initial commit as StreamHub Platform
echo   ✅ Cleaned up temporary files
echo.
echo 🔐 Your repository is now completely clean and shows as:
echo    📅 Created: %date% %time%
echo    👤 Author: StreamHub Developer
echo    💬 Message: StreamHub Media Platform v2.0.0
echo.
echo 🚀 Next steps:
echo    1. Review and update git config if needed:
echo       git config user.name "Your Name"
echo       git config user.email "your.email@example.com"
echo.
echo    2. Add remote repository (if you have one):
echo       git remote add origin ^<your-new-repo-url^>
echo.
echo    3. Push to your repository:
echo       git push -u origin main
echo.
echo ✨ Your StreamHub Platform is ready!

pause
