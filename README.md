# 🎬 Movies App  

## 📌 Overview  

This project is a **movie listing app** that fetches and displays **popular movies** from [The Movie Database (TMDb) API](https://developer.themoviedb.org/). The application allows users to **browse through a list of trending movies** and **view detailed information** about each movie by clicking on it.  

### 🔹 Features  
- **Popular Movies**: Fetches and displays the most popular movies from TMDb.  
- **Movie Details**: Clicking on a movie provides detailed information such as the title, description, release date, rating, and more.  
- **Secure Authentication**: Implements **JWT (JSON Web Token) authentication** to protect endpoints and manage user sessions securely.  
- **User-Friendly Interface**: Designed for a smooth and intuitive user experience.  

---

## 🏛 Architecture  

This project follows the **Clean Architecture** principle, ensuring a modular, scalable, and maintainable codebase. The app is structured into **three main layers**:  

### **1️⃣ Presentation Layer (UI)**
- Contains widgets and UI-related logic.  
- Uses `Provider`, `Cubit` solution for handling state.  

### **2️⃣ Domain Layer (Business Logic)**
- Defines **use cases** and **entities** (business models).  
- Acts as a bridge between **data** and **presentation** layers.  

### **3️⃣ Data Layer (Repository & API)**
- Manages **data sources** (remote APIs, local databases).  
- Implements **repositories** that provide data to the domain layer.  

### 🔹 Core Module  
- **Handles shared logic** such as dependency injection, error handling, utilities, and HTTP requests.  
- Ensures code reuse and maintains separation of concerns.  

---

## 📂 Project Structure  

```bash
MOVIES/
│── android/               # Android-specific code
│── build/                 # Build files
│── ios/                   # iOS-specific code
│── lib/                   # Main application source code
│   ├── src/              
│   │   ├── core/          # Shared core functionalities
│   │   │   ├── common/    # Shared utilities and configurations
│   │   │   ├── di/        # Dependency Injection (e.g., GetIt)
│   │   │   ├── error/     # Error handling classes
│   │   │   ├── http/      # API client setup and HTTP requests
│   │   │   ├── utils/     # Utility functions and helpers
│   │   │
│   │   ├── features/movies/  # Feature-based module for movies
│   │   │   ├── data/      # Data layer (models, repositories, API calls)
│   │   │   ├── domain/    # Domain layer (use cases, business logic)
│   │   │   ├── presentation/ # UI and state management
│   │   │
│   │   ├── app.dart       # App initialization
│   │   ├── main.dart      # Entry point of the application
│
│── test/                  # Unit and widget tests
│── web/                   # Web-specific configurations
│── .env                   # Environment variables
```

## 🚀 How to Run the Project  

Follow these steps to set up and run the application locally:

### Clone the Repository  

```bash
git clone https://github.com/ICCanche/movies.git

cd movies-app
```

### Install the dependencies 

```bash
flutter pub get
```


### Setup environment variables 

- Create a .env file in the root directory.
- Add your TMDB API Token inside the .env file:

```bash
TMDB_TOKEN=your_api_token_here
```

You can use this token for running the project

```bash
eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDlkNDc0YWJhMzI2YWFhNWIwOWM2Y2ExMDQ0Y2UzYSIsIm5iZiI6MTcwODU2MjQ4MS43NDcsInN1YiI6IjY1ZDY5ODMxOTk3NGVlMDE3YjA1YmUzZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.stLcnGAMZCuRGf2YthvV2vpHSobUPTcO9vcZZcW5gAE
```

### Run the app

The app can run only in Android, iOS or web

```bash
flutter run
```

### Run the tests

```bash
flutter test
```

## 🚀 Areas for Improvement  

The project can be further improved by implementing the following features and enhancements:

### 🔹 Test Coverage  
- Increase **unit and widget test coverage** to ensure reliability and maintainability.  
- Implement **integration tests** for critical workflows.  

### 🔹 Search & Filtering  
- Add a **search feature** to allow users to find movies by title.  
- Implement **filters** (e.g., genre, rating, release year) for better discoverability.  

### 🔹 Offline Support  
- Implement **caching** to allow users to view previously loaded movies without an internet connection.  
- Use **Hive or SharedPreferences** to store user preferences and recently viewed movies.  

### 🔹 Dark Mode  
- Add a **dark mode toggle** to enhance user experience for different lighting conditions.  

### 🔹 Watchlist Feature  
- Allow users to **save** movies to a **watchlist** for future viewing.  
- Store watchlist data locally or sync with a backend.  
