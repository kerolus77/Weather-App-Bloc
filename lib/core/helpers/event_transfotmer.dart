import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:stream_transform/stream_transform.dart';

const _duration = Duration(milliseconds: 500);

EventTransformer<Event> debounce<Event>({Duration duration = _duration}) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}
