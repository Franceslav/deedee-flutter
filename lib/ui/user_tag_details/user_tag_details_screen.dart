import 'package:auto_route/auto_route.dart';
import 'package:deedee/generated/deedee/api/model/tag.pb.dart';
import 'package:deedee/services/helper.dart';
import 'package:deedee/ui/user_tag_details/bloc/user_tag_details_bloc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserTagDetailsScreen extends StatefulWidget {
  final String userId;
  final String tagId;

  const UserTagDetailsScreen({
    super.key,
    @PathParam() required this.userId,
    @PathParam() required this.tagId,
  });

  @override
  State<UserTagDetailsScreen> createState() => _UserTagDetailsScreenState();
}

class _UserTagDetailsScreenState extends State<UserTagDetailsScreen> {
  Tag? _tag;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserTagDetailsBloc>(context).add(LoadTagEvent(
      userId: widget.userId,
      tagId: Int64.parseInt(widget.tagId),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tag Details'),
      ),
      body: BlocConsumer<UserTagDetailsBloc, UserTagDetailsState>(
        listener: (context, state) {
          if (state is LoadedTagState) {
            _tag = state.tag;
          }
          if (state is ErrorState) {
            showSnackBar(
              context,
              state.errorMessage,
            );
          }
        },
        builder: (context, state) {
          return state is InitialState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('tagId: ${_tag?.tagId}'), //TODO
                    // Text('creator: ${_tag?.messengerId}'),
                    Text('topic: ${_tag?.compositeFilter.topic.topicId}'),
                    Text(
                        'expires: ${_tag == null ? '' : DateFormat('dd-MM-yyyy HH:mm').format(DateTime.fromMillisecondsSinceEpoch(_tag!.createdAt.seconds.toInt() * 1000))}'),
                    // Text('description: ${_tagDetails?.description}'),
                    // Text('price: ${_tagDetails?.price}'),
                    // Text('working hours: ${_tagDetails?.timetable}'),
                  ],
                );
        },
      ),
    );
  }
}
