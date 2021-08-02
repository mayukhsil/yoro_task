import 'package:get/get.dart';
import 'package:randomizer/randomizer.dart';
import 'package:yoro_task/model/message_model.dart';
import 'package:yoro_task/repository/message_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewController extends GetxController{

  final MessageRepo messageRepo = MessageRepo();
  MessageModel messageModel;
  var isLoading = true.obs;
  var width = 250.w.obs;
  var random1 = 0.obs;
  var random2 = 0.obs;
  var random3 = 0.obs;
  List<Data> randomList = [];
  List<Data> messageObjects = [];
  Randomizer randomizer = Randomizer();

  @override
  void onInit() async {
    await getMessages();
    super.onInit();
    isLoading(false);
    update();
  }

  getMessages() async {
    messageModel = await messageRepo.readMessageJson();
    print(messageModel);
  }

  generateRandomNumbers() {
    return randomizer.getrandomnumber(0, 9);
  }

}