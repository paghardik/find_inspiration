class AddStory {
  String? title;
  String? price;
  String? imageUrl;

  AddStory({this.title, this.price, this.imageUrl});

  AddStory.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}