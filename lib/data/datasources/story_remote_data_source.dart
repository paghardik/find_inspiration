import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_inspiration/data/dummydata/story_model_data.dart';
import 'package:find_inspiration/data/models/story_model.dart';
import 'package:find_inspiration/domain/entities/add_story.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class StoryRemoteDataSource {
  Future<TaskSnapshot> uploadImage(File file);
  Future<DocumentReference> addStory(AddStory addStory);
}

class StoryRemoteDataSourceImpl extends StoryRemoteDataSource {
  final _firebaseStorage = FirebaseStorage.instance;
  final _firebaseStore = FirebaseFirestore.instance;
  CollectionReference get  _stories => _firebaseStore.collection("stories");

/*
  @override
  Future<List<StoryModel>> storyList() async{
    Future.delayed(Duration(seconds: 2));
    return StoryDummyData().call();
  }
*/

  @override
  Future<TaskSnapshot> uploadImage(File file) async {
    TaskSnapshot taskSnapshot = await _firebaseStorage
        .ref("images/${file.path.split("/")}")
        .putFile(file);
    return taskSnapshot;
  }

  @override
  Future<DocumentReference> addStory(AddStory addStory) async {
    return _stories.add(addStory.toJson());
  }
}
