import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/core/route/route-name.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

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
      appBar: AppBar(title: const Text('Items'), actions: [
        GestureDetector(
          onTap: () => _onShowSavedItemViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.bookmark, color: MyColor.colorBlack),
          ),
        ),
      ]),
      body: BlocBuilder<ItemBloc, ItemState>(
        bloc: viewModel.itemBloc,
        builder: (context, state) {
          print('state');
          print(state);
          if (state is ItemLoading) {
            return const Center(
                child: SpinKitCircle(size: 50, color: MyColor.colorBlack));
          } else if (state is ItemLoaded) {
            return ListView.builder(
              itemCount: state.items.data.length,
              itemBuilder: (context, index) =>
                  _buildItem(context, state.items.data[index]),
            );
          } else if (state is ItemError) {
            return const Center(child: Text('Failed to fetch items'));
          }
          return const Text('No data');
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, dynamic item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTapItem,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            _buildTitleAndDescription(item),
            _buildSaveArea(context, item),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription(dynamic item) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              item!.firstName ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: MyColor.colorBlack,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  item!.lastName ?? '',
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveArea(BuildContext context, dynamic item) {
    return GestureDetector(
      onTap: () {
        viewModel.saveLocalItem(item);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: MyColor.colorBlack,
            content: Text('Item saved successfully.'),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(Icons.bookmark, color: MyColor.fbColor),
      ),
    );
  }

  void _onTapItem() {
    // Navigate to item details
  }

  void _onShowSavedItemViewTapped(BuildContext context) {
    context.pushNamed(RouteName.saveName);
  }
}
