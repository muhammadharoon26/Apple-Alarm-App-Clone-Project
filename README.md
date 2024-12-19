# Apple Clock Clone

A Flutter project that recreates the iOS Clock app with its four main features: World Clock, Alarm, Stopwatch, and Timer. This project demonstrates advanced UI implementation and state management in Flutter.

## Project Overview

This application is a faithful recreation of Apple's Clock app, featuring the same dark theme, animations, and functionality. The project showcases complex UI implementations, state management, and time-related features in Flutter.

## Features

### World Clock
- Real-time updating clock display for different cities
- Time zone offset calculations
- Scrollable list of world cities
- Today/Tomorrow indicators with time differences

### Alarm
- Sleep/Wake up schedule
- Multiple alarm support
- Toggle switches for each alarm
- AM/PM time format display

### Stopwatch
- Start/Stop functionality
- Lap time recording
- Reset capability
- Millisecond precision
- Lap time list with scroll view

### Timer
- Hours/Minutes/Seconds wheel picker
- Start/Cancel controls
- Recent timers list
- Custom labels for timers
- Sound selection for timer completion

## Tools and Technologies Used

- Flutter SDK
- Dart programming language
- Material Design components
- Custom Flutter widgets
- intl package for date/time formatting
- font_awesome_flutter for icons

## Code Structure

The project follows a feature-based architecture where each main feature is separated into its own file:

```
lib/
├── models/                # Data models and business logic
├── viewmodels/           # ViewModels for state management
├── views/                # UI components
│   └── widgets/          # Reusable widgets
│       ├── alarm.dart
│       ├── app_header.dart
│       ├── stopwatch.dart
│       ├── timer.dart
│       ├── world_clock.dart
│       └── world_clock_test.dart
└── main.dart             # App entry point and navigation

```

### Design Pattern
The project implements a pattern of Model View View Model

Each feature is encapsulated in its own stateful widget, maintaining its state independently while sharing common UI elements through composition.

## Screenshots

![World Clock Screen](/screenshots/world_clock.png)
*World Clock screen showing different time zones*

![Alarm Screen](/screenshots/alarm.png)
*Alarm screen with multiple alarms and toggle switches*

![Stopwatch Screen](/screenshots/stopwatch.png)
*Stopwatch screen with lap times*

![Timer Screen](/screenshots/timer.png)
*Timer screen with wheel picker*

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/yourusername/apple_clock_clone.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Requirements
- Flutter SDK 3.0 or higher
- Dart SDK 2.17 or higher
- iOS 11+ / Android 5.0+

## Video Demo
[Watch the demo video](https://youtu.be/your-video-link)

## Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## License
This project is licensed under the MIT License - see the LICENSE file for details.