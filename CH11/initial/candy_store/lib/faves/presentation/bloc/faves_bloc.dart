import 'package:candy_store/faves/domain/repository/faves_repository.dart';
import 'package:candy_store/faves/presentation/bloc/faves_event.dart';
import 'package:candy_store/faves/presentation/bloc/faves_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavesBloc extends Bloc<FavesEvent, FavesState> {
  final FavesRepository favesRepository;

  FavesBloc({
    required this.favesRepository,
  }) : super(const FavesState(items: [])) {
    on<LoadFaves>(_onLoadFaves);
    on<AddFave>(_onAddFave);
    on<RemoveFave>(_onRemoveFave);
  }

  Future<void> _onLoadFaves(LoadFaves event, Emitter emit) async {
    final faves = await favesRepository.getFaves();
    emit(state.copyWith(items: faves));
  }

  Future<void> _onAddFave(AddFave event, Emitter emit) async {
    await favesRepository.addFave(event.item);
    final faves = await favesRepository.getFaves();
    emit(state.copyWith(items: faves));
  }

  Future<void> _onRemoveFave(RemoveFave event, Emitter emit) async {
    await favesRepository.removeFave(event.id);
    final faves = await favesRepository.getFaves();
    emit(state.copyWith(items: faves));
  }
}
