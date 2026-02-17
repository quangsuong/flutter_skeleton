import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/core/di/locator.dart';
import 'package:flutter_skeleton/core/constants/my_color.dart';
import 'package:flutter_skeleton/data/models/item_model.dart';
import 'package:flutter_skeleton/logic/blocs/item_bloc.dart';
import 'package:flutter_skeleton/ui/views/saved_item/saved_item_view_model.dart';
import 'package:go_router/go_router.dart';

class SavedItem extends StatelessWidget {
  final SavedItemViewModel viewModel =
      ServiceLocator.instance.get<SavedItemViewModel>();

  SavedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child:
              const Icon(Icons.arrow_back_ios_new, color: MyColor.colorBlack),
        ),
      ),
      title: const Text('Saved Items',
          style: TextStyle(color: MyColor.colorBlack)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ItemBloc, ItemState>(
      bloc: viewModel.itemBloc,
      builder: (context, state) {
        if (state is ItemLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is ItemLocalLoaded) {
          return _buildArticlesList(state.items);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<Item> items) {
    if (items.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED ITEMS',
        style: TextStyle(color: MyColor.colorBlack),
      ));
    }

    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => _buildItem(context, items[index]));
  }

  Widget _buildItem(BuildContext context, dynamic item) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            _buildTitleAndDescription(item),
            _buildRemoveArea(item),
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

  Widget _buildRemoveArea(dynamic item) {
    return GestureDetector(
      onTap: () => viewModel.removeLocalItemEvent(item),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(Icons.remove_circle_outline, color: MyColor.closeRedColor),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    context.pop();
  }

  void _onTap() {
    // Navigate to details
  }
}
