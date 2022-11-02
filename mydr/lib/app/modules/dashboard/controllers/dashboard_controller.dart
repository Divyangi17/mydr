import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';
import '../model/github_project_ui_data.dart';

class DashboardController extends BaseController {
  final GithubRepository _repository =
      Get.find(tag: (GithubRepository).toString());

  final RxList<GithubProjectUiData> _githubProjectListController =
      RxList.empty();

  List<GithubProjectUiData> get projectList =>
      _githubProjectListController.toList();

  String welcomevideo = "https://firebasestorage.googleapis.com/v0/b/divastore-3a7c5.appspot.com/o/mydr%2Fwelcome.mp4?alt=media&token=ed8e37ac-92ec-4525-a6bc-1f2d8b23c915";

  final pagingController = PagingController<GithubProjectUiData>();

  void getNavMenu(){
    // FirebaseFirestore.instance.collection('dailyaffairs').orderBy("dacode").snapshots().forEach((element) async {
    //   element.docs.forEach((element2) async {
    //
    //     DailyAffairs m1 = DailyAffairs(
    //       dacode: element2.data()['dacode'] as String,
    //       datitle: element2.data()['datitle'] as String,
    //       dadate: element2.data()['dadate'] as Timestamp,
    //       dadescription: element2.data()['dadescription'] as String,
    //       daauthor: element2.data()['daauthor'] as String,
    //       ref: element2.data()['ref'] as String,
    //     );
    //     //qq.add(m1);
    //
    //     //String imgurl = FirebaseStorage.instance.ref().child('dailyaffairs').child('062022').child(m1.dacode+".png").getDownloadURL() as String;
    //     //String imgurl = "";
    //     cards.add(AffairsCard(m1.dacode, m1.datitle, m1.dadate, m1.dadescription,m1.ref));
    //     //await AllCourseDatabase.instance.create(m1);
    //     //print(">>>>>>>>>>>>>>>>>>>>>>${element2.data()['sr_no'] as int}>>>>>>>>>>>>>>>>>>>>>>>${(element2.data()['sr_no'] as int).toString()}");
    //   });
    // }).timeout(Duration(seconds: 10), onTimeout: () async {
    //   print("Time out: No internet");
    //   if(cards.length<0){
    //     print("length===0====>> ${cards.length}");
    //   }
    // }).whenComplete(() {
    //   print("length==>> ${cards.length}");
    //   setState(() => isLoading = false);
    // });
  }

  void getGithubGetxProjectList() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    var queryParam = GithubSearchQueryParam(
      searchKeyWord: 'divyangi',
      pageNumber: pagingController.pageNumber,
    );

    var githubRepoSearchService = _repository.searchProject(queryParam);

    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getGithubGetxProjectList();
  }

  onLoadNextPage() {
    logger.i("On load next");

    getGithubGetxProjectList();
  }

  void _handleProjectListResponseSuccess(GithubProjectSearchResponse response) {
    List<GithubProjectUiData>? repoList = response.items
        ?.map((e) => GithubProjectUiData(
              repositoryName: e.name != null ? e.name! : "Null",
              ownerLoginName: e.owner != null ? e.owner!.login! : "Null",
              ownerAvatar: e.owner != null ? e.owner!.avatarUrl! : "",
              numberOfStar: e.stargazersCount ?? 0,
              numberOfFork: e.forks ?? 0,
              score: e.score ?? 0.0,
              watchers: e.watchers ?? 0,
              description: e.description ?? "",
            ))
        .toList();

    if (_isLastPage(repoList!.length, response.totalCount!)) {
      pagingController.appendLastPage(repoList);
    } else {
      pagingController.appendPage(repoList);
    }

    var newList = [...pagingController.listItems];

    _githubProjectListController(newList);
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (projectList.length + newListItemCount) >= totalCount;
  }
}
