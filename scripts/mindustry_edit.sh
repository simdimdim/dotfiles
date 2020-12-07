	git checkout $(git describe --tags)
        sed -i 's/29.0.3/30.0.2/g' android/build.gradle
