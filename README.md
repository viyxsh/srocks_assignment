## S.Rocks.Music Assignment - Project Overview

This Flutter application is an assignment for S.Rocks.Music. It is a single screen interface to browse music services, featuring a clean and responsive UI/UX design with a navigation bar, search functionality, and service listings.

## Demo


https://github.com/user-attachments/assets/12b987b4-3902-485b-b80d-058bbab452dc



## Architecture

The project follows a MVVM architecture pattern with the following structure:

```
lib/
├── models/             # Data models
├── repository/         # Repository for data abstraction
├── services/           # External services
├── utils/              # Utility functions and constants
│   ├── constants/      # Application constants
│   └── di/             # Dependency injection setup
├── view/               # UI-related components
│   ├── screens/        # Application screens
│   └── widgets/        # Reusable UI components
├── viewmodel/          # View models for state management
└── main.dart           # Application entry point
```

### Key Components

- **Models**: Defines the data structure for music services (`service_model.dart`).
- **Services**: Manages external integrations, such as Firestore for fetching music service data (`firestore_service.dart`).
- **View**: Contains UI screens (`home_screen.dart`, `details_screen.dart`) and reusable widgets (`custom_search_bar.dart`, `nav_bar.dart`, etc.).
- **ViewModel**: Handles state and business logic for the UI (`home_viewmodel.dart`).
- **Widgets**: Reusable UI components to ensure a consistent design across the app.
- **DI (Dependency Injection)**: Uses `app_provider.dart` for dependency injection to manage service instances.

## Objective

This project evaluates the ability to:
- Build a responsive UI in Flutter based on the provided Figma design.
- Integrate Firebase Firestore for read-only data fetching.
- Manage state effectively using Provider.
- Follow the MVVM architecture with clear separation of concerns.
- Handle navigation and asynchronous data loading.

### Functional Requirements
1. **Firebase Integration**:
   - Service data (title, description, icon path) is stored in Firebase Firestore.
   - The app fetches this data dynamically and displays it as cards on the home screen.
   - Demonstrates the ability to connect to Firestore, handle asynchronous data, and update the UI accordingly.

2. **Tap Action**:
   - Tapping a service card (e.g., "Music Production") navigates to a details screen (`details_screen.dart`).
   - The details screen displays a simple message like: “You tapped on News”.

3. **State Management**:
   - Uses Provider for state management, ensuring reactive UI updates when data is fetched or changed.

## Dependencies

The project relies on the following key dependencies with their specific versions:
- **firebase_core**: For Firebase initialization.
- **cloud_firestore**: For Firestore data fetching.
- **google_fonts**: For custom typography as per the Figma design.
- **flutter_svg**: For rendering SVG icons.
- **provider**: For state management.
- **get_it**: For dependency injection.

## Setup and Installation

1. Clone the repository:
```bash
git clone https://github.com/viyxsh/srocks_assignment.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Add your Firebase configuration files
   - Enable necessary Firebase services (Authentication, Firestore, Storage)

4. Run the application:
```bash
flutter run
```
