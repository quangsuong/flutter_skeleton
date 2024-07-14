import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../core/di/locator.dart';
import '../../../core/utils/my_color.dart';
import '../../../logic/blocs/item_bloc.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel viewModel = ServiceLocator.instance.get<HomeViewModel>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    viewModel.fetchItems();
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: BlocBuilder<ItemBloc, ItemState>(
        bloc: viewModel.itemBloc,
        builder: (context, state) {
          if (state is ItemLoading) {
            return const Center(
                child: SpinKitCircle(size: 50, color: Colors.black));
          } else if (state is ItemLoaded) {
            return ListView.builder(
              itemCount: state.items.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.items.data[index].firstName +
                      state.items.data[index].lastName),
                  subtitle: Text(state.items.data[index].lastName),
                  tileColor: MyColor.t1,
                );
              },
            );
          } else if (state is ItemError) {
            return const Center(child: Text('Failed to fetch items'));
          }
          return Container();
        },
      ),
    );
  }
}
