// ignore: slash_for_doc_comments
/**
 * parseWeekDayToCnNum
 * @params {int} weekDay 要转换的星期数字
 * @return {String} 转换后的星期中文数字
 */
String parseWeekDayToCnNum(int weekDay) {
  if (weekDay > 7 || weekDay < 0) {
    print('get week Day Err: $weekDay');
    return null;
  }
  switch (weekDay) {
    case 1:
      return '一';
      break;
    case 2:
      return '二';
      break;
    case 3:
      return '三';
      break;
    case 4:
      return '四';
      break;
    case 5:
      return '五';
      break;
    case 6:
      return '六';
      break;
    default:
      return '日';
      break;
  }
}
