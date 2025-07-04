import 'package:flutter/material.dart';
import 'package:flutter_tokonih/core/constant/theme.dart';
import 'package:intl/intl.dart';

class ProductReviewCard extends StatelessWidget {
  final int rating;
  final String comment;
  final String reviewerName;
  final DateTime date;
  const ProductReviewCard({
    super.key,
    required this.rating,
    required this.comment,
    required this.reviewerName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Row(
            spacing: 8,
            children: [
              CircleAvatar(
                backgroundColor: DefaultColors.blue100,
                radius: 14.0,
                backgroundImage:
                    const AssetImage('assets/images/profile_picture.jpeg')
                        as ImageProvider,
              ),
              Text(
                reviewerName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Stack(
            children: [
              SizedBox(
                height: 30,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 2),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Icon(
                      Icons.star,
                      color: DefaultColors.neutral100,
                      size: 18,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 2),
                  scrollDirection: Axis.horizontal,
                  itemCount: rating,
                  itemBuilder: (context, index) {
                    return Icon(Icons.star, color: Colors.amber, size: 18);
                  },
                ),
              ),
            ],
          ),
          Text(
            comment,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: DefaultColors.neutral800,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                DateFormat('dd MMMM yyyy').format(date),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: DefaultColors.neutral800,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.thumb_up_off_alt,
                size: 18,
                color: DefaultColors.neutral400,
              ),
              const SizedBox(width: 4),
              Text(
                '26',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: DefaultColors.neutral800,
                ),
              ),
            ],
          ),
          const Divider(color: DefaultColors.neutral100, thickness: 1),
        ],
      ),
    );
  }
}
