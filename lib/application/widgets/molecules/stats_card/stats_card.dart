import 'package:flutter/material.dart';

import '../../../constants/utils/covid_responsive.dart';
import '../../foundations/covid_text.dart';
import '../../tokens/covid_spacing.dart';
import 'stats_card_helper.dart';

enum StatsCardType { confirmed, active, recovered, deceased }

class StatsCard extends StatefulWidget {
  const StatsCard({
    Key? key,
    required this.type,
    required this.title,
    required this.data
  }) : super(key: key);

  final StatsCardType type;
  final String title;
  final String data;

  @override
  State<StatsCard> createState() => _StatsCardState();
}

class _StatsCardState extends State<StatsCard> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final CovidResponsive _responsive = CovidResponsive(context);

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this, 
      reverseDuration: const Duration(milliseconds: 7000),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.forward();

    return FadeTransition(
      opacity: _animation,
      child: Container(
        padding: EdgeInsets.all(_responsive.heightConfig(CovidSpacing.SPACE_MD)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CovidText.mediumText(
                text: widget.title,
                color: StatsCardHelper.textColorHelper(widget.type),
                fontWeight: FontWeight.w500
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CovidText.bigText(
                text: widget.data,
                color: StatsCardHelper.textColorHelper(widget.type),
                fontWeight: FontWeight.bold
              )
            )
          ],
        ),
        margin: EdgeInsets.symmetric(
          horizontal: _responsive.widthConfig(CovidSpacing.SPACE_MD)
        ),
        width: _responsive.widthConfig(CovidSpacing.SPACE_XXL + 100),
        height: _responsive.heightConfig(CovidSpacing.SPACE_XXL + 80),
        decoration: BoxDecoration(
          color: StatsCardHelper.backgroundColorHelper(widget.type),
          borderRadius: BorderRadius.circular(CovidSpacing.SPACE_MD)
        ),
      ),
    );
  }
}