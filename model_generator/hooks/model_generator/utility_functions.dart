bool isEntryListObject(MapEntry entry) {
  bool entryIsList = entry.value is List;
  bool entryDataIsMap = false;
  if (entryIsList) {
    var listData = entry.value as List;
    entryDataIsMap = listData.isNotEmpty && listData.first is Map;
  }
  return entryIsList && entryDataIsMap;
}
