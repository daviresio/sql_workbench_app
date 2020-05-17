class StringUtil {

  //TODO pegar o ultimo numero e somar caso exista
  static copyAddingNumber(String v) {
    return '$v (2)';
  }

  static extractMapFieldTostring(v, key) {
    if(v == null || key == null) return '';
    if(v[key] == null) return '';
    return v[key].toString();
  }

}