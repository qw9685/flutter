import 'package:tip_dialog/tip_dialog.dart';

void showLoading(TipDialogController tipController) async{
      tipController.show(
          tipDialog: new TipDialog(type: TipDialogType.LOADING, tip: "Loading"),
          isAutoDismiss: false);
}

void hideLoading(TipDialogController tipController) async{
        // await new Future.delayed(new Duration(seconds: 3));
        tipController.dismiss();
}

void showTip(TipDialogController tipController,String message) async{
      tipController.show(
          tipDialog: new TipDialog(type: TipDialogType.NOTHING, tip: message),
          isAutoDismiss: false);
                  await new Future.delayed(new Duration(seconds: 2));
        tipController.dismiss();
}

void showFail(TipDialogController tipController,String message) async{
      tipController.show(
          tipDialog: new TipDialog(type: TipDialogType.FAIL, tip: message),
          isAutoDismiss: false);
                  await new Future.delayed(new Duration(seconds: 2));
        tipController.dismiss();
}

void showSuccess(TipDialogController tipController,String message) async{
      tipController.show(
          tipDialog: new TipDialog(type: TipDialogType.SUCCESS, tip: message),
          isAutoDismiss: false);
                  await new Future.delayed(new Duration(seconds: 2));
        tipController.dismiss();
}