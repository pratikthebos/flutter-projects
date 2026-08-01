class LearningContent {

  static const validation =
      "Validation checks that the username and password are entered correctly before sending a request to the server.";

  static const api =
      "Flutter creates an HTTP POST request containing the username and password in JSON format.";

  static const backend =
      "The backend receives the request, validates the JSON, and prepares a database query.";

  static const database =
      "The database searches for the user and verifies the password securely.";

  static const jwt =
      "If authentication succeeds, the backend creates a JWT token that identifies the logged-in user.";

  static const response =
      "The backend returns HTTP 200 OK with JSON data containing the user and token.";

  static const json =
      "Flutter converts the JSON response into Dart model objects using fromJson().";

  static const storage =
      "The JWT token is stored locally so future API requests can authenticate without asking for the password again.";
}