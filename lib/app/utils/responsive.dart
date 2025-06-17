import 'package:lol_app/domain/models/breakpoint.dart';

class ResponsiveUtils {
  static const List<BreakpointConfig> breakpointsSlider = [
    BreakpointConfig(
      minWidth: 1400,
      viewport: 0.2,
      cardWidth: 340,
      margin: 14,
      scale: 0.82,
    ),
    BreakpointConfig(
      minWidth: 1024,
      viewport: 0.35,
      cardWidth: 320,
      margin: 12,
      scale: 0.8,
    ),
    BreakpointConfig(
      minWidth: 768,
      viewport: 0.45,
      cardWidth: 300,
      margin: 10,
      scale: 0.78,
    ),
    BreakpointConfig(
      minWidth: 500,
      viewport: 0.6,
      cardWidth: 340,
      margin: 2,
      scale: 0.75,
    ),
    BreakpointConfig(
      minWidth: 320,
      viewport: 1,
      cardWidth: 340,
      margin: 0,
      scale: 1,
    ),
    BreakpointConfig(
      minWidth: 0,
      viewport: 1,
      cardWidth: 240,
      margin: 0,
      scale: 1,
    ),
  ];

  static BreakpointConfig getConfig(double width) {
    return breakpointsSlider.firstWhere(
      (config) => width >= config.minWidth,
    );
  }
}
