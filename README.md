# Perks Plus

Perks Plus is a multi-platform application built using Flutter for the frontend, Django for the backend, and PostgreSQL for the database. It aims to provide users with a platform to access various perks and benefits.


## The frontend of Perks Plus is developed using Flutter, a cross-platform UI toolkit. We build several pages. 


The API's available for 
- **Login Page**: Allows users to log in to their accounts.
- **Registration Page**: Allows new users to create an account.
- **OTP Verification Page**: Allows users to verify their phone number using OTP.

## Getting Started

Welcome to Perks Plus! This project utilizes Flutter for the frontend, Django for the backend, and PostgreSQL for the database. Below are some instructions to help you get started with the project:

### Frontend (Flutter)

The frontend of Perks Plus is developed using Flutter, a cross-platform UI toolkit. To get started with Flutter development, follow these steps:

1. Install Flutter by following the instructions in the [official documentation](https://flutter.dev/docs/get-started/install).
2. Clone the Perks Plus repository to your local machine.
3. Navigate to the `frontend` directory of the project.
4. Open the project in your preferred code editor.
5. Run `flutter pub get` to install dependencies.
6. Start your emulator or connect your device.
7. Run `flutter run` to launch the application.

### Backend (Django)

The backend of Perks Plus is built using Django, a high-level Python web framework. Here's how you can set up the backend:

1. Ensure you have Python installed on your system. You can download it from the [official website](https://www.python.org/downloads/).
2. Clone the Perks Plus repository to your local machine if you haven't already.
3. Navigate to the `backend` directory.
4. Create a virtual environment by running `python -m venv env`.
5. Activate the virtual environment. On Windows, run `env\Scripts\activate`, and on macOS/Linux, run `source env/bin/activate`.
6. Install Django and other dependencies by running `pip install -r requirements.txt`.
7. Set up your PostgreSQL database and update the database settings in `backend/perks_plus/settings.py`.
8. Run `python manage.py migrate` to apply migrations.
9. Start the Django development server by running `python manage.py runserver`.

### Database (PostgreSQL)

Perks Plus uses PostgreSQL as its database management system. Follow these steps to set up the database:

1. Install PostgreSQL on your system. You can download it from the [official website](https://www.postgresql.org/download/).
2. Create a new database for Perks Plus.
3. Update the database settings in `backend/perks_plus/settings.py` with your PostgreSQL database credentials.

### Additional Resources

- For Flutter development, check out the [Flutter documentation](https://flutter.dev/docs).
- For Django development, refer to the [Django documentation](https://docs.djangoproject.com/en/stable/).
- For PostgreSQL, explore the [official documentation](https://www.postgresql.org/docs/).


Happy coding!


