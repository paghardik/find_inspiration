enum UploadStatus{
  NORMAL,
  START,
  IN_PROGRESS,
  FINISHED
}
extension UploadStatusExtension on UploadStatus {

  int? get index {
    switch (this) {
      case UploadStatus.NORMAL:
        return 0;
      case UploadStatus.START:
        return 1;
      case UploadStatus.IN_PROGRESS:
        return 2;
      case UploadStatus.FINISHED:
        return 3;
      default:
        return null;
    }
  }

  bool get isShowProgress {
    switch (this) {
      case UploadStatus.FINISHED:
      case UploadStatus.NORMAL:
        return false;
      case UploadStatus.START:
      case UploadStatus.IN_PROGRESS:
        return true;
      default:
        return false;
    }
  }

  String? get name {
    switch(this){
      case UploadStatus.NORMAL:
        return "UploadStatus.NORMAL";
      case UploadStatus.START:
        return "UploadStatus.START";
      case UploadStatus.IN_PROGRESS:
        return "UploadStatus.IN_PROGRESS";
      case UploadStatus.FINISHED:
        return "UploadStatus.FINISHED";
      default:
        return null;
    }
  }

  void currentStatus() {
    print("Index: $index Status: $name");
  }
}



