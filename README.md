# US Headlines app

A Flutter application for showing top latest US news regarding fan companies (Microsoft, Apple, Google and Tesla).

Actually it's a assignment for presenting my ability in developing mobile app via Flutter.

Its a best practice for developing a well-`clean architecture (feature-based)`, by utilizing `Get` as primary state-management.

## App Scenario
- 1 >>> Splash Screen (2 seconds loading)

- 2 >>> News Screen
    ```bash
    If internet access == true

    fetch latest news from > `https://newsapi.org/v2/everything?q=microsoft&from=???&to=???&sortBy=???%20&page=1&pageSize=20&apiKey=YOUR_API_KEY`

    else

    show latest cached news
    ```
- 3 >>> News Details Screen (it shows the complete article regarding the news)

### Dependencies & Versions
```yaml
sdk: '>=3.4.0 <4.0.0'

get: ^4.6.6
loader_overlay: ^4.0.0
http: ^1.2.1
dartz: ^0.10.1
intl: ^0.19.0
url_launcher: ^6.3.0
get_storage: ^2.1.1
cached_network_image: ^3.3.1
internet_connection_checker_plus: ^2.3.0
```

## Refrences & Links
for using the app you have to get your own API key via [News API website](https://newsapi.org/account)

### Build & Start
```bash
STEP 1
clone the project on your machine
```

```bash
STEP 2
flutter pub get
```

```bash
STEP 3
flutter run
```

### Build Android version
```bash
flutter build apk
```

## How to develop
### making new feature (screen)
```
- lib
--- features
----- new_feature_name
------- presentation
--------- controller
----------- new_feature_name_controller.dart
--------- binding
----------- new_feature_name_binding.dart
--------- new_feature_name_screen.dart
------- data
--------- new_feature_name_repo.dart
------- domain
--------- new_feature_name_repo folder
----------- new_feature_name_repo_impl.dart
```

Now inside the `core` folder which you can find it in `root`, go to the `constants` sub folder, then go to the `app_routes.dart` file and make your own new_feature `path` and `page`.

```
Hot Restart the app
```

## Tests
In order to test our logics go to the `test` sub folder, then execute this command in Terminal.

```
flutter test test.dart
```

### Contact Me
If you have any question please feel free to contact me via [email](mailto:sina.moradbakhti@gmail.com)