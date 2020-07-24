class SliderData {
  String imageURL, title, description;

  SliderData({this.description, this.imageURL, this.title});
  void setImage(String getImage) {
    imageURL = getImage;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  String getImage() {
    return imageURL;
  }

  String getDescription() {
    return description;
  }

  String getTitle() {
    return title;
  }
}

List<SliderData> getData() {
  List<SliderData> slider = List<SliderData>();

  // first
  SliderData sliderData = SliderData();
  sliderData.setDescription('Reach Out now');
  sliderData.setImage('Get best website and app development deals with us');
  sliderData.setTitle('images/s1.jpg');

  slider.add(sliderData);

//second
  sliderData = SliderData();

  sliderData.setDescription('Schedule Your Time');
  sliderData
      .setImage('We provide quality services with minimum delay book with us');
  sliderData.setTitle('images/s2.jpg');

  slider.add(sliderData);

//third
  sliderData = SliderData();

  sliderData.setDescription('Email Us');
  sliderData.setImage('We reply to every email within an Hour..');
  sliderData.setTitle('images/s3.jpg');

  slider.add(sliderData);

  return slider;
}
