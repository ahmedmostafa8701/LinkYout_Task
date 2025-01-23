Todo App
Overview
This app provides a seamless task management experience with offline capabilities and synchronization with a remote API. It includes three primary screens:

Splash Screen
Login Screen
Todos Screen
Home screen
Features
Splash Screen: The app opens with a splash screen that loads until the stored user data is retrieved from the local database.
User Authentication:
If no user is found, the app navigates to the Login screen.
If a user is found, the app navigates directly to the Todos screen.
Todos Management:
Add, update, and delete todos locally.
Sync todos with the remote API when the network is restored.
Remote API data takes precedence. When synced, the app replaces the local todos with the latest data from the remote API and removes outdated entries.
Pagination: The home page in the application contain all the todos that exist in the server and loaded using pagination 20 todo at time
User Actions: 
Login and logout functionality for managing user sessions.
Key Functionalities
Offline Support: Enables full functionality without an internet connection.
Remote Sync: Ensures data consistency by synchronizing with the remote API after the internet connection is restored.

Conflict Resolution: The app prioritizes remote API data during synchronization to ensure users always have the most accurate and up-to-date information.

![image](https://github.com/user-attachments/assets/a1e638aa-f99a-4a66-8ede-1fc5a39cbb27)
![image](https://github.com/user-attachments/assets/a47e90e8-c2c6-42bc-8f46-e8e5accacd50)
![image](https://github.com/user-attachments/assets/13f84dd9-ab93-490d-91d6-ca0255684c56)


