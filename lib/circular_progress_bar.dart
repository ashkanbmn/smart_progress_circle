import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CircularProgressBar extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double initialValue;
  final Widget icon;
  final String calculationCriteria;
  final double size;

  // New customizable parameters
  final Color? backgroundColor;
  final Color? progressColor;
  final Color? markColor;
  final Color? borderColor;
  final Color? dialogBackgroundColor;
  final Color? dialogTextColor;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Color? cancelButtonColor;
  final Color? cancelButtonTextColor;

  const CircularProgressBar({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.icon,
    required this.calculationCriteria,
    this.size = 250.0, // Default size
    this.backgroundColor,
    this.progressColor,
    this.markColor,
    this.borderColor,
    this.dialogBackgroundColor,
    this.dialogTextColor,
    this.buttonColor,
    this.buttonTextColor,
    this.cancelButtonColor,
    this.cancelButtonTextColor,
  }) : super(key: key);

  @override
  _CircularProgressBarState createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> {
  late double currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue.clamp(widget.minValue, widget.maxValue);
  }

  double _getProgressPercentage(double value) {
    return ((value - widget.minValue) / (widget.maxValue - widget.minValue)) * 100;
  }

  void _updateValue(Offset position, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;
    double angle = atan2(dy, dx); // Radians, range [-pi, pi]

    // Shift angle so that 0 is at the top
    double angleFromTop = angle + (pi / 2);
    if (angleFromTop < 0) {
      angleFromTop += 2 * pi;
    }

    // Normalize angle to [0, 1]
    double progress = angleFromTop / (2 * pi);
    progress = progress.clamp(0.0, 1.0);

    // Map progress to value
    double value = widget.minValue + progress * (widget.maxValue - widget.minValue);
    value = value.clamp(widget.minValue, widget.maxValue);

    setState(() {
      currentValue = value;
    });
  }

  void _showInputDialog() {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: widget.dialogBackgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          title: Center(
            child: Text(
              'Enter new value',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: widget.dialogTextColor ?? Colors.black),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter a number",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
              child: MaterialButton(
                child: Text('OK', style: TextStyle(color: widget.buttonTextColor ?? Colors.white)),
                minWidth: MediaQuery.of(context).size.width * .75,
                color: widget.buttonColor ?? Colors.red,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                height: 55,
                onPressed: () {
                  double? newValue = double.tryParse(controller.text);
                  if (newValue != null) {
                    setState(() {
                      currentValue = newValue.clamp(widget.minValue, widget.maxValue);
                    });
                  }
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * .75,
                color: widget.cancelButtonColor ?? Colors.white,
                textColor: widget.cancelButtonTextColor ?? Colors.red,
                height: 55,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    double progressPercentage = _getProgressPercentage(currentValue);

    return GestureDetector(
      onPanStart: (details) {
        _updateValue(details.localPosition, Size(widget.size, widget.size));
      },
      onPanUpdate: (details) {
        _updateValue(details.localPosition, Size(widget.size, widget.size));
      },
      onTap: _showInputDialog, // Show dialog on tap
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: CirclePainter(
              progressPercentage,
              widget.maxValue,
              isDarkMode,
              currentValue,
              widget.minValue,
              backgroundColor: widget.backgroundColor,
              progressColor: widget.progressColor,
              markColor: widget.markColor,
              borderColor: widget.borderColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon,
              Text(
                "${currentValue.toStringAsFixed(1)}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.red.shade800,
                ),
              ),
              Text(
                widget.calculationCriteria,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double percentage;
  final double maxValue;
  final bool isDarkMode;
  final double currentValue;
  final double minValue;
  final Color? backgroundColor;
  final Color? progressColor;
  final Color? markColor;
  final Color? borderColor;

  CirclePainter(
      this.percentage,
      this.maxValue,
      this.isDarkMode,
      this.currentValue,
      this.minValue, {
        this.backgroundColor,
        this.progressColor,
        this.markColor,
        this.borderColor,
      });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor ?? (isDarkMode ? Colors.black12 : Colors.white)
      ..style = PaintingStyle.fill;

    final Paint progressPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          progressColor ?? Colors.red.shade600,
          progressColor ?? Colors.red.shade100,
        ],
      ).createShader(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2))
      ..style = PaintingStyle.stroke // Change to stroke
      ..strokeWidth = 24;

    final Paint markPaint = Paint()
      ..color = markColor ?? (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300)
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = borderColor ?? (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 24;

    final double radius = size.width / 2;

    // Draw background
    canvas.drawCircle(Offset(radius, radius), radius, backgroundPaint);

    // Draw border
    canvas.drawCircle(Offset(radius, radius), radius, borderPaint);

    // Draw progress arc
    double sweepAngle = (percentage / 100) * 2 * pi;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );

    // Draw marks
    int numberOfMarks = (maxValue - minValue).round();
    double markRadius = 3;
    double margin = 24;
    for (int i = 0; i <= numberOfMarks; i++) {
      double angle = -pi / 2 + (i / numberOfMarks) * 2 * pi;
      double markX = radius + (radius - margin) * cos(angle);
      double markY = radius + (radius - margin) * sin(angle);

      canvas.drawCircle(Offset(markX, markY), markRadius, markPaint);
    }

    // Calculate the position of the moving circle based on the current value
    double movingCircleAngle = -pi / 2 + (percentage / 100) * 2 * pi;
    double movingCircleX = radius + radius * cos(movingCircleAngle);
    double movingCircleY = radius + radius * sin(movingCircleAngle);

    final Paint movingCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // Optional: Add a border around the moving circle for better visibility
    final Paint movingCircleBorderPaint = Paint()
      ..color = Colors.red.shade600
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw moving circle with border
    canvas.drawCircle(Offset(movingCircleX, movingCircleY), 12, movingCircleBorderPaint);
    canvas.drawCircle(Offset(movingCircleX, movingCircleY), 10, movingCirclePaint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.percentage != percentage ||
        oldDelegate.maxValue != maxValue ||
        oldDelegate.currentValue != currentValue ||
        oldDelegate.minValue != minValue ||
        oldDelegate.isDarkMode != isDarkMode ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.markColor != markColor ||
        oldDelegate.borderColor != borderColor;
  }
}

class HexColors extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // Add alpha if not provided
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColors(final String hexColor) : super(_getColorFromHex(hexColor));
}