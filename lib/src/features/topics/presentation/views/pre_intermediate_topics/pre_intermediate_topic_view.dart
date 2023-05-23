import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/text_button.dart';
import '../../../../../../base/widgets/toast/app_toast.dart';
import '../../../../../../generated/l10n.dart';
import '../../blocs/pre_intermediate_topic_bloc/pre_intermediate_topics_bloc.dart';
import '../../widgets/topic_card.dart';

class PreIntermediateTopicView extends StatelessWidget {
  const PreIntermediateTopicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocListener<PreIntermediateTopicsBloc, PreIntermediateTopicsState>(
        listener: (context, state) {
          if (state is PreIntermediateTopicsLoadingState) {
            LoadingManager.setLoading(context, loading: state.showLoading && state.isOverlay);
          } else if (state is PreIntermediateTopicsErrorState) {
            AppToast(
              mode: AppToastMode.error,
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: Text(
                state.exception.displayMessage,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
          } else if (state is PreIntermediateTopicsAddFavoriteDoneState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: Text(
                S.current.txtAddFavoriteSuccess,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context
                .read<PreIntermediateTopicsBloc>()
                .add(const PreIntermediateTopicsLoadEvent(isRefresh: true));
          } else if (state is PreIntermediateTopicsRemoveFavoriteDoneState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: Text(
                S.current.txtRemoveFavoriteSuccess,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context
                .read<PreIntermediateTopicsBloc>()
                .add(const PreIntermediateTopicsLoadEvent(isRefresh: true));
          }
        },
        child: BlocBuilder<PreIntermediateTopicsBloc, PreIntermediateTopicsState>(
          buildWhen: (previous, current) =>
              current != previous &&
              (current is PreIntermediateTopicsLoadDoneState ||
                  (current is PreIntermediateTopicsLoadingState && !current.isOverlay)),
          builder: (context, state) {
            if (state is PreIntermediateTopicsLoadDoneState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding16),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: padding16),
                  itemCount: state.topics.length,
                  separatorBuilder: (context, index) => const SizedBox(height: spacing8),
                  itemBuilder: (context, index) => TopicCard(
                    item: state.topics[index],
                    onTap: () async {
                      if (state.topics[index].topicBookmark != null) {
                        await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: colorsByTheme(context).backgroundCardsChip,
                            title: Text(
                              S.current.txtConfirmRemoveFavoriteTitle,
                              style:  TextStyle(
                                fontSize: titleLargeSize,
                                fontWeight: titleLargeWeight,
                                color: colorsByTheme(context).defaultFont,
                              ),
                            ),
                            content: Text(
                              S.current.txtConfirmRemoveFavoriteContent,
                              style:  TextStyle(
                                fontSize: bodySmallSize,
                                fontWeight: bodySmallWeight,
                                color: colorsByTheme(context).defaultFont,
                              ),
                            ),
                            actions: [
                              AppTextButton(
                                text: S.current.txtCancel,
                                onPressed: () => Navigator.pop(context, false),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.error,
                                  foregroundColor: Colors.white,
                                ),
                                child: Text(
                                  S.current.txtRemove,
                                  style: const TextStyle(
                                    fontSize: labelLargeSize,
                                    fontWeight: labelLargeWeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).then((confirmRemoved) => {
                              if (confirmRemoved)
                                {
                                  context
                                      .read<PreIntermediateTopicsBloc>()
                                      .add(PreIntermediateTopicsRemoveFavoriteEvent(
                                        id: state.topics[index].topicBookmark?.bookmarkId ?? '',
                                      )),
                                }
                            });
                      } else {
                        context
                            .read<PreIntermediateTopicsBloc>()
                            .add(PreIntermediateTopicsAddFavoriteEvent(
                              topicId: state.topics[index].topicId ?? '',
                            ));
                      }
                    },
                    onTopicsRefresh: () => context
                        .read<PreIntermediateTopicsBloc>()
                        .add(const PreIntermediateTopicsInitEvent()),
                  ),
                ),
              );
            }
            if (state is PreIntermediateTopicsLoadingState &&
                state.showLoading &&
                !state.isOverlay) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
