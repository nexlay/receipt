class Receipt{
  final String url;
  final String name;
  final String shop;
  final String sum;
  Receipt({required this.url, required this.name,required this.shop, required this.sum});

  factory Receipt.initialData () {
    return Receipt(url: '', name: '', shop: '', sum: '');
  }
}