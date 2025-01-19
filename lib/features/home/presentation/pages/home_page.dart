import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_you_task/features/home/data/home_page_api.dart';
import 'package:link_you_task/features/home/domain/home_page_repo.dart';
import 'package:link_you_task/features/todo/presentation/widgets/todo_card.dart';

import '../../../../core/widgets/custom_card.dart';
import '../../../todo/domain/model/todo_model.dart';
import '../../../todo/presentation/widgets/check_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _limit = 20;
  int _page = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  List<TodoModel> _items = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadItems();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _loadItems();
      }
    });
  }

  Future<void> _loadItems() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final newItems = await HomePageApi(Dio()).fetchPage(pageKey: _page);

    setState(() {
      _isLoading = false;
      if (newItems.isEmpty) {
        _hasMore = false;
      } else {
        _page++;
        _items.addAll(newItems);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 10.h,),
        padding:  EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.h),
        controller: _scrollController,
        itemCount: _items.length + (_hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return Center(child: CircularProgressIndicator());
          }
          final todoModel = _items[index];
          return CustomCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CheckWidget(
                  completed: todoModel.completed,
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  width: 335.w,
                  child: Text(
                    todoModel.todo,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}