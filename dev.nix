{ pkgs, ... }: {

  # Using stable-24.05
  channel = "stable-24.05"; 

  packages = [
    pkgs.nodejs_20  # CHANGED: 24 -> 20 (Compatible with your channel)
    (pkgs.postgresql_15.withPackages (p: [ p.pgvector ]))
    pkgs.nodePackages.pnpm
    pkgs.jdk17      # CHANGED: 17 is often more stable for Android builds than 21
    pkgs.unzip
    pkgs.caddy
    pkgs.firebase-tools
  ];

  env = {
    FIREBASE_DATACONNECT_POSTGRESQL_STRING = "postgresql://user:mypassword@localhost:5432/dataconnect?sslmode=disable";
    # REMOVED: The PATH override line which was breaking the shell
    JAVA_HOME = "${pkgs.jdk17}"; # Matches the package above
  };

  services.postgres = {
    extensions = ["pgvector"];
    enable = true;
  };

  idx = {
    extensions = [
      "mtxr.sqltools"
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
      "mtxr.sqltools-driver-pg"
      "GraphQL.vscode-graphql-syntax"
      "GoogleCloudTools.firebase-dataconnect-vscode"
    ];

    workspace = {
      onCreate = {
        postgres = ''
          psql --dbname=postgres -c "ALTER USER \"user\" PASSWORD 'mypassword';"
          psql --dbname=postgres -c "CREATE DATABASE dataconnect;"
          psql --dbname=dataconnect -c "CREATE EXTENSION vector;"
        '';
      };
      onStart = {
        startProxy = ''
          caddy run
        '';
      };
    };

    previews = {
      enable = true;
      previews = {
        web = {
          command = ["flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT"];
          manager = "flutter";
        };
        android = {
          command = ["flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555"];
          manager = "flutter";
        };
      };
    };
  };
}