import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:centalki/base/define/size.dart';
import 'package:centalki/src/features/topic/domain/entities/topic_item_entity.dart';
import 'package:centalki/src/features/topic/presentation/views/topic_detail_page.dart';
import 'package:centalki/src/features/topic/presentation/views/topic_detail_view.dart';
import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final TopicItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // Image.asset(
          //   item.image != null || item.image!.isEmpty ? Assets.images.tempAllTopic.path : item.image!,
          //   width: 128,
          //   height: 128,
          // ),
          // Image.asset('assets/images/temp_all_topic.png', width: 128, height: 128),
          // Container(width: 128, height: 128, color: Colors.redAccent),
          Image.network(
            item.image ?? '',
            width: 128,
            height: 128,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              width: 128,
              height: 128,
              child: Icon(
                Icons.error_outline_rounded,
                size: 32,
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.topicName ?? '',
                    style: const TextStyle(
                      fontSize: titleMediumSize,
                      fontWeight: titleMediumWeight,
                    ),
                  ),
                  const SizedBox(height: smallSpacing6),
                  Text(
                    item.topicCategory ?? '',
                    style: const TextStyle(
                      fontSize: bodySmallSize,
                      fontWeight: bodySmallWeight,
                    ),
                  ),
                  const SizedBox(height: spaceBetweenLine12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TopicDetailPage(topicId: item.topicId ?? ''),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.featured_play_list_rounded,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: smallSpacing6),
                            Text(
                              'Detail',
                              style: TextStyle(color: colorScheme.primary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: spaceBetweenLine12),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            )),
                        onPressed: () {},
                        child: Text(
                          'Talk',
                          style: TextStyle(color: colorScheme.onSecondary),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
