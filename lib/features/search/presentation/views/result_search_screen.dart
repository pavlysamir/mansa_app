import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/core/Assets/assets.dart';
import 'package:mansa_app/features/home/presentation/widgets/custom_lawyer_data_item.dart';
import 'package:mansa_app/features/search/presentation/managers/cubit/search_cubit.dart';

class ResultSearchScreen extends StatefulWidget {
  const ResultSearchScreen({super.key});

  @override
  State<ResultSearchScreen> createState() => _ResultSearchScreenState();
}

class _ResultSearchScreenState extends State<ResultSearchScreen> {
  ScrollController? _scrollController;
  bool isLoading = false;
  int pageNum = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // HomeCubit.get(context)!
    //     .getAllUsers(pageNumber: pageNum); // Fetch initial data
    _scrollController!.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController!.position.pixels >=
            0.7 * _scrollController!.position.maxScrollExtent &&
        !isLoading) {
      if (SearchCubit.get(context)!.count! !=
          SearchCubit.get(context)!.users.length) {
        isLoading = true;
        if (kDebugMode) {
          print("bavlyyyyyyyyyyyyyy${++pageNum}");
        }
        await SearchCubit.get(context)!.getSearchedUsers(pageNum++);
        isLoading = false;
      } else {
        null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              AppLocalizations.of(context)!.search,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          body: SearchCubit.get(context)!.users.isEmpty
              ? Center(
                  child: Image.asset(AssetsData.noSearch),
                )
              : SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.dg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CustomLowyerDataItem(
                              user: SearchCubit.get(context)!.users[index],
                            );
                          },
                          itemCount: SearchCubit.get(context)!.users.length,
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
