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
                      child: user.picture != null &&
                              user.picture!.fileTypeName == 'Profile Picture'
                          ? CachedNetworkImage(
                              width: double.infinity,
                              fit: BoxFit.fitHeight,
                              imageUrl: '$profilePic${user.picture!.url}',
                              placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                    color: kPrimaryKey,
                                    strokeWidth: 1,
                                  )))
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
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        if (user.availableWork.length > 0)
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: user.availableWork[0] == 'متاح للعمل'
                                  ? Colors.green
                                  : user.availableWork[0] == 'متاح لانجاز مهمة'
                                      ? kPrimaryKey
                                      : user.availableWork[0] == 'مطلوب للعمل '
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
                                  ),
                            ),
                          ),
                        SizedBox(width: 5.w),
                        if (user.availableWork.length > 1)
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: user.availableWork[0] == 'متاح للعمل'
                                  ? Colors.green
                                  : user.availableWork[0] == 'متاح لانجاز مهمة'
                                      ? kPrimaryKey
                                      : user.availableWork[0] == 'مطلوب للعمل '
                                          ? Colors.red
                                          : kDarktBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              user.availableWork[0] ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                const Divider(),
                SizedBox(height: 10.h),
                Text("القانون هو الحضارة، وبغيابه نعود إلى البربرية",
                    style: Theme.of(context).textTheme.titleSmall!)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
