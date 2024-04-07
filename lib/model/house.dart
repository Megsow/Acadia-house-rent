class House {
  String name;
  String address;
  String imageUrl;

  House(this.name, this.address, this.imageUrl, String text);

  get contactInfo => null;

  get imageData => null;

  static List<House> generateBestOffer() {
    return [
      House('2 Bedroom 1 Bath', 'Hillside Avenue', 'assets/images/offer08.jpeg','Chhatak, Sylhet'),
      House('3 Bedroom 1 Bath', 'Pleasant Street', 'assets/images/offer05.jpeg','Chhatak, Sylhet'),
      House('1 Bedroom 1 Bath', 'Highland Avenue', 'assets/images/offer06.jpeg','Chhatak, Sylhet'),
      House('6 Bedroom 2 Bath', 'Summer Street', 'assets/images/offer07.jpeg','Chhatak, Sylhet'),
    ];
  }

}
