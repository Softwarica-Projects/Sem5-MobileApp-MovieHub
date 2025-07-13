# 🎬 Movie Hub
## Rishan Shrestha - 34-B

**Movie Hub** is a mobile application built with **Flutter** that allows users to explore, rate, and manage their favorite movies. The app offers a curated collection of movies, including:

- 📃 **Movie List**: Browse a wide range of movies.
- ⭐ **Favourites**: Save movies to your personal favourites list.
- 🎯 **Rate Movies**: Share your opinion by rating movies.
- 🔥 **Popular Movies**: Discover what's popular in the world of cinema.
- 🆕 **Recently Added Movies**: Stay up-to-date with the latest releases.
- 🎥 **Featured Movies**: Explore movies that stand out.

## 🚀 Tech Stack

- **Flutter**: The primary framework for building the application.
- **Dart**: The programming language used for Flutter.
- **State Management**: BLOC
- **Service Locator**: getIt
- **Font**: Aeonik
- **Clean Architecture**
- **Repository Pattern**

# Sprint Overview

## Sprint 1 Features

### 1. Splash Screen
A splash screen welcomes users when the app launches, providing a smooth and branded introduction before accessing the main content.

### 2. Login (Prototype)
The login screen is implemented as a prototype with static data. Users can interact with the UI, but authentication is not connected to a backend or database in this sprint.

### 3. Register (Prototype)
The registration screen is also a prototype using static data. New user registration is simulated for demonstration purposes only.

### 4. Dashboard (Prototype)
The dashboard provides a static prototype layout, showcasing the intended navigation and UI design without dynamic or real data integration.

## Sprint 2 Features

### 1. Font and Themes
Custom fonts and theme have been integrated into the app, enhancing the overall look and feel. Users experience a visually appealing interface with consistent typography and color schemes.

### 2. Dashboard with Bottom Navigation or Navigation Drawer
A dashboard screen has been implemented, providing easy access to core features. Users can navigate through the app using a bottom navigation bar or a navigation drawer, improving usability and accessibility.

### 3. UI Design for Dashboard
The dashboard UI has been designed for clarity and user engagement, featuring intuitive layouts and visually distinct sections for different functionalities.

## Sprint 3 Features

### 1. Login
The app now supports user authentication through a login screen. Users can enter their credentials, which are validated against records stored locally using the Hive database. This ensures secure and efficient access to the app.

### 2. Signup
A signup feature has been added, allowing new users to register by providing their details. The information is securely saved in the Hive database, enabling persistent and offline-capable user management.

### Hive Database Integration
Both login and signup functionalities utilize the Hive database for local data storage. Hive provides a lightweight, fast, and reliable solution for managing user data within the app, supporting offline access and quick authentication.

## Sprint 4 Features

### 1. API Integration for Authentication
Login and register functionality are integrating with backend APIs. The authentication system now supports credential validation and user registration through secure API endpoints.

### 2. Dashboard API Implementation
Implemented comprehensive API integration for all dashboard features:
- **Featured Movies**: Fetching of movie which are marked as featured
- **Popular Movies**: Movies with high ratings
- **Recently Added Movies**: List of movies that are added recently
- **Genres**: Genre list with updated categories


## Sprint 5 Features

### 1. Movie Details
User can see detailed information of a movie along with trailer link and cast 

### 2.Review
User can view and give your own review to the movie

### 3. Test Cases
Viewmodel, View and UseCase test to make sure nothing is broken when we change their functionality
