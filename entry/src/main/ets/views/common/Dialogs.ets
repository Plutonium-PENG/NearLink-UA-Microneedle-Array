import { common } from '@kit.AbilityKit';


// AlertDialogs 类
export class AlertDialogs {
    /**
     * 具有OK操作的AlertDialog。
     * @param title 标题
     * @param message 提示信息
     * @param context 需要保存状态的UIAbility所对应的context
     */
    static OKAlertDialog(
        title: ResourceStr,
        message: ResourceStr,
        // context?: common.UIAbilityContext,
    ) {
        AlertDialog.show({
            title: title,
            message: message,
            alignment: DialogAlignment.Bottom,
            buttons: [
                {
                    value: $r('app.string.views_dialogs_button_OK'),
                    action: () => {
                        return
                    }
                }
            ]
        })
    }

    /**
     * 具有确认和取消操作的AlertDialog。
     * @param title 标题
     * @param msg 提示信息
     * @param context 需要保存状态的UIAbility所对应的context
     * @param primaryCallback 第一个按钮点击事件的回调
     * @param secondCallback 第二个按钮点击事件的回调
     */
    static cancelConfirmAlertDialog(
        title: ResourceStr,
        message: ResourceStr,
        cancelCallback: Function,
        ConfirmCallbackText: ResourceStr,
        ConfirmCallback: Function,
        context?: common.UIAbilityContext,
    ) {
        AlertDialog.show({
            title: title,
            message: message,
            alignment: DialogAlignment.Bottom,
            buttons: [
                {
                    value: $r('app.string.views_dialogs_button_cancel'),
                    action: () => {
                        cancelCallback()
                    }
                },
                {
                    value: '按钮',
                    enabled: true,
                    defaultFocus: true,
                    style: DialogButtonStyle.HIGHLIGHT,
                    action: () => {
                        ConfirmCallback()
                    }
                }
            ]
            // primaryButton: {
            //     value: $r('app.string.views_dialogs_button_confirm'),
            //     action: () => {
            //         primaryCallback();
            //     }
            // },
            // secondaryButton: {
            //     value: $r('app.string.views_dialogs_button_cancel'),
            //     action: () => {
            //         context.terminateSelf()
            //         secondCallback();
            //     }
            // }
        })
    }

    static cancelNeutralConfirmAlertDialog(
        title: ResourceStr | string,
        msg: ResourceStr | string,
        context: common.UIAbilityContext,
    ) {
        AlertDialog.show({
            title: title,
            message: msg,
            alignment: DialogAlignment.Bottom,
            offset: {
                dx: 0,
                dy: 0
            },
            primaryButton: {
                value: $r('app.string.views_dialogs_button_OK'),
                action: () => {
                    //context.terminateSelf()

                }
            },
            secondaryButton: {
                value: "",
                action: () => {

                }
            },

        })
    }
}


// 自定义对话框和次级对话框
// @CustomDialog
// struct CustomDialogExampleTwo {
//     controllerTwo?: CustomDialogController
//
//     build() {
//         Column() {
//             Text('我是第二个弹窗')
//                 .fontSize(30)
//                 .height(100)
//             Button('点我关闭第二个弹窗')
//                 .onClick(() => {
//                     if (this.controllerTwo != undefined) {
//                         this.controllerTwo.close()
//                     }
//                 })
//                 .margin(20)
//         }
//     }
// }
//

// @Preview
// @CustomDialog
// @Component
// export struct CustomDialogExample {
//     @Link textValue: string
//     @Link inputValue: string
//     dialogControllerTwo: CustomDialogController | null = new CustomDialogController({
//         builder: CustomDialogExampleTwo(),
//         alignment: DialogAlignment.Bottom,
//         onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
//             console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
//             console.log("dialog onWillDismiss")
//             if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
//                 dismissDialogAction.dismiss()
//             }
//             if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
//                 dismissDialogAction.dismiss()
//             }
//         },
//         offset: { dx: 0, dy: -25 }
//     })
//     controller?: CustomDialogController
//     // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在所有controller的后面
//     cancel: () => void = () => {
//     }
//     confirm: () => void = () => {
//     }
//
//     build() {
//         Column() {
//             Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
//             TextInput({ placeholder: '', text: this.textValue }).height(60).width('90%')
//                 .onChange((value: string) => {
//                     this.textValue = value
//                 })
//             Text('Whether to change a text?').fontSize(16).margin({ bottom: 10 })
//             Flex({ justifyContent: FlexAlign.SpaceAround }) {
//                 Button('cancel')
//                     .onClick(() => {
//                         if (this.controller != undefined) {
//                             this.controller.close()
//                             this.cancel()
//                         }
//                     }).backgroundColor(0xffffff).fontColor(Color.Black)
//                 Button('confirm')
//                     .onClick(() => {
//                         if (this.controller != undefined) {
//                             this.inputValue = this.textValue
//                             this.controller.close()
//                             this.confirm()
//                         }
//                     }).backgroundColor(0xffffff).fontColor(Color.Red)
//             }.margin({ bottom: 10 })
//
//             Button('点我打开第二个弹窗')
//                 .onClick(() => {
//                     if (this.dialogControllerTwo != null) {
//                         this.dialogControllerTwo.open()
//                     }
//                 })
//                 .margin(20)
//         }.borderRadius(10)
//
//         // 如果需要使用border属性或cornerRadius属性，请和borderRadius属性一起使用。
//     }
// }



