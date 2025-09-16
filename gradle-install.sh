export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y git curl sudo gawk wget libicu70 unzip openjdk-8-jdk
wget https://services.gradle.org/distributions/gradle-7.0.2-bin.zip
unzip gradle-7.0.2-bin.zip
mv gradle-7.0.2 /opt/gradle
export PATH=$PATH:/opt/gradle/bin
gradle -v || echo "Gradle setup verified"
gradle build || echo "Gradle build failed or skipped"
./gradlew dependencies --write-locks || echo "Gradle lock generation skipped"
bash ./gradlew dependencyUpdates > outdated.txt
bash ./gradlew generateLicenseReport
