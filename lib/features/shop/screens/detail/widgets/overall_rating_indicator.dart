import 'package:flutter/material.dart';
import 'package:tstore/common/widgets/rating_progress.dart';

class TOverallRatingIndicator extends StatelessWidget {
  const TOverallRatingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 2,
          child: Column(
            children: [
              TRatingProgressIndicator(
                text: '5',
                value: 0.8,
              ),
              TRatingProgressIndicator(
                text: '4',
                value: 0.7,
              ),
              TRatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              TRatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              TRatingProgressIndicator(
                text: '1',
                value: 0.1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
