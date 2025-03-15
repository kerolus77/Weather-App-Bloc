# Weather App

A Flutter-based weather application that fetches weather data based on the city name. This app follows the MVVM architecture with clean code principles and uses the BLoC pattern, including debounce logic for search functionality.

## Features
- Search weather by city name with debounce logic.
- Display current weather details.
- Beautiful UI with smooth animations.
- Cached images for better performance.
- Clean architecture (MVVM) with domain-driven design.

## Architecture
The project follows the MVVM (Model-View-ViewModel) architecture with clean code principles. The structure is as follows:

```
lib/
│── core/
│   ├── config
│   ├── data
│   ├── helpers
│   ├── presentation
│   ├── services
│   ├── themes
│   ├── utils
│
│── features/
│   ├── home/
│   │   ├── splash/presentation/view
│   │   ├── weather_details
│
│── observers/
│── main.dart
│── weather_app.dart
```

## Packages Used
This app leverages several powerful packages:
```yaml
  dio: ^5.8.0+1
  flutter_screenutil: ^5.9.3
  pretty_dio_logger: ^1.4.0
  nb_utils: ^7.1.3
  flutter_bloc: ^9.1.0
  flutter_animate: ^4.5.2
  get_it: ^8.0.3
  flutter_svg: ^2.0.17
  cached_network_image: ^3.4.1
  shimmer: ^3.0.0
  dartz: ^0.10.1
  equatable: ^2.0.7
  intl: ^0.20.2
  stream_transform: ^2.1.1
```

## Installation
1. Clone the repository:
   ```sh
   https://github.com/kerolus77/Weather-App-Bloc.git
   ```
2. Navigate to the project directory:
   ```sh
   cd Weather-App-Bloc
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Demo Video
[Watch the demo](#)

## Download APK
[Download APK](https://drive.google.com/file/d/1twzblN6LaTEYpsW-o0DwTlOESSYCvuzy/view?usp=sharing)

## Contributions
Contributions are welcome! Feel free to fork the repository and submit a pull request.

## License
This project is open-source and available under the [MIT License](LICENSE).

