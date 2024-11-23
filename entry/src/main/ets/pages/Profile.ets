import settingsViewModel, {
    SettingsBasicItemsModel,
    SettingsItem_HasChildSheet,
    SettingsItem_InstantAction,
    SettingsItem_Toggle,
} from '../viewmodels/Profile/ProfileViewModel'
import { ISettingsGroup, ISettingsBasicItems } from '../models/Profile/ProfileModels';
import { UserCardViewModel, UserType } from '../viewmodels/Profile/UserCardViewModel'
import { AlertDialogs } from '../views/common/Dialogs';
import { BasicIDataSource } from '../common/utils/BasicDataSource';


@Preview
@Component
export struct Profile {
    aboutToAppear(): void {

    }

    build() {
        Flex({
            direction: FlexDirection.Column,
            wrap: FlexWrap.NoWrap,
        }) {
            UserCard()
                .height('auto')
                .width('100%')

            SettingsList()
                .height('auto')
                .width('100%')
        }
        .height('100%')
        .width('100%')
        .backgroundColor($r('app.color.background_light_main'))
    }
}


@Component
struct UserCard {
    @State currentUser: UserType = UserCardViewModel.getUserInfo()

    build() {
        Column() {
            Column() {
                Row({ space: 12 }) {
                    if (this.currentUser.isLogin) {
                        Image(undefined)//TODO
                            .height(50)
                            .width(50)
                            .objectFit(ImageFit.Cover)

                        //TODO
                        Column() {
                            Text("用户名")//TODO getUserInfo 和 超长文本
                                .fontSize(20)
                                .fontWeight(FontWeight.Bold)
                                .alignSelf(ItemAlign.Start)
                            Text("114514@1919810.com")//TODO
                                .fontSize(12)
                                .alignSelf(ItemAlign.Start)

                        }

                        Blank()
                        Button({
                            type: ButtonType.Normal
                        }) {
                            if (this.currentUser.membership < 0) {
                                Text($r('app.string.userCard_button_membership_permanent'))

                            }
                            else {
                                Text($r('app.string.userCard_button_membership_leftDays', this.currentUser.membership))
                            }

                        }
                        .height('auto')
                        .width('auto')
                        .borderRadius(8)
                        .padding(12)
                        .width(64)
                    }
                    else {
                        SymbolGlyph($r('sys.symbol.person_crop_circle_fill_1'))
                            .fontSize(50)
                            .height(50)
                            .width(50)
                        Column() {
                            Text($r('app.string.userCard_title_notLoggedIn'))
                                .fontSize(20)
                                .fontWeight(FontWeight.Bold)
                                .alignSelf(ItemAlign.Start)
                            Text($r('app.string.userCard_subtitle_notLoggedIn'))
                                .fontSize(12)
                                .alignSelf(ItemAlign.Start)
                        }

                        Blank()
                        Button({
                            type: ButtonType.Normal
                        }) {
                            Text($r('app.string.userCard_button_login'))
                                .fontSize(14)//TODO
                                .fontColor($r('sys.color.white')) //TODO
                        }
                        .height('auto')
                        .width('auto')
                        .borderRadius(16)
                        .padding({
                            left: 16,
                            right: 16,
                            top: 8,
                            bottom: 8
                        })
                        .onClick(() => {
                            AlertDialogs.OKAlertDialog(
                                $r('app.string.views_dialogs_title_toBeSupport'),
                                $r('app.string.views_dialogs_message_toBeSupport')
                            )
                        })
                    }
                }
                .width('100%')
                .height('auto')
                .padding(12)
                .alignSelf(ItemAlign.Start)
            }
            .height('auto')
            .width('100%')
            .backgroundColor($r('app.color.background_light_accent'))
            .borderRadius(8)
        }
        .height('auto')
        .width('100%')
        .padding(12)
    }
}

@Component
struct SettingsList {
    // @Provide settingsList: IDataSource = new BasicIDataSource([])

    async aboutToAppear(): Promise<void> {
        // 准备设置列表数据

    }

    @Builder
    SettingsGroupHead(item: ISettingsGroup) {
        Column() {
            Text(item.title)
                .fontSize(12)
        }
        .padding({
            left: 12,
            right: 12,
            top: 12
        })
    }

    build() {
        Scroll() {
            List({
                space: 6
            }) {
                LazyForEach(
                    //this.settingsList,
                    new BasicIDataSource(settingsViewModel.settingsList),
                    (item: ISettingsGroup) => {
                        ListItemGroup({
                            space: 2,
                            header: this.SettingsGroupHead(item)
                        }) {
                            ForEach(
                                item.items,
                                (items: ISettingsBasicItems) => {
                                    ListItem() {
                                        SettingsItem({
                                            item: items,
                                        })
                                    }
                                },
                                (items: ISettingsBasicItems) => items.key
                            )
                        }
                        .divider({
                            strokeWidth: 1,
                            color: "#a0a0a0",
                            startMargin: 36,
                            endMargin: 12
                        })
                        .backgroundColor($r('app.color.background_light_accent')) //TODO
                        .borderRadius(16)
                        .align(Alignment.Top)
                    },
                    (item: ISettingsGroup) => item.key
                )
            }
            .height('100%')
            .width('100%')
            .padding({
                left: 12,
                right: 12,
                bottom: 12
            })
        }
    }
}

@Component
struct SettingsItem {
    @ObjectLink item: SettingsBasicItemsModel
    @State isItemChildSheetShow: boolean = false

    build() {

        if (this.item instanceof SettingsItem_HasChildSheet) {
            Column() {
                Row({ space: 6 }) {
                    SymbolGlyph(this.item.icon)
                    Column() {
                        Text(this.item.title)
                            .alignSelf(ItemAlign.Start)
                            .fontWeight(FontWeight.Medium)
                        Text(this.item.subtitle)
                            .fontSize(12)
                            .alignSelf(ItemAlign.Start)
                            .fontWeight(FontWeight.Regular)
                    }

                    Blank()

                    SymbolGlyph($r('sys.symbol.chevron_right'))
                }
                .alignSelf(ItemAlign.Start)
                .height('auto')
                .width('100%')
            }
            .height('auto')
            .width('100%')
            .padding(12)
            .bindSheet($$this.isItemChildSheetShow,
                this.item.childSheet.content.builder,
                {
                    height: this.item.childSheet.height,
                    backgroundColor: $r('app.color.background_light_main'),
                    onWillAppear: () => {
                        console.log("BindSheet onWillAppear.")
                    },
                    onAppear: () => {
                        console.log("BindSheet onAppear.")
                    },
                    onWillDisappear: () => {
                        console.log("BindSheet onWillDisappear.")
                    },
                    onDisappear: () => {
                        console.log("BindSheet onDisappear.")
                    }
                })
            .onClick(() => {
                this.isItemChildSheetShow = true
            })

        }
        else if (this.item instanceof SettingsItem_InstantAction) {
            Column() {
                Row({ space: 6 }) {
                    SymbolGlyph(this.item.icon)
                    Column() {
                        Text(this.item.title)
                            .alignSelf(ItemAlign.Start)
                            .fontWeight(FontWeight.Medium)
                        Text(this.item.subtitle)
                            .fontSize(12)
                            .alignSelf(ItemAlign.Start)
                            .fontWeight(FontWeight.Regular)
                    }

                    Blank()

                    SymbolGlyph($r('sys.symbol.chevron_right'))
                }
                .alignSelf(ItemAlign.Start)
                .height('auto')
                .width('100%')
            }
            .height('auto')
            .width('100%')
            .padding(12)
            .onClick(
                this.item.instantAction
            )
        }
        else if (this.item instanceof SettingsItem_Toggle) {
            Column() {
                Row({ space: 6 }) {
                    SymbolGlyph(this.item.icon)
                    Column() {
                        Text(this.item.title)
                            .alignSelf(ItemAlign.Start)
                            .fontWeight(FontWeight.Medium)
                        Text(this.item.subtitle)
                            .fontSize(12)
                            .alignSelf(ItemAlign.Start)
                            .fontWeight(FontWeight.Regular)
                    }

                    Blank()

                    Toggle({
                        type: ToggleType.Switch
                    })
                }
                .alignSelf(ItemAlign.Start)
                .height('auto')
                .width('100%')
            }
            .height('auto')
            .width('100%')
            .padding(12)
        }
        else {
            // 预留
        }
    }
}
