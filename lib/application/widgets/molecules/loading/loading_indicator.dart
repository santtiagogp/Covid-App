import 'package:flutter/material.dart';

import '../../../constants/covid_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({ Key? key }) : super(key: key);

  @override
  Center build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: CovidColors.accentBlue,
      ),
    );
  }
}