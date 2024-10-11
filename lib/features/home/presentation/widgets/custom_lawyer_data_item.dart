import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mansa_app/constants.dart';
import 'package:mansa_app/features/home/data/models/user_data_model.dart';
import 'package:mansa_app/features/profile/presentation/views/user_profile_screen.dart';

class CustomLowyerDataItem extends StatelessWidget {
  const CustomLowyerDataItem({
    super.key,
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UserProfileScreen(
              user: user,
            );
          }));
        },
        child: Container(
          // height: 121.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      child: user.picture != null
                          // &&
                          //         user.picture!.fileTypeName == 'Profile Picture'
                          ? ClipOval(
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                  imageUrl: user.picture!.url,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.person),
                                  placeholder: (context, url) => const Center(
                                          child: CircularProgressIndicator(
                                        color: kPrimaryKey,
                                        strokeWidth: 1,
                                      ))),
                            )
                          : const Icon(Icons.person),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: kDarktBlue),
                          ),
                          Text(
                            user.registrationGrade,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: kPrimaryKey),
                          ),
                          SizedBox(height: 8.h),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              children: [
                                if (user.availableWork.length > 0)
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: user.availableWork[0] ==
                                              'متاح للعمل بشكل دائم'
                                          ? Colors.green
                                          : user.availableWork[0] ==
                                                  'متاح لانجاز مهمة'
                                              ? kPrimaryKey
                                              : user.availableWork[0] ==
                                                      'مطلوب للعمل '
                                                  ? Colors.red
                                                  : kDarktBlue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      user.availableWork[0] ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                    ),
                                  ),
                                SizedBox(width: 5.w),
                                if (user.availableWork.length > 1)
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: user.availableWork[1] ==
                                              'متاح للعمل بشكل دائم'
                                          ? Colors.green
                                          : user.availableWork[1] ==
                                                  'متاح لانجاز مهمة'
                                              ? kPrimaryKey
                                              : user.availableWork[1] ==
                                                      'مطلوب للعمل '
                                                  ? Colors.red
                                                  : kDarktBlue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      user.availableWork[1] ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const Divider(),
                SizedBox(height: 10.h),
                Text(user.description ?? ' لا توجد وصف ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleSmall!)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
