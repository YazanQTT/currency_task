# Currency Converter Task

This Flutter app includes a Currency Converter feature that allows users to convert between different currencies. The implementation follows the task guidelines and best practices for clean architecture, TDD, and other considerations.

## Implementation

### 1. User Interface
The Currency Converter feature provides a user-friendly interface that allows users to:

- Convert amount between two currencies.
- View list of currencies.
- View historical exchange rates for two currencies [GBP_USD, EUR_USD].

### 2. Data Source

- Supported Currencies & Flags
  -- We initially fetch a list of supported currencies along with their respective flags using the free API from [flagcdn.com](https://flagcdn.com/) and [free.currencyconverterapi.com](https://free.currencyconverterapi.com/).
  -- This data is stored locally using the Sqflite database, reducing the need for frequent API calls.

- Exchange Rate Data
  -- Exchange rate data is obtained from the [free.currencyconverterapi.com](https://free.currencyconverterapi.com/) API.

- Historical Data
  -- Historical data is obtained from the [free.currencyconverterapi.com](https://free.currencyconverterapi.com/) API.

### 3. Design Pattern

This project adopts the Clean Architecture design pattern, coupled with Test-Driven Development (TDD) principles.

The Clean Architecture, with its structured layers (domain, data, presentation), promotes reusability and code maintainability. It also simplifies testing by allowing for unit testing of core business logic independently.


### 4.  Image Loading

The [CachedNetworkImage](https://pub.dev/packages/cached_network_image) package was used to efficiently load and cache images from remote sources.

### 5. Unit Tests
Unit tests have been implemented to verify the functionality of the application. Various scenarios have been tested to ensure that the application handles different situations effectively.

#### API Endpoint Testing

Each API endpoint has been tested for the following scenarios:

-   **Success**: API calls are tested to ensure that they return valid and expected data.
-   **Failure**: API calls are tested for cases where the request results in an error status, and the application handles these errors gracefully.
-   **Exception Handling**: Exception handling is tested to ensure that the application correctly manages unexpected errors, such as network issues or invalid responses.

#### Bloc Event Testing

Each bloc event is tested to verify that the application's business logic functions as expected. The following tests have been conducted for bloc events:

-   **Success**: Bloc events are tested to ensure that they lead to the expected successful outcomes.
-   **Failure**: Scenarios where bloc events result in errors or unsuccessful outcomes are tested.
-   **Exception Handling**: Exception handling within blocs is tested to guarantee that the application responds correctly to unexpected issues.

### 6. Dependency Injection
[get_it](https://pub.dev/packages/get_it) is utilized for dependency injection in this project. It provides a straightforward way to manage and access dependencies across the application, helping to keep the code clean and organized. GetIt simplifies the retrieval of services and objects while promoting good coding practices.

### 7. Database

[Sqflite](https://pub.dev/packages/sqflite) package was used to enable offline availability of currency data and efficient data access. Sqflite was selected for its reliability, speed, and cross-platform compatibility.

### 8. Material Design UI
The user interface of the Currency Converter feature is designed following Google's Material Design guidelines. Flutter's built-in Material Design components and widgets are utilized to create a visually appealing and user-friendly experience.



## Project Structure
This implementation adheres to clean architecture principles, separating business logic from presentation and data layers.

- **data**: Contains data-related components.
- **domain**: Holds the domain layer, which defines business logic and use cases.
- **presentation**: Contains the user interface components and interacts with the domain layer.
- **core**: Consists of shared utilities and constants.
-  **services**: Custom services for handling specific functionality.

    -   **NetworkService**: This service handles API calls and data fetching from external sources. It communicates with external APIs to retrieve exchange rate data.
    -   **SqfliteService**: Responsible for fetching and inserting data into the local database. It stores and retrieves supported currencies and their respective flags.
    -   **ConnectivityService**: This service is responsible for checking and monitoring the internet connection status. It helps the app determine whether it can make online requests to the external API.

## How to Build the Project

To build and run this project, follow these steps:

1. Clone the repository from the [GitHub](https://github.com/your-repo-link).
2. Open the project in your favorite Flutter development environment.
3. Ensure that the required dependencies are installed using `flutter pub get`.
4. run `flutter pub run build_runner build`
5. Run the project on your device or emulator.

## Dependencies
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [get_it](https://pub.dev/packages/get_it)
- [sqflite](https://pub.dev/packages/sqflite)
- [http](https://pub.dev/packages/http)
-  [equatable](https://pub.dev/packages/equatable)
-  [cached_network_image](https://pub.dev/packages/cached_network_image)
-  [mockito](https://pub.dev/packages/mockito)
-  [build_runner](https://pub.dev/packages/build_runner)
-  [bloc_test](https://pub.dev/packages/bloc_test)
-  [fl_chart](https://pub.dev/packages/fl_chart)
## Author
[Yazan Mohammed](https://github.com/your-profile-link)

## License
This project is open-source.