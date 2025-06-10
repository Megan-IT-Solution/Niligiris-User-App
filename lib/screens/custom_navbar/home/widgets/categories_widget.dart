import 'package:flutter/material.dart';

import '../../../../constants/app_text_styles.dart';
import '../../../../utils/lists.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 65,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: categoryColors[index % categoryColors.length],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset(categories[index].icon),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 90,
                  height: 33,
                  child: Text(
                    categories[index].title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h1.copyWith(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
