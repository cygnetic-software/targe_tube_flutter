# TargeTube Mobile App

## Overview

This repository contains the codebase for the TargeTube Mobile App, built using Flutter. It includes versions for Android, iOS, and Web.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK: Make sure you have Flutter installed on your local machine. For more details, refer to the Flutter [install guide](https://flutter.dev/docs/get-started/install).
- Firebase: As the backend server and database for this application, Firebase needs to be set up. You can refer to the Firebase [documentation](https://firebase.google.com/docs/flutter/setup).

### Installation

1. **Clone the repository**

   ```
   git clone https://github.com/your-repo-link/targetube-app.git
   cd targetube-app
   ```

2. **Get the dependencies**

   ```
   flutter pub get
   ```

3. **Run the application**

   ```
   flutter run
   ```

## Application Structure

This app is structured as follows:

- `/lib`: This directory contains all Dart code for the application.
  - `/models`: This directory contains the data models used in the application.
  - `/views`: This directory contains all UI-related code (screens, widgets).
  - `/services`: This directory contains services code (API calls, Firebase services).
- `/assets`: This directory contains all the application assets like icons, logos, and backgrounds.

## Testing

Run tests using the following command:

## Deployment

To generate a deployable build for Android or iOS, use one of the following commands:

- Android:

  ```
  flutter build apk
  ```

- iOS:

  ```
  flutter build ios
  ```

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
