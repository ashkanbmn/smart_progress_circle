# Circular Progress Bar Flutter Plugin

## Overview

The Circular Progress Bar Flutter Plugin is a customizable widget that displays a circular progress indicator with interactive features. Users can drag to adjust the value, tap to enter a new value, and customize various aspects of the widget, including colors, sizes, and styles. This plugin is ideal for applications that require a visual representation of progress or completion metrics.

## Features

- **Customizable Parameters**: Define colors for the background, progress, marks, borders, and buttons.
- **Interactive Value Adjustment**: Users can adjust the progress by dragging around the circular indicator.
- **Input Dialog**: Tap the progress bar to open a dialog for manual value input.
- **Responsive Design**: Automatically adjusts to different screen sizes and orientations.
- **Default Styling**: Comes with sensible defaults that can be easily overridden.


![Screenshot 2024-10-23 173828](https://github.com/user-attachments/assets/341e69d5-2999-4402-8a56-d13541b76a1c)


## Installation

To use the Circular Progress Bar plugin in your Flutter project, follow these steps:

1. Add the dependency to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     circular_progress_bar: ^1.0.0 # Replace with the latest version
   ```

2. Run the following command to install the package:

   ```bash
   flutter pub get
   ```

## Usage

To use the `CircularProgressBar` widget in your Flutter application, import the package and create an instance of the widget with your desired parameters.

### Example

```dart
import 'package:flutter/material.dart';
import 'package:circular_progress_bar/circular_progress_bar.dart'; // Adjust the import according to your package structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Circular Progress Bar Example')),
        body: Center(
          child: CircularProgressBar(
            minValue: 0,
            maxValue: 100,
            initialValue: 50,
            icon: Icon(Icons.check, size: 50),
            calculationCriteria: 'Progress',
            backgroundColor: Colors.blueGrey,
            progressColor: Colors.green,
            markColor: Colors.orange,
            borderColor: Colors.black,
            dialogBackgroundColor: Colors.white,
            dialogTextColor: Colors.black,
            buttonColor: Colors.green,
            buttonTextColor: Colors.white,
            cancelButtonColor: Colors.red,
            cancelButtonTextColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
```

### Parameters

| Parameter                     | Type                | Description                                                                                       |
|-------------------------------|---------------------|---------------------------------------------------------------------------------------------------|
| `minValue`                   | `double`            | The minimum value of the progress bar.                                                           |
| `maxValue`                   | `double`            | The maximum value of the progress bar.                                                           |
| `initialValue`               | `double`            | The initial value displayed on the progress bar.                                                 |
| `icon`                       | `Widget`            | An icon widget displayed at the center of the progress bar.                                      |
| `calculationCriteria`        | `String`            | A string that describes what the progress bar represents.                                        |
| `size`                       | `double` (optional) | The size of the circular progress bar. Defaults to `250.0`.                                      |
| `backgroundColor`            | `Color` (optional)  | The background color of the progress bar. Defaults to light or dark theme color.                 |
| `progressColor`              | `Color` (optional)  | The color of the progress arc. Defaults to a gradient of red.                                    |
| `markColor`                  | `Color` (optional)  | The color of the marks around the progress bar. Defaults to light grey.                          |
| `borderColor`                | `Color` (optional)  | The color of the border of the progress bar. Defaults to light or dark theme color.              |
| `dialogBackgroundColor`      | `Color` (optional)  | The background color of the input dialog. Defaults to the scaffold background color.              |
| `dialogTextColor`            | `Color` (optional)  | The text color in the input dialog. Defaults to black.                                           |
| `buttonColor`                | `Color` (optional)  | The color of the OK button in the dialog. Defaults to red.                                       |
| `buttonTextColor`            | `Color` (optional)  | The text color of the OK button. Defaults to white.                                             |
| `cancelButtonColor`          | `Color` (optional)  | The color of the Cancel button in the dialog. Defaults to white.                                 |
| `cancelButtonTextColor`      | `Color` (optional)  | The text color of the Cancel button. Defaults to red.                                           |

## Customization

You can customize the `CircularProgressBar` by providing your own colors and sizes. If any parameter is not provided, the widget will use its default values.

## Contribution

If you would like to contribute to this plugin, please feel free to submit a pull request or open an issue on the repository. Contributions, suggestions, and feedback are always welcome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Support

For any questions or support, please open an issue in the repository or contact the author.

---

This README provides a comprehensive overview of the Circular Progress Bar Flutter Plugin, including installation instructions, usage examples, and customization options. Adjust the version number and import paths as necessary for your project structure.
