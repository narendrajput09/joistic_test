import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:joistic_test/app/widgets/common_network_image.dart';
import 'package:joistic_test/networking/models/company_list_response/company_list_response.dart';
import 'package:joistic_test/src/gen/assets.gen.dart';
import 'package:joistic_test/src/gen/colors.gen.dart';

class CompanyDetailDialog extends StatelessWidget {
  const CompanyDetailDialog({
    Key? key,
    this.applyClick, required this.items,
  }) : super(key: key);
  final Function? applyClick;
  final CompanyListResponse items;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> words = items.title.toString().split(' ');
    String companyTitle = words.length > 1
        ? '${words[0]} ${words[1]}'
        : words.join(' ');

    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:  EdgeInsets.only(top: size.height * 0.3),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 45, right: 45, top: size.height * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(companyTitle.capitalize.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: ColorName.blackColor)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Contrary to CA',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Tech based company and the producer',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Text(
                              'Requirement',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text('Senior UI/UX Designer',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Text(
                              'Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                            ),
                          ),
                         Flexible(
                           flex: 4,
                           child: SingleChildScrollView(
                             child: Padding(
                               padding: const EdgeInsets.only(bottom: 60),
                               child: Text(
                                 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy the comapny details Lorem Ipsum has been the industrys standard dummy the comapny details industrys standard dummy the comapny details Lorem Ipsum has been the industrys standard dummy the comapny details',
                                 style: Theme.of(context)
                                     .textTheme
                                     .displayMedium!
                                     .copyWith(
                                   fontWeight: FontWeight.w600,
                                   fontSize: 16,
                                   height: 3,
                                 ),
                               ),
                             ),
                           ),
                         )
                        ],
                      )),
                ),
                Positioned(
                  left: 40, // Adjust as needed to position the container
                  top: -50,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(18),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: ColorName.bgColor),
                      child: Center(
                        child: CommonNetworkImage(
                          height: 40,
                          imgUrl: items.thumbnailUrl.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    applyClick!();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                    height: 55,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: ColorName.white,
                            spreadRadius: 20.0,
                            blurRadius:20.0,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(7),
                        color:items.isApplied!?Colors.green.withOpacity(0.3): ColorName.primary.withOpacity(0.3),),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color:items.isApplied!?Colors.green: ColorName.primary,
                      ),
                      child: Center(
                        child: Text(
                          items.isApplied!?"APPLIED":"APPLY NOW",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 16, color: ColorName.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
