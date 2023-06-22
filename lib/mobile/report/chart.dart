import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum ChartType { line, bar, pie, scatter, radar }

// extension ChartTypeExtension on ChartType {
//   String getDisplayName() => '${getSimpleName()} Chart';
//
//   String getSimpleName() {
//     switch (this) {
//       case ChartType.line:
//         return 'Line';
//       case ChartType.bar:
//         return 'Bar';
//       case ChartType.pie:
//         return 'Pie';
//       case ChartType.scatter:
//         return 'Scatter';
//       case ChartType.radar:
//         return 'Radar';
//     }
//   }
//
//   String get assetIcon => AppAssets.getChartIcon(this);
// }

// class AppAssets {
//   static String getChartIcon(ChartType type) {
//     switch (type) {
//       case ChartType.line:
//         return 'assets/icons/ic_line_chart.svg';
//       case ChartType.bar:
//         return 'assets/icons/ic_bar_chart.svg';
//       case ChartType.pie:
//         return 'assets/icons/ic_pie_chart.svg';
//       case ChartType.scatter:
//         return 'assets/icons/ic_scatter_chart.svg';
//       case ChartType.radar:
//         return 'assets/icons/ic_radar_chart.svg';
//     }
//   }
//
//   static const flChartLogoIcon = 'assets/icons/fl_chart_logo_icon.png';
//   static const flChartLogoText = 'assets/icons/fl_chart_logo_text.svg';
// }

class AppColors {
  static const Color completedTasks = Color(0xfff98e48);
  static const Color completedSessions = Color(0xff68b7ec);
  static const Color spentHours = Color(0xff0c67c2);
}

class AppDimens {
  static const double menuMaxNeededWidth = 304;
  static const double menuRowHeight = 74;
  static const double menuIconSize = 36;
  static const double menuTextSize = 24;

  static const double chartBoxMinWidth = 350;

  static const double defaultRadius = 8;
  static const double chartSamplesSpace = 32.0;
  static const double chartSamplesMinWidth = 350;
}

// class AppTexts {
//   static const appName = 'FL Chart App';
// }

class BarChartSample7 extends StatefulWidget {
  BarChartSample7({super.key});

  final shadowColor = const Color(0xFFCCCCCC);
  final dataList = [
    const _BarData(AppColors.spentHours, 17, 8, 7),
    const _BarData(AppColors.completedSessions, 10, 15, 10),
    const _BarData(AppColors.spentHours, 17, 8, 7),
    const _BarData(AppColors.completedSessions, 10, 15, 10),
    const _BarData(AppColors.spentHours, 17, 8, 7),
    const _BarData(AppColors.completedSessions, 10, 15, 10),
  ];

  @override
  State<BarChartSample7> createState() => _BarChartSample7State();
}

class _BarChartSample7State extends State<BarChartSample7> {
  BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
    double shadowValue2,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: Color(0xfff98e48),
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue,
          color: Color(0xff68b7ec),
          width: 6,
        ),
        BarChartRodData(
          toY: shadowValue2,
          color: Color(0xff0c67c2),
          width: 6,
        ),
      ],
      showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
    );
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: AspectRatio(
        aspectRatio: 1.4,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceBetween,
            borderData: FlBorderData(
              show: true,
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: AppColors.completedSessions.withOpacity(0.2),
                ),
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                drawBehindEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt().toString(),
                      textAlign: TextAlign.left,
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 36,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text("00:00"),
                    );
                  },
                ),
              ),
              rightTitles: AxisTitles(),
              topTitles: AxisTitles(),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) => FlLine(
                color: AppColors.completedSessions.withOpacity(0.2),
                strokeWidth: 1,
              ),
            ),
            barGroups: widget.dataList.asMap().entries.map((e) {
              final index = e.key;
              final data = e.value;
              return generateBarGroup(
                index,
                data.color,
                data.value,
                data.shadowValue,
                data.shadowValue2,
              );
            }).toList(),
            maxY: 20,
            barTouchData: BarTouchData(
              enabled: true,
              handleBuiltInTouches: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipMargin: 0,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    rod.toY.toString(),
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      color: rod.color,
                      fontSize: 18,
                      shadows: const [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 12,
                        )
                      ],
                    ),
                  );
                },
              ),
              touchCallback: (event, response) {
                if (event.isInterestedForInteractions &&
                    response != null &&
                    response.spot != null) {
                  setState(() {
                    touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                  });
                } else {
                  setState(() {
                    touchedGroupIndex = -1;
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _BarData {
  const _BarData(this.color, this.value, this.shadowValue, this.shadowValue2);

  final Color color;
  final double value;
  final double shadowValue;
  final double shadowValue2;
}
//
// class _IconWidget extends ImplicitlyAnimatedWidget {
//   const _IconWidget({
//     required this.color,
//     required this.isSelected,
//   }) : super(duration: const Duration(milliseconds: 300));
//   final Color color;
//   final bool isSelected;
//
//   @override
//   ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
//       _IconWidgetState();
// }
//
// class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
//   Tween<double>? _rotationTween;
//
//   @override
//   Widget build(BuildContext context) {
//     final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
//     final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
//     return Transform(
//       transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
//       origin: const Offset(14, 14),
//       child: Icon(
//         widget.isSelected ? Icons.face_retouching_natural : Icons.face,
//         color: widget.color,
//         size: 28,
//       ),
//     );
//   }
//
//   @override
//   void forEachTween(TweenVisitor<dynamic> visitor) {
//     _rotationTween = visitor(
//       _rotationTween,
//       widget.isSelected ? 1.0 : 0.0,
//           (dynamic value) => Tween<double>(
//         begin: value as double,
//         end: widget.isSelected ? 1.0 : 0.0,
//       ),
//     ) as Tween<double>?;
//   }
// }
