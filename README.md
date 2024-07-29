# User App

This Flutter application allows users to submit their details, including name, email, and expected salary. The app validates the input fields and communicates with a separate Node.js backend server to handle database operations and email notifications.

## Features

- **User Input**: Allows users to input their name, email, and expected salary.
- **Validation**: Validates input fields for completeness and correctness.
- **Backend Integration**: Communicates with a Node.js backend service for database operations and email notifications.
- **Email Notifications**: Sends an approval email if the salary is less than 10 lakh; otherwise, it waits for admin approval.
- **Admin App**: A separate admin application to manage requests, including approval or rejection, with corresponding email notifications.

## Architecture

1. **Flutter App**: Handles user input, validation, and communicates with the backend service via HTTP requests.
2. **Node.js Backend Server**: Manages database operations and email notifications.

## Prerequisites

- **Flutter**: Ensure you have Flutter installed on your machine.
- **Node.js Backend Server**: A separate Node.js backend server that handles database operations and email notifications.
- **MySQL Database**: A MySQL server to store user data.
- **Amazon SES**: Amazon Simple Email Service for sending emails.

## Setup

### 1. Clone the Repository

```sh
git clone https://github.com/cp-coder1269/user_app.git
cd user_app
```

### 2. Run the Flutter App

1. **Install Dependencies**:

   ```sh
   flutter pub get
   ```

2. **Run the App**:

   ```sh
   flutter run
   ```

## Usage

### User Flow

1. **Enter Details**: Users enter their name, email, and expected salary.
2. **Validation**: The app validates the input fields.
3. **Submit**: Upon successful validation, the app sends a request to the Node.js backend server to insert user details into the MySQL database.
4. **Email Notification**: 
   - If the expected salary is less than 10 lakh, the backend sends an approval email immediately.
   - If the expected salary is 10 lakh or more, the backend sets the request status to 'pending' and the user receives a notification that the request is under review.

## Demonstrative Video

Watch a [demonstrative video](https://drive.google.com/file/d/1Gw1lmTPa-ulLNhDXvaelCUJnOo5vojem/view?usp=share_link) to see the app in action.

## Troubleshooting

- **Backend Communication Issues**: Ensure that the Node.js backend server is running and accessible from the Flutter app.
- **Database Connection Issues**: Verify that the MySQL server is running and properly configured.
- **Email Sending Issues**: Check your Amazon SES configuration in the Node.js backend server.

##Contact
If you encounter any issues or have questions, please email me at cppal474@gmail.com.

