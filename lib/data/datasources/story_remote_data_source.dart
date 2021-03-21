import 'dart:io';

import 'package:find_inspiration/data/dummydata/story_model_data.dart';
import 'package:find_inspiration/data/models/story_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class StoryRemoteDataSource{
  Future<String> uploadImage(File file);
}

class StoryRemoteDataSourceImpl extends StoryRemoteDataSource{

  final _firebaseStorage = FirebaseStorage.instance;
/*
  @override
  Future<List<StoryModel>> storyList() async{
    Future.delayed(Duration(seconds: 2));
    return StoryDummyData().call();
  }
*/

  @override
  Future<String> uploadImage(File file) async{
      try{
        await _firebaseStorage.ref("images/image1.jpg").putFile(file);
        return "Success";
      } on FirebaseException catch(e){
        print(e.message);
        return "Failed";
      }
  }


}