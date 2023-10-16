import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdc_coach_user/domain/model/location.dart';

class LocationCubit extends Cubit<List<Location>> {
  LocationCubit() : super([]);

  void addLocation(Location location) {
    state.add(location);
    emit(List.from(state));
  }
}
