import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'falvor_state.dart';

class FalvorCubit extends Cubit<String> {
  FalvorCubit(String initialFlavor) : super(initialFlavor);
}
