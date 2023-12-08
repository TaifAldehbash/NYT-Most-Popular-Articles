# NYT Most Popular Articles

This simple application shows the most popular New York Times articles for the past week.
It utilizes the New York Times APIs.

# To Run The Application

Run the following command in the terminal `flutter run --dart-define API_KEY=[YOUR_KEY]`

# To Run Unit Tests

Run the following command in the terminal `flutter test`

# To Generate Coverage Reports

Run the following commands in the terminal:
- Generate `coverage/lcov.info` file `flutter test –coverage`

- Generate HTML report `genhtml coverage/lcov.info -o coverage/html`
  Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:

- Open the report `open coverage/html/index.html`
