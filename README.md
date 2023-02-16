[DeeDee](https://github.com/dinobitsoft/deedee-flutter)\-flutter
================================================================

* * *

### To generate localization
* windows: <flutter_installation_dir>\bin\flutter gen-l10n
* linux: <flutter_installation_dir>/bin/flutter gen-l10n

### To generate injectable
* windows: <flutter_installation_dir>\bin\flutter flutter pub run build_runner build --delete-conflicting-outputs
* linux: <flutter_installation_dir>/bin/flutter flutter pub run build_runner build --delete-conflicting-outputs

### To run nobackend mode
![](doc/img/channel_type.png)

### To set the GPS on the emulator:

Go to the emulator settings, tab "Location"

![](doc/img/firstStep.png)

On the map in the emulator select a new point

![](doc/img/secondStep.png)

Save the data, press "SAVE POINT" then press "SET LOCATION"

![](doc/img/thirdStep.png)

* * *

flutter pub run build_runner build --delete-conflicting-outputs

### To generate navigation
When adding a new screen to a file "app_router.dart"

flutter pub run build_runner build --delete-conflicting-outputs