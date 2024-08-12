import 'package:candy_store/faves/presentation/bloc/faves_bloc.dart';
import 'package:candy_store/faves/presentation/bloc/faves_event.dart';
import 'package:candy_store/faves/presentation/bloc/faves_state.dart';
import 'package:candy_store/product/presentation/widget/product_list_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavesPage extends StatefulWidget {
  const FavesPage({super.key});

  @override
  State<FavesPage> createState() => _FavesPageState();

  static Widget withBloc() => BlocProvider(
        create: (context) => FavesBloc(
          favesRepository: context.read(),
        )..add(LoadFaves()),
        child: const FavesPage(),
      );
}

class _FavesPageState extends State<FavesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faves'),
      ),
      body: BlocBuilder<FavesBloc, FavesState>(
        builder: (context, state) {
          final items = state.items;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ProductListItemView(item: item);
            },
          );
        },
      ),
    );
  }
}
