{ pkgs, ... }: {
  # Use the latest stable channel
  channel = "stable-24.05";
  
  # Comprehensive package configuration with all necessary tools
  packages = [
    # ================================
    # CORE DEVELOPMENT TOOLS
    # ================================
    
    # Android Development Suite
    pkgs.android-studio          # Latest Android Studio IDE
    pkgs.android-tools           # ADB, fastboot, aapt, etc.
    pkgs.android-udev-rules      # USB device rules for Android
    
    # Java Development Kit (Latest LTS)
    pkgs.jdk21                   # Java 21 LTS - latest recommended
    pkgs.jdk17                   # Java 17 LTS - fallback
    pkgs.jdk11                   # Java 11 LTS - legacy support
    
    # Build Systems & Package Managers
    pkgs.gradle_8                # Latest Gradle 8.x
    pkgs.maven                   # Apache Maven
    pkgs.ant                     # Apache Ant (legacy builds)
    pkgs.bazel                   # Google's build system
    pkgs.cmake                   # CMake for native code
    pkgs.ninja                   # Fast build system
    
    # ================================
    # NODE.JS ECOSYSTEM
    # ================================
    
    # Node.js & Package Managers
    pkgs.nodejs_22               # Node.js 22 LTS
    pkgs.nodejs_20               # Node.js 20 LTS (fallback)
    pkgs.yarn                    # Yarn package manager
    pkgs.pnpm                    # Fast package manager
    pkgs.nodePackages.npm        # Latest npm
    
    # Global Node.js Tools
    pkgs.nodePackages.typescript          # TypeScript compiler
    pkgs.nodePackages.ts-node            # TypeScript execution
    pkgs.nodePackages.nodemon            # Auto-restart on changes
    pkgs.nodePackages.eslint             # JavaScript linter
    pkgs.nodePackages.prettier           # Code formatter
    pkgs.nodePackages.jest               # Testing framework
    pkgs.nodePackages.mocha              # Alternative test runner
    pkgs.nodePackages.webpack           # Module bundler
    pkgs.nodePackages.vite               # Fast build tool
    pkgs.nodePackages.serve              # Static file server
    
    # ================================
    # FIREBASE & GOOGLE CLOUD
    # ================================
    
    # Firebase Tools
    pkgs.nodePackages.firebase-tools     # Firebase CLI
    pkgs.google-cloud-sdk               # Google Cloud SDK
    pkgs.google-cloud-sdk-gce           # GCE components
    
    # ================================
    # VERSION CONTROL & COLLABORATION
    # ================================
    
    # Git & Related Tools
    pkgs.git                     # Git version control
    pkgs.gitAndTools.git-lfs     # Git Large File Storage
    pkgs.gitAndTools.gh          # GitHub CLI
    pkgs.gitAndTools.git-flow    # Git flow branching model
    pkgs.gitAndTools.delta       # Better diff viewer
    pkgs.gitAndTools.tig         # Text-mode interface for Git
    
    # ================================
    # ARCHIVE & COMPRESSION TOOLS
    # ================================
    
    # Essential Archive Tools
    pkgs.zip                     # Create ZIP archives
    pkgs.unzip                   # Extract ZIP archives
    pkgs.p7zip                   # 7-Zip archiver
    pkgs.gnutar                  # GNU tar
    pkgs.gzip                    # GNU gzip
    pkgs.bzip2                   # bzip2 compression
    pkgs.xz                      # XZ compression
    pkgs.zstd                    # Zstandard compression
    pkgs.rar                     # RAR archiver
    pkgs.cabextract              # Microsoft CAB extractor
    
    # ================================
    # NETWORK & WEB TOOLS
    # ================================
    
    # HTTP & Network Tools
    pkgs.curl                    # HTTP client
    pkgs.wget                    # File downloader
    pkgs.httpie                  # User-friendly HTTP client
    pkgs.aria2                   # Multi-protocol downloader
    pkgs.rsync                   # File synchronization
    pkgs.openssh                 # SSH client
    pkgs.openssl                 # SSL/TLS library
    pkgs.ca-certificates         # Certificate authorities
    pkgs.cacert                  # CA certificates
    
    # Network Utilities
    pkgs.netcat                  # Network utility
    pkgs.nmap                    # Network mapper
    pkgs.telnet                  # Telnet client
    pkgs.whois                   # Domain lookup
    pkgs.dig                     # DNS lookup
    pkgs.mtr                     # Network diagnostic tool
    
    # ================================
    # FILE & TEXT PROCESSING
    # ================================
    
    # Text Processing & Search
    pkgs.ripgrep                 # Fast grep alternative (rg)
    pkgs.fd                      # Fast find alternative
    pkgs.bat                     # Cat with syntax highlighting
    pkgs.exa                     # Modern ls replacement
    pkgs.tree                    # Directory tree viewer
    pkgs.jq                      # JSON processor
    pkgs.yq-go                   # YAML processor
    pkgs.xmlstarlet              # XML processor
    pkgs.sed                     # Stream editor
    pkgs.awk                     # Text processing
    pkgs.grep                    # Text search
    pkgs.fzf                     # Fuzzy finder
    
    # File Utilities
    pkgs.file                    # File type detection
    pkgs.which                   # Locate commands
    pkgs.findutils               # Find utilities
    pkgs.coreutils               # Core utilities
    pkgs.util-linux              # Linux utilities
    pkgs.procps                  # Process utilities
    pkgs.htop                    # Process viewer
    pkgs.ncdu                    # Disk usage analyzer
    
    # ================================
    # TEXT EDITORS & DEVELOPMENT
    # ================================
    
    # Text Editors
    pkgs.vim                     # Vim editor
    pkgs.neovim                  # Modern Vim
    pkgs.nano                    # Simple text editor
    pkgs.emacs                   # Emacs editor
    
    # Development Utilities
    pkgs.tmux                    # Terminal multiplexer
    pkgs.screen                  # Terminal multiplexer
    pkgs.zsh                     # Z shell
    pkgs.bash                    # Bash shell
    pkgs.fish                    # Fish shell
    pkgs.starship                # Cross-shell prompt
    
    # ================================
    # PROGRAMMING LANGUAGES
    # ================================
    
    # Python (for build scripts)
    pkgs.python3                 # Python 3
    pkgs.python3Packages.pip     # Python package manager
    pkgs.python3Packages.virtualenv  # Virtual environments
    
    # Ruby (for some build tools)
    pkgs.ruby                    # Ruby language
    
    # Rust (for fast tools)
    pkgs.rustc                   # Rust compiler
    pkgs.cargo                   # Rust package manager
    
    # Go (for modern tools)
    pkgs.go                      # Go language
    
    # ================================
    # DATABASES & STORAGE
    # ================================
    
    # Database Tools
    pkgs.sqlite                  # SQLite database
    pkgs.postgresql              # PostgreSQL client
    pkgs.mysql80                 # MySQL client
    pkgs.redis                   # Redis client
    
    # ================================
    # MEDIA & IMAGE PROCESSING
    # ================================
    
    # Image Processing
    pkgs.imagemagick             # Image manipulation
    pkgs.graphicsmagick          # Alternative image processor
    pkgs.ffmpeg                  # Video/audio processing
    pkgs.gifsicle                # GIF optimizer
    pkgs.optipng                 # PNG optimizer
    pkgs.jpegoptim               # JPEG optimizer
    
    # ================================
    # CONTAINERS & VIRTUALIZATION
    # ================================
    
    # Container Tools
    pkgs.docker                  # Docker containerization
    pkgs.docker-compose          # Docker Compose
    pkgs.podman                  # Alternative to Docker
    pkgs.buildah                 # Container image builder
    
    # ================================
    # MONITORING & DEBUGGING
    # ================================
    
    # System Monitoring
    pkgs.htop                    # Process monitor
    pkgs.iotop                   # I/O monitor
    pkgs.nethogs                 # Network monitor
    pkgs.iftop                   # Network bandwidth monitor
    pkgs.lsof                    # List open files
    pkgs.strace                  # System call tracer
    
    # ================================
    # DOCUMENTATION & PUBLISHING
    # ================================
    
    # Documentation Tools
    pkgs.pandoc                  # Universal document converter
    pkgs.mdbook                  # Rust-based book generator
    pkgs.hugo                    # Static site generator
    pkgs.jekyll                  # Ruby-based site generator
    
    # ================================
    # SECURITY TOOLS
    # ================================
    
    # Security & Encryption
    pkgs.gnupg                   # GPG encryption
    pkgs.age                     # Modern encryption
    pkgs.sops                    # Secrets management
    pkgs.openssl                 # SSL/TLS toolkit
    
    # ================================
    # PERFORMANCE & BENCHMARKING
    # ================================
    
    # Performance Tools
    pkgs.hyperfine               # Command-line benchmarking
    pkgs.wrk                     # HTTP benchmarking
    pkgs.apache-bench            # Apache benchmarking
    
    # ================================
    # MISCELLANEOUS UTILITIES
    # ================================
    
    # System Utilities
    pkgs.watchman                # File watching service
    pkgs.entr                    # Run commands on file change
    pkgs.direnv                  # Environment per directory
    pkgs.nix-direnv              # Nix integration for direnv
    
    # Time & Date
    pkgs.dateutils               # Date utilities
    
    # Networking
    pkgs.inetutils               # Network utilities
    
    # Text Processing
    pkgs.dos2unix                # Line ending conversion
    pkgs.unix2dos                # Line ending conversion
  ];

  # ================================
  # ENVIRONMENT VARIABLES
  # ================================
  
  env = {
    # --------------------------------
    # ANDROID CONFIGURATION
    # --------------------------------
    ANDROID_HOME = "$HOME/.android-sdk";
    ANDROID_SDK_ROOT = "$HOME/.android-sdk";
    ANDROID_AVD_HOME = "$HOME/.android/avd";
    ANDROID_EMULATOR_HOME = "$HOME/.android";
    ANDROID_USER_HOME = "$HOME/.android";
    
    # --------------------------------
    # JAVA CONFIGURATION
    # --------------------------------
    JAVA_HOME = "${pkgs.jdk21.home}";
    JDK_HOME = "${pkgs.jdk21.home}";
    JAVA_OPTS = "-Xmx4096m -XX:+UseG1GC -Djava.awt.headless=true";
    
    # --------------------------------
    # GRADLE CONFIGURATION
    # --------------------------------
    GRADLE_USER_HOME = "$HOME/.gradle";
    GRADLE_OPTS = "-Xmx6144m -XX:MaxMetaspaceSize=2048m -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8";
    GRADLE_DAEMON = "true";
    GRADLE_PARALLEL = "true";
    GRADLE_CACHING = "true";
    GRADLE_CONFIGUREONDEMAND = "true";
    GRADLE_BUILD_CACHE = "true";
    
    # --------------------------------
    # NODE.JS CONFIGURATION
    # --------------------------------
    NODE_OPTIONS = "--max-old-space-size=6144 --max-http-header-size=16384";
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
    NPM_CONFIG_CACHE = "$HOME/.npm-cache";
    YARN_CACHE_FOLDER = "$HOME/.yarn-cache";
    PNPM_HOME = "$HOME/.pnpm";
    
    # --------------------------------
    # FIREBASE CONFIGURATION
    # --------------------------------
    FIREBASE_CONFIG_DIR = "$HOME/.config/firebase";
    GOOGLE_APPLICATION_CREDENTIALS = "$HOME/.config/gcloud/application_default_credentials.json";
    
    # --------------------------------
    # ENVIRONMENT LOADING
    # --------------------------------
    # Load .env files automatically
    DOTENV_CONFIG_PATH = ".env";
    ENV_FILE = ".env";
    
    # --------------------------------
    # PATH EXTENSIONS
    # --------------------------------
    PATH = [
      # User binaries
      "$HOME/.local/bin"
      "$HOME/.npm-global/bin"
      "$HOME/.yarn/bin"
      "$HOME/.pnpm"
      "$HOME/.cargo/bin"
      "$HOME/go/bin"
      
      # Android SDK
      "$ANDROID_HOME/tools"
      "$ANDROID_HOME/tools/bin"
      "$ANDROID_HOME/platform-tools"
      "$ANDROID_HOME/emulator"
      "$ANDROID_HOME/cmdline-tools/latest/bin"
      "$ANDROID_HOME/build-tools/34.0.0"
      
      # Development tools
      "${pkgs.gradle_8}/bin"
      "${pkgs.jdk21}/bin"
      "${pkgs.maven}/bin"
      "${pkgs.nodejs_22}/bin"
      
      # System PATH
      "$PATH"
    ];
    
    # --------------------------------
    # DEVELOPMENT FLAGS
    # --------------------------------
    FORCE_COLOR = "1";
    COLORTERM = "truecolor";
    TERM = "xterm-256color";
    CLICOLOR = "1";
    
    # --------------------------------
    # LOCALE SETTINGS
    # --------------------------------
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    
    # --------------------------------
    # SECURITY & SSL
    # --------------------------------
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    SSL_CERT_DIR = "${pkgs.cacert}/etc/ssl/certs";
    REQUESTS_CA_BUNDLE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    CURL_CA_BUNDLE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    
    # --------------------------------
    # OPTIMIZATION SETTINGS
    # --------------------------------
    # Enable parallel processing
    MAKEFLAGS = "-j$(nproc)";
    
    # Git optimizations
    GIT_OPTIONAL_LOCKS = "0";
    
    # Rust optimizations
    CARGO_BUILD_JOBS = "4";
    RUSTC_WRAPPER = "sccache";
    
    # Python optimizations
    PYTHONUNBUFFERED = "1";
    PYTHONDONTWRITEBYTECODE = "1";
  };

  # ================================
  # IDX WORKSPACE CONFIGURATION
  # ================================
  
  idx = {
    # --------------------------------
    # ESSENTIAL EXTENSIONS
    # --------------------------------
    extensions = [
      # Java/Android Development
      "vscjava.vscode-java-pack"
      "vscjava.vscode-gradle"
      "redhat.java"
      "vmware.vscode-spring-boot"
      "vscjava.vscode-maven"
      
      # Kotlin Development
      "mathiasfrohlich.kotlin"
      "fwcd.kotlin"
      
      # JavaScript/TypeScript/Node.js
      "ms-vscode.vscode-typescript-next"
      "ms-vscode.vscode-eslint"
      "esbenp.prettier-vscode"
      "ms-vscode.vscode-json"
      "ms-vscode.vscode-node-debug2"
      
      # Firebase & Google Cloud
      "toba.vsfire"
      "googlecloudtools.cloudcode"
      
      # Git & Version Control
      "eamodio.gitlens"
      "github.vscode-pull-request-github"
      "github.vscode-github-actions"
      "github.copilot"
      "github.copilot-chat"
      
      # Web Development
      "bradlc.vscode-tailwindcss"
      "ms-vscode.vscode-html-language-server"
      "ms-vscode.vscode-css-language-server"
      
      # XML & Configuration
      "redhat.vscode-xml"
      "redhat.vscode-yaml"
      "dotjoshjohnson.xml"
      
      # Markdown & Documentation
      "yzhang.markdown-all-in-one"
      "davidanson.vscode-markdownlint"
      "shd101wyy.markdown-preview-enhanced"
      
      # Docker & Containers
      "ms-azuretools.vscode-docker"
      "ms-vscode-remote.remote-containers"
      
      # Database
      "ms-mssql.mssql"
      "ckolkman.vscode-postgres"
      
      # REST API & Testing
      "humao.rest-client"
      "ms-vscode.test-adapter-converter"
      
      # Utilities & Productivity
      "ms-vscode.hexeditor"
      "streetsidesoftware.code-spell-checker"
      "aaron-bond.better-comments"
      "oderwat.indent-rainbow"
      "christian-kohler.path-intellisense"
      
      # Themes & Icons
      "pkief.material-icon-theme"
      "zhuangtongfa.material-theme"
      "dracula-theme.theme-dracula"
      "ms-vscode.theme-tomorrowkit"
      
      # File Management
      "alefragnani.bookmarks"
      "ms-vscode.vscode-file-watcher"
      
      # Performance & Monitoring
      "ms-vscode.vscode-performance"
      
      # Security
      "ms-vscode.vscode-security"
      "snyk-security.snyk-vulnerability-scanner"
    ];

    # --------------------------------
    # WORKSPACE LIFECYCLE
    # --------------------------------
    workspace = {
      # Commands to run when workspace is created
      onCreate = {
        # Environment setup
        setup-environment = ''
          echo "🌟 Setting up EthioShop development environment..."
          
          # Create necessary directories
          mkdir -p $HOME/.android-sdk
          mkdir -p $HOME/.android/avd
          mkdir -p $HOME/.gradle
          mkdir -p $HOME/.npm-global
          mkdir -p $HOME/.yarn-cache
          mkdir -p $HOME/.config/firebase
          mkdir -p $HOME/.config/gcloud
          mkdir -p $HOME/.local/bin
          
          echo "✅ Directory structure created!"
        '';
        
        # Setup environment files
        setup-env-files = ''
          echo "📄 Setting up environment files..."
          
          # Copy .env.example to .env if .env doesn't exist
          if [ ! -f .env ]; then
            if [ -f .env.example ]; then
              cp .env.example .env
              echo "📋 Copied .env.example to .env"
            else
              cat > .env << 'EOF'
# EthioShop Environment Variables
PROJECT_NAME=EthioShop
ENVIRONMENT=development
DEBUG_MODE=true

# Firebase Configuration (update with your values)
FIREBASE_PROJECT_ID=your-ethioshop-project-id
FIREBASE_REGION=us-central1

# Chapa Configuration (update with your values)
CHAPA_PUBLIC_KEY=CHAPA_PUBK-your-public-key
CHAPA_SECRET_KEY=CHASECK-your-secret-key
CHAPA_BASE_URL=https://api.chapa.co/v1

# Development Settings
LOG_LEVEL=debug
ENABLE_ANALYTICS=false
API_BASE_URL=http://localhost:5001
EOF
              echo "📝 Created default .env file"
            fi
            echo "⚠️  Please update .env with your actual values!"
          fi
          
          # Setup functions/.env
          if [ -d functions ] && [ ! -f functions/.env ]; then
            if [ -f functions/.env.example ]; then
              cp functions/.env.example functions/.env
            else
              cat > functions/.env << 'EOF'
# Firebase Functions Environment
NODE_ENV=development
FUNCTIONS_EMULATOR=true
LOG_LEVEL=debug

# Emulator hosts
FIRESTORE_EMULATOR_HOST=localhost:8080
FIREBASE_AUTH_EMULATOR_HOST=localhost:9099
FIREBASE_STORAGE_EMULATOR_HOST=localhost:9199

# Update with your actual values
CHAPA_SECRET_KEY=CHASECK-your-secret-key
CHAPA_PUBLIC_KEY=CHAPA_PUBK-your-public-key
EOF
            fi
            echo "📝 Created functions/.env file"
          fi
          
          echo "✅ Environment files setup complete!"
        '';
        
        # Android SDK setup
        setup-android-sdk = ''
          echo "📱 Setting up Android SDK..."
          
          cd $HOME/.android-sdk
          
          # Download Android command line tools if not present
          if [ ! -d "cmdline-tools" ]; then
            echo "📥 Downloading Android SDK Command Line Tools..."
            wget -q -O cmdlinetools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
            unzip -q cmdlinetools.zip
            mkdir -p cmdline-tools/latest
            mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
            rm cmdlinetools.zip
            rm -rf cmdline-tools/NOTICE.txt cmdline-tools/source.properties 2>/dev/null || true
          fi
          
          export PATH="$HOME/.android-sdk/cmdline-tools/latest/bin:$PATH"
          
          # Accept all Android licenses non-interactively
          yes | sdkmanager --licenses > /dev/null 2>&1 || true
          
          # Install essential Android SDK components
          echo "📦 Installing Android SDK components..."
          sdkmanager --install \
            "platform-tools" \
            "platforms;android-34" \
            "platforms;android-33" \
            "platforms;android-32" \
            "build-tools;34.0.0" \
            "build-tools;33.0.2" \
            "build-tools;32.0.0" \
            "extras;google;google_play_services" \
            "extras;google;m2repository" \
            "extras;android;m2repository" \
            "system-images;android-34;google_apis;x86_64" \
            "system-images;android-33;google_apis;x86_64" \
            "emulator" \
            "ndk;25.1.8937393" > /dev/null 2>&1 || true
          
          echo "✅ Android SDK setup complete!"
        '';
        
        # Gradle optimization
        setup-gradle = ''
          echo "⚙️ Optimizing Gradle configuration..."
          
          cat > $HOME/.gradle/gradle.properties << 'EOF'
# Performance optimizations
org.gradle.jvmargs=-Xmx6144m -XX:MaxMetaspaceSize=2048m -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8 -Duser.country=US -Duser.language=en -Duser.variant
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.daemon=true
org.gradle.configureondemand=true
org.gradle.vfs.watch=true
org.gradle.unsafe.configuration-cache=true

# Android optimizations
android.useAndroidX=true
android.enableJetifier=true
android.enableR8.fullMode=true
android.nonTransitiveRClass=true
android.nonFinalResIds=true
android.experimental.enableResourceOptimizations=true
android.enableBuildCache=true
android.databinding.incremental=true
android.databinding.enableV2=true

# Kotlin optimizations
kotlin.code.style=official
kotlin.incremental=true
kotlin.incremental.android=true
kotlin.compiler.execution.strategy=in-process
kotlin.daemon.jvmargs=-Xmx2048m -XX:MaxMetaspaceSize=512m

# Build cache and performance
org.gradle.unsafe.configuration-cache-problems=warn
android.experimental.cacheCompileLibResources=true
android.experimental.enableSourceSetPathsMap=true

# Signing optimization (for release builds)
android.enableV1Signing=false
android.enableV2Signing=true
android.enableV3Signing=true
android.enableV4Signing=true
EOF
          
          echo "✅ Gradle optimization complete!"
        '';
        
        # Node.js setup
        setup-nodejs = ''
          echo "📦 Setting up Node.js environment..."
          
          # Configure npm
          npm config set prefix '$HOME/.npm-global'
          npm config set cache '$HOME/.npm-cache'
          npm config set fund false
          npm config set audit-level moderate
          
          # Install essential global packages
          echo "📥 Installing global Node.js packages..."
          npm install -g \
            firebase-tools@latest \
            typescript@latest \
            ts-node@latest \
            nodemon@latest \
            eslint@latest \
            prettier@latest \
            @angular/cli@latest \
            @vue/cli@latest \
            @nestjs/cli@latest \
            webpack@latest \
            vite@latest \
            serve@latest \
            concurrently@latest \
            cross-env@latest \
            dotenv-cli@latest > /dev/null 2>&1 || true
          
          # Install Firebase Functions dependencies if directory exists
          if [ -d "functions" ]; then
            echo "🔥 Installing Firebase Functions dependencies..."
            cd functions
            npm install || yarn install || pnpm install || true
            cd ..
          fi
          
          echo "✅ Node.js environment setup complete!"
        '';
        
        # Project configuration
        setup-project-config = ''
          echo "📝 Setting up project configuration..."
          
          # Create local.properties for Android
          cat > local.properties << EOF
sdk.dir=$HOME/.android-sdk
ndk.dir=$HOME/.android-sdk/ndk/25.1.8937393
flutter.minSdkVersion=24
EOF
          
          # Make gradlew executable if it exists
          if [ -f gradlew ]; then
            chmod +x gradlew
            echo "✅ Made gradlew executable"
          fi
          
          # Create necessary Android directories in project
          mkdir -p app/src/main/res/{drawable,mipmap,values}
          mkdir -p app/src/main/java
          mkdir -p app/src/androidTest/java
          mkdir -p app/src/test/java
          
          # Create .gitignore if it doesn't exist
          if [ ! -f .gitignore ]; then
            curl -sL https://raw.githubusercontent.com/github/gitignore/master/Android.gitignore > .gitignore
            cat >> .gitignore << 'EOF'

# IDX specific
.idx/cache/
.idx/tmp/
.idx/logs/

# Environment variables
.env
.env.local
.env.*.local
functions/.env
functions/.env.local

# Firebase
.firebase/
firebase-debug.log
firestore-debug.log
ui-debug.log

# Node modules
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*
EOF
          fi
          
          echo "✅ Project configuration complete!"
        '';
        
        # Development tools setup
        setup-dev-tools = ''
          echo "🔧 Setting up development tools..."
          
          # Setup Git configuration helper
          cat > $HOME/.local/bin/git-setup << 'EOF'
#!/bin/bash
echo "Setting up Git configuration..."
read -p "Enter your Git username: " username
read -p "Enter your Git email: " email
git config --global user.name "$username"
git config --global user.email "$email"
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'
echo "Git configuration complete!"
EOF
          chmod +x $HOME/.local/bin/git-setup
          
          # Setup Firebase login helper
          cat > $HOME/.local/bin/firebase-setup << 'EOF'
#!/bin/bash
echo "Setting up Firebase..."
echo "1. Run: firebase login"
echo "2. Run: firebase use --add"
echo "3. Select your project and give it an alias"
echo "4. Update .env files with your project ID"
EOF
          chmod +x $HOME/.local/bin/firebase-setup
          
          # Setup Android emulator helper
          cat > $HOME/.local/bin/android-emulator << 'EOF'
#!/bin/bash
echo "Available Android Virtual Devices:"
$ANDROID_HOME/emulator/emulator -list-avds
echo ""
echo "To create a new AVD:"
echo "avdmanager create avd -n Pixel_6_API_34 -k 'system-images;android-34;google_apis;x86_64' -d pixel_6"
echo ""
echo "To start an emulator:"
echo "$ANDROID_HOME/emulator/emulator -avd [AVD_NAME]"
EOF
          chmod +x $HOME/.local/bin/android-emulator
          
          echo "✅ Development tools setup complete!"
        '';
        
        # Verification and final setup
        verify-installation = ''
          echo "🔍 Verifying installation..."
          
          echo "📊 System Information:"
          echo "  OS: $(uname -s) $(uname -r)"
          echo "  Architecture: $(uname -m)"
          echo ""
          
          echo "☕ Java Information:"
          java -version 2>&1 | head -3
          echo "  JAVA_HOME: $JAVA_HOME"
          echo ""
          
          echo "📱 Android SDK Information:"
          echo "  ANDROID_HOME: $ANDROID_HOME"
          if [ -f "$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager" ]; then
            echo "  SDK Manager: Available"
            $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --list | grep "build-tools" | head -3
          else
            echo "  SDK Manager: Not found"
          fi
          echo ""
          
          echo "📦 Node.js Information:"
          node --version
          npm --version
          echo "  Global packages installed in: $(npm config get prefix)"
          echo ""
          
          echo "⚙️ Gradle Information:"
          gradle --version | head -3
          if [ -f gradlew ]; then
            echo "  Project Gradle Wrapper: Available"
          fi
          echo ""
          
          echo "🔥 Firebase Information:"
          firebase --version 2>/dev/null || echo "  Firebase CLI: Not authenticated (run 'firebase login')"
          echo ""
          
          echo "🔧 Additional Tools:"
          echo "  Git: $(git --version)"
          echo "  Curl: $(curl --version | head -1)"
          echo "  Wget: $(wget --version | head -1)"
          echo "  Zip: $(zip -v | head -1)"
          echo "  Unzip: $(unzip -v | head -1)"
          echo ""
          
          echo "📁 Important Directories:"
          echo "  Android SDK: $ANDROID_HOME"
          echo "  Gradle Home: $GRADLE_USER_HOME"
          echo "  NPM Global: $(npm config get prefix)"
          echo "  Local Bin: $HOME/.local/bin"
          echo ""
          
          echo "✅ Installation verification complete!"
        '';
      };

      # Commands to run when workspace starts
      onStart = {
        # Start development services
        start-services = ''
          echo "🚀 Starting development services..."
          
          # Start Gradle daemon for faster builds
          if [ -f gradlew ]; then
            ./gradlew --daemon > /dev/null 2>&1 &
            echo "✅ Gradle daemon started"
          fi
          
          # Load environment variables
          if [ -f .env ]; then
            set -a
            source .env
            set +a
            echo "✅ Environment variables loaded"
          fi
          
          echo "✅ Development services ready!"
        '';
        
        # Display helpful information
        show-welcome = ''
          echo ""
          echo "🎉 ==============================================="
          echo "🛍️  ETHIOSHOP DEVELOPMENT ENVIRONMENT READY!"
          echo "   ==============================================="
          echo ""
          echo "📚 QUICK START COMMANDS:"
          echo "   ./gradlew assembleDebug      - Build debug APK"
          echo "   ./gradlew installDebug       - Install debug APK"
          echo "   ./gradlew clean              - Clean project"
          echo "   firebase serve               - Start Firebase emulators"
          echo "   firebase deploy              - Deploy to Firebase"
          echo "   adb devices                  - List connected devices"
          echo ""
          echo "🔧 SETUP HELPERS:"
          echo "   git-setup                    - Configure Git"
          echo "   firebase-setup               - Setup Firebase"
          echo "   android-emulator             - Android emulator help"
          echo ""
          echo "📁 KEY DIRECTORIES:"
          echo "   Android SDK: $ANDROID_HOME"
          echo "   Gradle: $GRADLE_USER_HOME"
          echo "   Node Global: $(npm config get prefix 2>/dev/null || echo 'Not configured')"
          echo ""
          echo "⚠️  IMPORTANT:"
          echo "   1. Update .env files with your actual values"
          echo "   2. Add google-services.json to app/ directory"
          echo "   3. Run 'firebase login' to authenticate"
          echo "   4. Run 'git-setup' to configure Git"
          echo ""
          echo "🔗 USEFUL LINKS:"
          echo "   📖 Android Docs: https://developer.android.com"
          echo "   🔥 Firebase: https://console.firebase.google.com"
          echo "   💳 Chapa: https://dashboard.chapa.co"
          echo "   📱 Material Design: https://m3.material.io"
          echo ""
          echo "🆘 NEED HELP?"
          echo "   Check the README.md or .env.example files"
          echo "================================================="
          echo ""
        '';
      };
    };

    # --------------------------------
    # PREVIEW CONFIGURATIONS
    # --------------------------------
    previews = {
      enable = true;
      previews = {
        # Web preview for Firebase hosting
        web = {
          command = ["firebase" "serve" "--only" "hosting" "--port" "$PORT" "--host" "0.0.0.0"];
          manager = "web";
          env = {
            PORT = "$PORT";
            HOST = "0.0.0.0";
          };
        };
        
        # Firebase emulators suite
        firebase-emulators = {
          command = ["firebase" "emulators:start" "--host" "0.0.0.0"];
          manager = "web";
          env = {
            PORT = "4000";
            HOST = "0.0.0.0";
          };
        };
        
        # Node.js API server (for functions development)
        api = {
          command = ["npm" "run" "serve"];
          cwd = "functions";
          manager = "web";
          env = {
            PORT = "3000";
            NODE_ENV = "development";
            HOST = "0.0.0.0";
          };
        };
        
        # Documentation server
        docs = {
          command = ["python3" "-m" "http.server" "$PORT"];
          cwd = "docs";
          manager = "web";
          env = {
            PORT = "8000";
          };
        };
      };
    };
  };
}
