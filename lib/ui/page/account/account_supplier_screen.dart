// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/deedee/api/model/supplier.pb.dart';
import 'package:deedee/generated/deedee/api/model/topic.pb.dart';
import 'package:deedee/injection.dart';
import 'package:deedee/repository/supplier_repository.dart';
import 'package:deedee/repository/topic_repository.dart';
import 'package:deedee/ui/global_widgets/outlined_button_widget.dart';
import 'package:deedee/ui/page/account/bloc/supplier_bloc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uuid/uuid.dart';
import 'package:deedee/model/user.dart';
import 'package:deedee/ui/global_widgets/deedee_appbar.dart';
import 'package:deedee/ui/global_widgets/profile_menu_slider.dart';
import 'package:deedee/ui/global_widgets/profile_photo_with_badge.dart';
import 'package:deedee/ui/main_topic/enum/topic_screens_enum.dart';
import 'package:deedee/ui/main_topic/main_topic_item.dart';
import 'package:deedee/ui/theme/app_text_theme.dart';
import 'package:deedee/ui/user_bloc/user_bloc.dart';

class AccountSupplierScreen extends StatefulWidget {
  final Int64 selectedCreatorId;

  const AccountSupplierScreen({
    Key? key,
    required this.selectedCreatorId,
  }) : super(key: key);

  @override
  State createState() => _AccountState();
}

class _AccountState extends State<AccountSupplierScreen> {
  final PanelController _controller = PanelController();
  final Uuid uuid = const Uuid();
  late String cityChoose;
  late List<String> places;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final bloc = SupplierBloc(
        locator.get<SupplierRepository>(), locator.get<TopicRepository>());
    final List<Supplier> _supplier = [];
    final List<Topic> _topics = [];

    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: DeeDeeAppBar(
          title: locale.executorProfile,
          controller: _controller,
          child: const ProfilePhotoWithBadge(),
        ),
        body: BlocConsumer<SupplierBloc, SupplierState>(
          bloc: bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SupplierLoadState) {
              _supplier.add(state.suplier);
              _topics.addAll(state.topic);
            }
            var _topicWidth = MediaQuery.of(context).size.width * 0.3;
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _PersonalInformation(
                            user: user,
                            locale: locale,
                            selectedCreatorId: widget.selectedCreatorId,
                          ),
                          const _RatingAndCountApplication(),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Row(
                        children: [
                          Text('${locale.executorTags} $_supplier'),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.16,
                        child: ListView.builder(
                          itemCount: _topics.length,
                          itemBuilder: (context, index) {
                            return MainTopicItem(
                                topic: _topics[index],
                                width: _topicWidth,
                                screenType: ScreenType.filterTags);
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(locale.reviews),
                      const _Feedbacks(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015),
                      Text(locale.writeReview),
                      const TextField(),
                    ],
                  ),
                ),
                ProfileMenuSlider(
                  context,
                  controller: _controller,
                  user: user,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Feedbacks extends StatelessWidget {
  const _Feedbacks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[200],
            child: ListTile(title: Text('Отзыв ${index + 1}')),
          );
        },
      ),
    );
  }
}

class _ExecutorTags extends StatelessWidget {
  const _ExecutorTags({
    super.key,
    required double topicWidth,
  }) : _topicWidth = topicWidth;

  final double _topicWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MainTopicItem(
              topic: Topic(title: 'Авто', topicId: 1, userId: ''),
              width: _topicWidth,
              screenType: ScreenType.filterTags),
          MainTopicItem(
              topic: Topic(title: 'Красота', topicId: 2, userId: ''),
              width: _topicWidth,
              screenType: ScreenType.filterTags),
          MainTopicItem(
              topic: Topic(title: 'Ремонт', topicId: 3, userId: ''),
              width: _topicWidth,
              screenType: ScreenType.filterTags),
          MainTopicItem(
              topic: Topic(title: 'Дети', topicId: 4, userId: ''),
              width: _topicWidth,
              screenType: ScreenType.filterTags),
        ],
      ),
    );
  }
}

class _RatingAndCountApplication extends StatelessWidget {
  const _RatingAndCountApplication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '9',
                    style: AppTextTheme.titleMedium,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.008),
                  Text(
                    AppLocalizations.of(context)!.completedApplications,
                    style: AppTextTheme.titleNormal,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(AppLocalizations.of(context)!.rating),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    itemSize: 20,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonalInformation extends StatelessWidget {
  final Int64 selectedCreatorId;

  const _PersonalInformation({
    super.key,
    required this.user,
    required this.locale,
    required this.selectedCreatorId,
  });

  final User user;
  final AppLocalizations locale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 64, width: 64, child: ProfilePhotoWithBadge()),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '${user.fullName()}',
            style: AppTextTheme.titleNormal,
          ),
        ),
        //TODO implement data
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Text(
                locale.onServiceSince,
                style: AppTextTheme.titleNormal
                    .copyWith(color: const Color(0xFF8C8C9A)),
              ),
              Text(
                '2023',
                style: AppTextTheme.titleNormal
                    .copyWith(color: const Color(0xFF8C8C9A)),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
        Row(
          children: [
            const Text('Doc:'),
            Icon(
              Icons.difference_outlined,
              color: (user.docVerification.name == 'unverified')
                  ? Colors.red
                  : Colors.green,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            const Text('Email:'),
            Icon(
              Icons.email_outlined,
              color: (user.emailVerification.name == 'unverified')
                  ? Colors.red
                  : Colors.green,
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.005),
      ],
    );
  }
}
