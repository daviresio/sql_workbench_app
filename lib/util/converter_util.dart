class ConverterUtil {

  static String listToString(List<dynamic> lista) {
    if(lista == null) return null;
    if(lista.length == 0) return null;
    return lista.reduce((value, element) => value + ',' + element);
  }

  static List<String> stringToList(String value) {
    if(value == null) return [];
    return value.split(',');
  }

}