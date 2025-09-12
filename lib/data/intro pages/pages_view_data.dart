import 'package:quiz/core/Models/page_view.dart';
import 'package:quiz/core/resources/images/images_manager.dart';
import 'package:quiz/core/resources/strings/strings_manager.dart';

class PagesViewData {
  static List<PageViewModel> pageViewData = [
    PageViewModel(
      title: StringsManager.pageViewTitle1,
      subTitle: StringsManager.pageViewSubtitle1,
      imagePath: ImagesManager.pageViewImg1,
    ),
    PageViewModel(
      title: StringsManager.pageViewTitle2,
      subTitle: StringsManager.pageViewSubtitle2,
      imagePath: ImagesManager.pageViewImg2,
    ),
    PageViewModel(
      title: StringsManager.pageViewTitle3,
      subTitle: StringsManager.pageViewSubtitle3,
      imagePath: ImagesManager.pageViewImg3,
    ),
  ];
}
