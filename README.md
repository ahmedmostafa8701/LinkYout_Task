Todo App
Overview
This app provides a seamless task management experience with offline capabilities and synchronization with a remote API. It includes three primary screens:

Splash Screen
Login Screen
Todos Screen
Features
Splash Screen: The app opens with a splash screen that loads until the stored user data is retrieved from the local database.
User Authentication:
If no user is found, the app navigates to the Login screen.
If a user is found, the app navigates directly to the Todos screen.
Todos Management:
Add, update, and delete todos locally.
Sync todos with the remote API when the network is restored.
Remote API data takes precedence. When synced, the app replaces the local todos with the latest data from the remote API and removes outdated entries.
User Actions:
Login and logout functionality for managing user sessions.
Key Functionalities
Offline Support: Enables full functionality without an internet connection.
Remote Sync: Ensures data consistency by synchronizing with the remote API after the internet connection is restored.
Conflict Resolution: The app prioritizes remote API data during synchronization to ensure users always have the most accurate and up-to-date information.

![image](https://github.com/user-attachments/assets/350664a6-f0d4-4f43-bc1c-2a52ea0cf975)
![image](https://github.com/user-attachments/assets/a1e638aa-f99a-4a66-8ede-1fc5a39cbb27)
![image](https://github.com/user-attachments/assets/7bd86090-c6ea-450c-83ac-4cdb26bcb9ae)
