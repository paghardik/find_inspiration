import 'dart:io';

import 'package:find_inspiration/comman/constent.dart';
import 'package:find_inspiration/comman/translation_constants.dart';
import 'package:find_inspiration/data/datasources/story_local_data_source.dart';
import 'package:find_inspiration/data/datasources/story_remote_data_source.dart';
import 'package:find_inspiration/data/repository/story_repository_impli.dart';
import 'package:find_inspiration/domain/entities/add_story.dart';
import 'package:find_inspiration/domain/entities/app_error.dart';
import 'package:find_inspiration/domain/repository/story_repository.dart';
import 'package:find_inspiration/domain/usecase/add_story.dart';
import 'package:find_inspiration/domain/usecase/upload_image.dart';
import 'package:find_inspiration/presentation/themes/app_colors.dart';
import 'package:find_inspiration/presentation/ui/create_story/components/upload_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateStoryController extends GetxController {

  final textEditingControllerPrice = TextEditingController();
  final textEditingControllerTitle = TextEditingController();

  var imageFile = File("").obs;

  var _priceError = Rx<String>(null);
  var _titleError = Rx<String>(null);
  Rx<String> get priceError => _priceError;
  Rx<String> get titleError => _titleError;


  /*this flag use for button enable or disable*/
  var _isPriceValid = RxBool(false);
  var _isTitleValid = RxBool(false);
  var _isImageValid = RxBool(false);
  RxBool get isPriceValid => _isPriceValid;
  RxBool get isTitleValid => _isTitleValid;
  RxBool get isImageValid => _isImageValid;

  /*Use case*/
  UploadImage? _uploadImage;
  AddStores? _addStores;

  StoryRepository? _storyRepository;
  StoryLocalDataSource? _storyLocalDataSource;
  StoryRemoteDataSource? _storyRemoteDataSource;

  /*based on Upload status we hide and show circular indicator*/
  var uploadStatus = UploadStatus.NORMAL.obs;

  var isAllFieldValid = true;
  final _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    textEditingControllerPrice.addListener(_listenerPriceValue);
    textEditingControllerTitle.addListener(_listenerTitleValue);

    _storyLocalDataSource = StoryLocalDataSourceImpl();
    _storyRemoteDataSource = StoryRemoteDataSourceImpl();
    _storyRepository =
        StoryRepositoryImpl(_storyLocalDataSource!, _storyRemoteDataSource!);
    _uploadImage = UploadImage(_storyRepository!);
    _addStores = AddStores(_storyRepository!);
  }

  Future getImageFromCamera() async {
    final pickedFileCamera = await _picker.getImage(source: ImageSource.camera);

    if (pickedFileCamera != null) {
      imageFile.value = File(pickedFileCamera.path);
      _isImageValid.value = true;
      update();
    } else {
      print('No image selected.');
      _isImageValid.value = false;
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
      _isImageValid.value = true;
      update();
    } else {
      print('No image selected.');
      _isImageValid.value = false;
    }
  }

  /*upload image on firestore*/
  uploadData() async {
    if (imageFile.value.path.isNotEmpty) {
      uploadStatus.value = UploadStatus.IN_PROGRESS;
      var uploadImageEitherResult = await _uploadImage!.call(imageFile.value);
      uploadImageEitherResult.fold(
          (l) => showErrorMessage(l), (r) {
            _uploadInfo(r);
      });
    }
  }

  _listenerPriceValue() {
    if (Constant.priceRegExp.hasMatch(textEditingControllerPrice.text)) {
      _priceError.value = null;
      _isPriceValid.value = true;
    } else {
      _isPriceValid.value = false;
      _priceError.value = TranslationConstants.PRICE_ERROR;
    }
  }

  _listenerTitleValue() {
    if (Constant.titleRegExp.hasMatch(textEditingControllerTitle.text) &&
        textEditingControllerTitle.text.trim().isNotEmpty) {
      _titleError.value = null;
      _isTitleValid.value = true;
    } else {
      _isTitleValid.value = false;
      _titleError.value = TranslationConstants.TITLE_ERROR;
    }
  }

  _validateField() async {
    isAllFieldValid = true;
    if (Constant.priceRegExp.hasMatch(textEditingControllerPrice.text)) {
      _priceError.value = null;
    } else {
      isAllFieldValid = false;
      _priceError.value = "Invalid Price";
    }

    if (textEditingControllerTitle.text.length > 2) {
      _titleError.value = null;
    } else {
      isAllFieldValid = false;
      _titleError.value = "Enter at least 2 characters";
    }
  }

  /*All controller must be disposed for preventing memory leak*/
  @override
  void dispose() {
    textEditingControllerPrice.dispose();
    textEditingControllerTitle.dispose();
    super.dispose();
  }

  showErrorMessage(AppError appError) {
    uploadStatus.value = UploadStatus.FINISHED;
  }

  /*upload image url and story info on Firebase*/
  _uploadInfo(String imageUrl) async {
    var story = AddStory(
        title: textEditingControllerTitle.text,
        price: textEditingControllerPrice.text  +  " CHF",
        imageUrl: imageUrl);
    var resultEither = await _addStores!.call(story);

    resultEither.fold((l) {
      uploadStatus.value = UploadStatus.FINISHED;
      _showMessage(TranslationConstants.FAILED,TranslationConstants.FAILED_MSG);
      _wipeData();
    }, (r) {
      uploadStatus.value = UploadStatus.FINISHED;
      _showMessage(TranslationConstants.SUCCESS, TranslationConstants.SUCCESS_MSG);
      _wipeData();
    });


  }

  _showMessage(String title, String message){
    Get.snackbar(
      "Success",
      "",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.appBarColor,
      barBlur: 0.5,
      borderRadius: 0.0,
      duration: Duration(milliseconds: 2000),
      margin: EdgeInsets.symmetric(
          horizontal: 20, vertical: 20),
      overlayBlur: 0.5,
    );
  }

  _wipeData() {
    imageFile.value = File("");
    _isPriceValid.value = false;
    _isTitleValid.value = false;
    _isImageValid.value = false;
    textEditingControllerTitle.clear();
    textEditingControllerPrice.clear();
    _titleError.value = null;
    _priceError.value = null;
  }
}
