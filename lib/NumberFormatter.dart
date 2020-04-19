numberFormatter(String receivedNumber) {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  return receivedNumber.replaceAllMapped(reg, mathFunc).toString();
}
