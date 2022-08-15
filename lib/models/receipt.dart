class Receipt{
  final String url;
  final String name;
  final String shop;
  final String sum;
  final String date;
  Receipt({required this.url, required this.name,required this.shop, required this.sum, required this.date});

  factory Receipt.initialData () {
    return Receipt(url: '', name: '', shop: '', sum: '', date: '');
  }
}