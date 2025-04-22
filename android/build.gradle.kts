buildscript {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.4.0") // Requires AGP 8.4+ for Kotlin 2.2
        classpath("org.jetbrains.kotlin.android:org.jetbrains.kotlin.android.gradle.plugin:2.2.0-Beta1")
        //classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version")
        classpath("com.google.gms:google-services:4.4.1")
    }
}

apply(plugin = "org.jetbrains.kotlin.android")

// Add to android/build.gradle.kts
allprojects {
    configurations.all {
        resolutionStrategy {
            failOnVersionConflict()
            force(
                "org.jetbrains.kotlin:kotlin-stdlib:2.2.0-Beta1",
                "org.jetbrains.kotlin:kotlin-stdlib-common:2.2.0-Beta1",
                "org.jetbrains.kotlin:kotlin-stdlib-jdk8:2.2.0-Beta1"
            )
        }
    }
}

// Your existing build directory configuration
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}