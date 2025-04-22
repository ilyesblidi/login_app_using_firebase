plugins {
    id("com.android.application")  // Must come first
    id("kotlin-android")           // Must come after Android plugin
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.first_app_using_firebase"
    compileSdk = 34
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_21
        targetCompatibility = JavaVersion.VERSION_21
    }

    kotlinOptions {
        jvmTarget = "21"
        freeCompilerArgs = freeCompilerArgs + listOf(
            "-Xjdk-release=21",
            "-opt-in=kotlin.RequiresOptIn"
        )
    }

    defaultConfig {
        applicationId = "com.example.first_app_using_firebase"
        minSdk = 23  // Set explicitly for Firebase compatibility
        targetSdk = flutter.targetSdkVersion.toInt()
        versionCode = flutter.versionCode.toInt()
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.0.0"))
    implementation("com.google.firebase:firebase-analytics-ktx")
    implementation("com.google.firebase:firebase-auth-ktx")
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8:2.2.0-Beta1")
}