{ pkgs, ... }: {
  # Use the latest stable channel
  channel = "stable-24.05";
  
  # Package configuration with latest versions
  packages = [
    # Android Development Tools
    pkgs.android-studio  # Latest Android Studio
    pkgs.android-tools   # ADB, fastboot, etc.
    
    # Java Development Kit (Latest LTS)
    pkgs.jdk21           # Java 21 LTS (latest recommended for Android)
    
    # Node.js ecosystem (Latest LTS)
    pkgs.nodejs_22       # Node.js 22 LTS
    pkgs.yarn            # Package manager alternative
    pkgs.pnpm            # Fast package manager
    
    # Firebase and Google Cloud tools
    pkgs.nodePackages.firebase-tools
    pkgs.google-cloud-sdk
    
    # Build systems
    pkgs.gradle_8        # Latest Gradle 8.x
    pkgs.maven           # Maven build tool
    pkgs.bazel           # Google's build tool
    
    # Development utilities
    pkgs.git             # Version control
    pkgs.gh              # GitHub CLI
    pkgs.curl            # HTTP client
    pkgs.wget            # File downloader
    pkgs.jq              # JSON processor
    pkgs.yq              # YAML processor
    pkgs.tree            # Directory structure viewer
    
    # Archive tools
    pkgs.unzip
    pkgs.zip
    pkgs.p7zip
    
    # Text editors and tools
    pkgs.vim
    pkgs.nano
    pkgs.ripgrep         # Fast grep alternative
    pkgs.fd              # Fast find alternative
    pkgs.bat             # Cat with syntax highlighting
    
    # Development servers
    pkgs.python3         # For various build scripts
    pkgs.watchman        # File watcher
    
    # Documentation tools
    pkgs.pandoc          # Document converter
    
    # Container tools (optional)
    pkgs.docker-compose
    
    # SSL/TLS tools
    pkgs.openssl
    pkgs.cacert
  ];

  # Environment variables for optimal development
  env = {
    # Android Configuration
    ANDROID_HOME = "$HOME/.android-sdk";
    ANDROID_SDK_ROOT = "$HOME/.android-sdk";
    ANDROID_AVD_HOME = "$HOME/.android/avd";
    ANDROID_EMULATOR_HOME = "$HOME/.android";
    
    # Java Configuration
    JAVA_HOME = "${pkgs.jdk21.home}";
    
    # Gradle Configuration
    GRADLE_USER_HOME = "$HOME/.gradle";
    GRADLE_OPTS = "-Xmx4096m -XX:MaxMetaspaceSize=1024m -XX:+UseG1GC";
    
    # Node.js Configuration
    NODE_OPTIONS = "--max-old-space-size=4096";
    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
    
    # Firebase Configuration
    FIREBASE_CONFIG_DIR = "$HOME/.config/firebase";
    
    # PATH extensions
    PATH = [
      "$HOME/.npm-global/bin"
      "$HOME/.local/bin"
      "$ANDROID_HOME/tools"
      "$ANDROID_HOME/tools/bin"
      "$ANDROID_HOME/platform-tools"
      "$ANDROID_HOME/emulator"
      "$ANDROID_HOME/cmdline-tools/latest/bin"
      "${pkgs.gradle_8}/bin"
      "${pkgs.jdk21}/bin"
      "$PATH"
    ];
    
    # Development flags
    FORCE_COLOR = "1";
    TERM = "xterm-256color";
    
    # Optimization flags
    GRADLE_PARALLEL = "true";
    GRADLE_DAEMON = "true";
    GRADLE_CACHING = "true";
    
    # Security
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  # IDX workspace configuration
  idx = {
    # Essential extensions for Android development
    extensions = [
      # Java/Android
      "vscjava.vscode-java-pack"
      "vscjava.vscode-gradle"
      "redhat.java"
      "vmware.vscode-spring-boot"
      
      # Kotlin
      "mathiasfrohlich.kotlin"
      "fwcd.kotlin"
      
      # JavaScript/TypeScript for Firebase Functions
      "ms-vscode.vscode-typescript-next"
      "ms-vscode.vscode-eslint"
      "esbenp.prettier-vscode"
      "bradlc.vscode-tailwindcss"
      
      # Firebase
      "toba.vsfire"
      
      # Git
      "eamodio.gitlens"
      "github.vscode-pull-request-github"
      
      # Utilities
      "ms-vscode.hexeditor"
      "streetsidesoftware.code-spell-checker"
      "aaron-bond.better-comments"
      "pkief.material-icon-theme"
      "zhuangtongfa.material-theme"
      
      # XML/JSON
      "redhat.vscode-xml"
      "ms-vscode.vscode-json"
      
      # Markdown
      "yzhang.markdown-all-in-one"
      "davidanson.vscode-markdownlint"
      
      # Docker (if needed)
      "ms-azuretools.vscode-docker"
      
      # REST API testing
      "humao.rest-client"
    ];

    # Workspace lifecycle management
    workspace = {
      # Commands to run when workspace is created
      onCreate = {
        # Setup Android SDK and tools
        setup-android-sdk = ''
          echo "🔧 Setting up Android SDK..."
          
          # Create Android SDK directory
          mkdir -p $HOME/.android-sdk
          mkdir -p $HOME/.android/avd
          mkdir -p $HOME/.gradle
          
          # Download and setup Android SDK
          cd $HOME/.android-sdk
          
          # Download command line tools if not present
          if [ ! -d "cmdline-tools" ]; then
            echo "📥 Downloading Android SDK Command Line Tools..."
            wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
            unzip -q commandlinetools-linux-*_latest.zip
            mkdir -p cmdline-tools/latest
            mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true
            rm -f commandlinetools-linux-*_latest.zip
            rm -rf cmdline-tools/NOTICE.txt cmdline-tools/source.properties 2>/dev/null || true
          fi
          
          export PATH="$HOME/.android-sdk/cmdline-tools/latest/bin:$PATH"
          
          # Accept all licenses
          yes | sdkmanager --licenses > /dev/null 2>&1 || true
          
          # Install essential SDK components
          echo "📦 Installing Android SDK components..."
          sdkmanager --install \
            "platform-tools" \
            "platforms;android-34" \
            "platforms;android-33" \
            "build-tools;34.0.0" \
            "build-tools;33.0.2" \
            "extras;google;google_play_services" \
            "extras;google;m2repository" \
            "extras;android;m2repository" \
            "system-images;android-34;google_apis;x86_64" \
            "emulator" > /dev/null 2>&1 || true
          
          echo "✅ Android SDK setup complete!"
        '';
        
        # Setup Gradle configuration
        setup-gradle = ''
          echo "⚙️ Setting up Gradle..."
          
          mkdir -p $HOME/.gradle
          
          # Create optimized gradle.properties
          cat > $HOME/.gradle/gradle.properties << 'EOF'
# Performance optimizations
org.gradle.jvmargs=-Xmx6144m -XX:MaxMetaspaceSize=2048m -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8 -Duser.country=US -Duser.language=en -Duser.variant
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.daemon=true
org.gradle.configureondemand=true
org.gradle.vfs.watch=true

# Android optimizations
android.useAndroidX=true
android.enableJetifier=true
android.enableR8.fullMode=true
android.nonTransitiveRClass=true
android.nonFinalResIds=true
android.experimental.enableResourceOptimizations=true

# Kotlin optimizations
kotlin.code.style=official
kotlin.incremental=true
kotlin.incremental.android=true
kotlin.compiler.execution.strategy=in-process

# Build cache
android.enableBuildCache=true
EOF
          
          echo "✅ Gradle configuration complete!"
        '';
        
        # Setup Node.js and npm
        setup-nodejs = ''
          echo "📦 Setting up Node.js environment..."
          
          # Create npm global directory
          mkdir -p $HOME/.npm-global
          npm config set prefix '$HOME/.npm-global'
          
          # Install global packages
          npm install -g \
            firebase-tools@latest \
            @angular/cli@latest \
            typescript@latest \
            ts-node@latest \
            nodemon@latest \
            eslint@latest \
            prettier@latest > /dev/null 2>&1 || true
          
          # Setup Firebase Functions dependencies
          if [ -d "functions" ]; then
            echo "🔥 Installing Firebase Functions dependencies..."
            cd functions
            npm install
            cd ..
          fi
          
          echo "✅ Node.js environment setup complete!"
        '';
        
        # Create project configuration files
        setup-project-config = ''
          echo "📝 Setting up project configuration..."
          
          # Create local.properties for Android
          cat > local.properties << EOF
sdk.dir=$HOME/.android-sdk
ndk.dir=$HOME/.android-sdk/ndk/25.1.8937393
EOF
          
          # Create .gitignore if it doesn't exist
          if [ ! -f .gitignore ]; then
            cat > .gitignore << 'EOF'
# Android
*.iml
.gradle
/local.properties
/.idea/
.DS_Store
/build
/captures
.externalNativeBuild
.cxx
google-services.json

# Node.js
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Firebase
.firebase/
firebase-debug.log
firestore-debug.log
ui-debug.log

# IDX
.idx/cache/
.idx/tmp/

# Misc
*.log
.env
.env.local
EOF
          fi
          
          # Make gradlew executable
          if [ -f gradlew ]; then
            chmod +x gradlew
          fi
          
          echo "✅ Project configuration complete!"
        '';
        
        # Verify installation
        verify-setup = ''
          echo "🔍 Verifying installation..."
          
          echo "Java version:"
          java -version 2>&1 | head -1
          
          echo "Node.js version:"
          node --version
          
          echo "npm version:"
          npm --version
          
          echo "Gradle version:"
          gradle --version | head -1
          
          echo "Firebase CLI version:"
          firebase --version 2>/dev/null || echo "Firebase CLI not found - run 'npm install -g firebase-tools'"
          
          echo "Android SDK location: $ANDROID_HOME"
          
          if [ -f gradlew ]; then
            echo "Gradle wrapper:"
            ./gradlew --version | head -1
          fi
          
          echo "✅ Setup verification complete!"
        '';
      };

      # Commands to run when workspace starts
      onStart = {
        # Start Gradle daemon for faster builds
        start-services = ''
          echo "🚀 Starting development services..."
          
          # Start Gradle daemon
          if [ -f gradlew ]; then
            ./gradlew --daemon > /dev/null 2>&1 &
          fi
          
          echo "✅ Development services started!"
        '';
        
        # Display helpful information
        show-info = ''
          echo ""
          echo "🎉 EthioShop Development Environment Ready!"
          echo ""
          echo "📚 Useful commands:"
          echo "  ./gradlew assembleDebug    - Build debug APK"
          echo "  ./gradlew installDebug     - Install debug APK"
          echo "  ./gradlew clean           - Clean build"
          echo "  firebase serve            - Start Firebase emulators"
          echo "  firebase deploy           - Deploy to Firebase"
          echo "  adb devices               - List connected devices"
          echo ""
          echo "📁 Important directories:"
          echo "  Android SDK: $ANDROID_HOME"
          echo "  Gradle: $GRADLE_USER_HOME"
          echo "  Node modules: ./functions/node_modules"
          echo ""
          echo "🔗 Useful links:"
          echo "  Firebase Console: https://console.firebase.google.com"
          echo "  Chapa Dashboard: https://dashboard.chapa.co"
          echo "  Android Developer: https://developer.android.com"
          echo ""
        '';
      };
    };

    # Preview configurations for development servers
    previews = {
      enable = true;
      previews = {
        # Firebase hosting preview
        web = {
          command = ["firebase" "serve" "--only" "hosting" "--port" "$PORT"];
          manager = "web";
          env = {
            PORT = "$PORT";
            HOST = "0.0.0.0";
          };
        };
        
        # Firebase emulators
        firebase-emulators = {
          command = ["firebase" "emulators:start" "--only" "firestore,functions,auth" "--host" "0.0.0.0"];
          manager = "web";
          env = {
            PORT = "4000";
            HOST = "0.0.0.0";
          };
        };
        
        # Node.js development server (if needed)
        api = {
          command = ["npm" "run" "dev"];
          cwd = "functions";
          manager = "web";
          env = {
            PORT = "3000";
            NODE_ENV = "development";
          };
        };
      };
    };
  };

  # Services configuration (optional background services)
  services = {
    # PostgreSQL (if you need a local database for testing)
    # postgres = {
    #   enable = true;
    #   package = pkgs.postgresql_16;
    # };
    
    # Redis (for caching)
    # redis = {
    #   enable = true;
    #   package = pkgs.redis;
    # };
  };
}
