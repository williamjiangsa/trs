/*
 * 项目名:    trs.abf
 * 包名
 * 文件名:    my_special_text_span_builder
 * 创建时间:  2019/5/15 on 4:29 PM
 * 描述:     TODO
 *
 * @author   YHF
 */

import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';

import 'at_text.dart';
import 'dollar_text.dart';
import 'emoji_text.dart';

class MySpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  @override
  SpecialText createSpecialText(String flag,
      {TextStyle textStyle, SpecialTextGestureTapCallback onTap, int index}) {
    if (flag == null || flag == "") return null;
    // TODO: implement createSpecialText

    if (isStart(flag, AtText.flag)) {
      return AtText(textStyle, onTap);
    } else if (isStart(flag, EmojiText.flag)) {
      return EmojiText(textStyle);
    } else if (isStart(flag, DollarText.flag)) {
      return DollarText(textStyle, onTap);
    }
    return null;
  }
}
