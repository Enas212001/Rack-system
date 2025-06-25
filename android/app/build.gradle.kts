import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.powetSMTP.rack_manager"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.powetSMTP.rack_manager"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
    create("release") {
        val keyAliasValue = requireNotNull(keystoreProperties["keyAlias"]) { "Missing keyAlias in key.properties" }
        val keyPasswordValue = requireNotNull(keystoreProperties["keyPassword"]) { "Missing keyPassword in key.properties" }
        val storePasswordValue = requireNotNull(keystoreProperties["storePassword"]) { "Missing storePassword in key.properties" }
        val storeFileValue = requireNotNull(keystoreProperties["storeFile"]) { "Missing storeFile in key.properties" }

        keyAlias = keyAliasValue as String
        keyPassword = keyPasswordValue as String
        storePassword = storePasswordValue as String
        storeFile = file(storeFileValue as String)
        }
    }


    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro")
        }
    }
}

flutter {
    source = "../.."
}
