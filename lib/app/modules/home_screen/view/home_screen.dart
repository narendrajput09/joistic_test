import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joistic_test/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:joistic_test/app/widgets/common_network_image.dart';
import 'package:joistic_test/l10n/localization.dart';
import 'package:joistic_test/src/gen/assets.gen.dart';
import 'package:joistic_test/src/gen/colors.gen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.bgColor,

      //AppBar
      appBar: PreferredSize(
          preferredSize: const Size(
            double.infinity,
            80,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Assets.images.icMenu.path, height: 24),
                AnimSearchBar(
                  width: size.width * 0.8,
                  searchWidget: Image.asset(Assets.images.icSearch.path, height: 18),
                  textController: controller.searchController,
                  onSuffixTap: () {},
                  onSubmitted: (String) {},
                ),
              ],
            ),
          )),

      //Logout button
      floatingActionButton: FloatingActionButton(
        onPressed: () {controller.signOut();},
        child: Icon(Icons.logout_outlined),
      ),

      //Body
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: ColorName.primary,
                  ),
                )
              : (controller.filteredList.isEmpty &&
                          controller.searchController.text.isNotEmpty) ||
                      controller.getCompanyList.isEmpty
                  ? const Center(
                      child: Text("No items found"),
                    )
                  : ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 20, bottom: 20),
                          child: Text(
                            AppLocalizations.of(context)!.findYourDream,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.filteredList.isNotEmpty ||
                                  controller.searchController.text.isNotEmpty
                              ? controller.filteredList.length
                              : controller.getCompanyList.length,
                          itemBuilder: (context, index) {
                            var item = controller.filteredList.isNotEmpty ||
                                    controller.searchController.text.isNotEmpty
                                ? controller.filteredList[index]
                                : controller.getCompanyList[index];

                            List<String> words = item.title.toString().split(' ');
                            String companyTitle = words.length > 1
                                ? '${words[0]} ${words[1]}'
                                : words.join(' ');

                            return GestureDetector(
                              onTap: (){
                                controller.showCompanyDialog(context,index);
                                FocusManager.instance.primaryFocus?.unfocus();

                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 25),
                                decoration: BoxDecoration(
                                  color: ColorName.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [

                                    BoxShadow(
                                      color: ColorName.textColor.withOpacity(0.3),
                                      spreadRadius: -10.0,
                                      blurRadius: 10.0,
                                      offset: Offset(0.0, 3.0),

                                    ),

                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 55,
                                      width: 55,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            ColorName.bgColor,
                                      ),
                                      child: Center(
                                        child: CommonNetworkImage(
                                          height: 30,
                                          imgUrl: item.thumbnailUrl.toString(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            companyTitle.capitalize ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            item.title
                                                    .toString()
                                                    .capitalizeFirst ??
                                                "",
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GetBuilder<HomeScreenController>(builder: (controller) {
                                      return Container(
                                        height: 35,
                                        width: 35,
                                        margin: const EdgeInsets.only(left: 12),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color:controller.filteredList.isNotEmpty ||
                                                controller.searchController.text.isNotEmpty
                                                ? controller.filteredList[index].isApplied! ==false?ColorName.primary:Colors.green
                                                : controller.getCompanyList[index].isApplied! ==false?ColorName.primary:Colors.green,
                                            boxShadow: [
                                              BoxShadow(
                                                color:controller.filteredList.isNotEmpty ||
                                        controller.searchController.text.isNotEmpty
                                        ? controller.filteredList[index].isApplied! ==false? ColorName.primary.withOpacity(0.3):Colors.green.withOpacity(0.3)
                                            : controller.getCompanyList[index].isApplied! ==false? ColorName.primary.withOpacity(0.3):Colors.green.withOpacity(0.3),
                                                spreadRadius: 7.0,
                                                blurRadius: 10.0,
                                                offset: Offset(0.0, 0.0),
                                              ),
                                            ]
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.work,
                                            color: ColorName.white,
                                            size: 18,
                                          ),
                                        ),
                                      );
                                    },),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
