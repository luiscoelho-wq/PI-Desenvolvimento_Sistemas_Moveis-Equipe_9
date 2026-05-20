plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // Este plugin lê o seu google-services.json
}

android {
    namespace = "com.example.pi2" // Deve ser igual ao package_name do seu JSON
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.pi2"
        minSdk = flutter.minSdkVersion
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}