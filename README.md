# flutter_project_template
Flutter Project Template


# Convention
  - Follow https://dart.dev/guides/language/effective-dart/style
  # Naming 
    - File and folder:
      - Use slower sneak case (slower text with underscore)
      - suffix of Intent/ViewController is _page
    - assest:
      - small icon with prefix ic_
      - Image with prefix img_
      - large image to make background prefix with bg_
      
 Folder Structure:
 
 Code Sections and Order:
 
 import path:
 


# Flavor
current config DEV and PRODUCTION
to add new configure: ex: Staging
1. Add more option STAGING by open file flavor_config.dart, add option STAGING to enum Flavor
2. Add duplicate file main.dart and replace to main_stg.dart
3. Android:
  - In folder android/app
  - Open file build.gradle
  - in section productFlavors, add
    stg {
            deminsion "default"
            applicatoinIdSuffix ".stg"
        }
   - to build android Stuido, add more target and set launch to lib/main_stg.dart
   
4. iOS: 
  - In folder ios/flutter duplicate file Debug.xcconfig and replace to Stg.xcconfig
  - open file Stg.xcconfig, edit value for key FLUTTER_APP_NAME, and FLUTTER_TARGET=lib/main_stg.dart
  - using XCode open file Runner.xcworkspace
  - open section PROJECT / Runner, 
  - in section Configurations add two more item by duplicate the Debug 
  - rename to Debug-stg and Release-stg
  - add more scheme by duplicating Debug scheme and set name to "stg"
  - edit new scheme Stg, in Info section, set Build-Configuration to the proper Configurations created in step above
 5. VS Code: add to launch.json
 {
            "name": "stg",
            "request": "launch",
            "type": "dart",
            "program": "lib/main_stg.dart"
        }
