import 'dart:io';

import 'package:find_inspiration/comman/constent.dart';
import 'package:find_inspiration/comman/translation_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateStoryController extends GetxController{

  final textEditingControllerPrice = TextEditingController();
  final textEditingControllerTitle = TextEditingController();

  var imageFile = File("").obs;

  var _priceError = Rx<String>(null);
  var _titleError = Rx<String>(null);
  Rx<String> get priceError => _priceError;
  Rx<String> get titleError => _titleError;

  var _isPriceValid = RxBool(false);
  var _isTitleValid = RxBool(false);
  var _isImageValid = RxBool(false);

  RxBool get isPriceValid => _isPriceValid;
  RxBool get isTitleValid => _isTitleValid;
  RxBool get isImageValid => _isImageValid;


  var isAllFieldValid = true;

  @override
  void onInit() {
    super.onInit();
    textEditingControllerPrice.addListener(_listenerPriceValue);
    textEditingControllerTitle.addListener(_listenerTitleValue);
  }

  final _picker = ImagePicker();


  Future getImageFromCamera() async {
    final pickedFileCamera = await _picker.getImage(source: ImageSource.camera);

    if (pickedFileCamera != null) {
      print('image selected. ${File(pickedFileCamera.path).path}');
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

   uploadData() async{

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
    if (Constant.titleRegExp.hasMatch(textEditingControllerTitle.text) && textEditingControllerTitle.text.trim().isNotEmpty) {
      _titleError.value = null;
      _isTitleValid.value = true;
    } else {
      _isTitleValid.value = false;
      _titleError.value =TranslationConstants.TITLE_ERROR;
    }
  }

  validateField() async {
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

}