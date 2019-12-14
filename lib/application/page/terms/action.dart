import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TermsAction { action ,agree,next}

class TermsActionCreator {
  static Action onAction() {
    return const Action(TermsAction.action);
  }

  static Action onAgreeAction() {
    return const Action(TermsAction.agree);
  }

  static Action onNextAction() {
    return const Action(TermsAction.next);
  }
}
