import {
    IChildSettings,
// ISettingsChildSheet,
    ISettingsGroup,
    ISettingsBasicItems,
    ISettingsProperties,
    ISettingsItem_HasChildSheet,
    ISettingsItem_InstantAction,
    ISettingsItem_Toggle,
    ISettingsChildSheet
} from '../../models/Profile/ProfileModels';
import { SettingsListEnums, SettingsListItemOptions } from '../../common/enums/CommonEnums'
import { promptAction } from '@kit.ArkUI'

import { CommonConstants, PreferenceDefaultValue } from '../../common/constants/CommonConstants';
import {
    AboutThisAppChildSheetBuilder,
    colorModeChildSheetBuilder,
    themeColorChildSheetBuilder
} from '../../views/Profile/ChildSheetBuilders/ChildSheetBuilders';
import PreferenceUtil from '../../common/utils/PreferenceUtil';
import { preferences } from '@kit.ArkData';


@Observed
export class SettingsBasicItemsModel implements ISettingsBasicItems {
    key: string
    title: ResourceStr | string
    subtitle?: ResourceStr | string
    icon: Resource
    properties?: ISettingsProperties

    constructor(
        object: ISettingsBasicItems
    ) {
        this.key = object.key
        this.title = object.title
        this.subtitle = object.subtitle
        this.icon = object.icon
        this.properties = object.properties
    }
}

@Observed
export class SettingsItem_HasChildSheet extends SettingsBasicItemsModel implements ISettingsItem_HasChildSheet {
    childSheet: ISettingsChildSheet

    constructor(
        object: ISettingsItem_HasChildSheet
    ) {
        super({
            key: object.key,
            title: object.title,
            subtitle: object.subtitle,
            icon: object.icon,
            properties: object.properties
        });
        this.childSheet = object.childSheet
    }
}

@Observed
export class SettingsItem_InstantAction extends SettingsBasicItemsModel implements ISettingsItem_InstantAction {
    instantAction: () => void

    constructor(
        object: ISettingsItem_InstantAction
    ) {
        super({
            key: object.key,
            title: object.title,
            subtitle: object.subtitle,
            icon: object.icon,
            properties: object.properties
        });
        this.instantAction = object.instantAction
    }
}

@Observed
export class SettingsItem_Toggle extends SettingsBasicItemsModel implements ISettingsItem_Toggle {
    isOn: boolean
    childSettings?: IChildSettings[];

    constructor(
        object: ISettingsItem_Toggle
    ) {
        super({
            key: object.key,
            title: object.title,
            subtitle: object.subtitle,
            icon: object.icon,
            properties: object.properties
        });
        this.isOn = object.isOn
        this.childSettings = object.childSettings
    }
}

@Observed
export class SettingsGroupModel implements ISettingsGroup {
    key: string
    title: Resource
    items: ISettingsBasicItems[]

    constructor(object: ISettingsGroup) {
        this.key = object.key
        this.title = object.title
        this.items = object.items
    }
}


@Observed
export class SettingsViewModel {
    private settingsValues: Map<string, preferences.ValueType> = new Map()
    settingsList: ISettingsGroup[] = []

    constructor() {
        this.loadSettings()
    }

    async loadSettings() {
        this.settingsValues.set(
            SettingsListEnums.Appearance.COLOR_MODE,
            await PreferenceUtil.getPreferenceValue(
                CommonConstants.mainPreferenceFileName,
                SettingsListEnums.Appearance.COLOR_MODE,
                PreferenceDefaultValue.default_Appearance_ColorMode
            ) as number)

        this.settingsList = this.prepareData()
    }

    prepareData() {
        let data = [
            new SettingsGroupModel({
                key: SettingsListEnums.Groups.APPEARANCE,
                title: $r('app.string.settingsList_group_title_appearance'),
                items: [
                    new SettingsItem_HasChildSheet({
                        key: SettingsListEnums.Appearance.COLOR_MODE,
                        title: $r('app.string.settingsList_item_title_appearance_colorMode'),
                        subtitle: (() => {
                            let which = this.settingsValues.get(SettingsListEnums.Appearance.COLOR_MODE)
                            console.log(`which:${which}`)
                            switch (which) {
                                case SettingsListItemOptions.ColorModeOptions.LIGHT:
                                    return $r('app.string.settingsList_item_subtitle_appearance_colorMode_light')
                                case SettingsListItemOptions.ColorModeOptions.DARK:
                                    return $r('app.string.settingsList_item_subtitle_appearance_colorMode_dark')
                                default:
                                    return $r('app.string.settingsList_item_subtitle_appearance_colorMode_systemDefault')
                            }
                        }
                        )(),
                        icon: $r('sys.symbol.moon'),
                        childSheet: {
                            height: SheetSize.MEDIUM,
                            content: wrapBuilder(colorModeChildSheetBuilder)
                        }
                    }),
                    //     // // instantAction: () => {
                    //     // //     AlertDialogs.OKAlertDialog(
                    //     // //         "标题",
                    //     // //         "初始化成功",
                    //     // //         // getContext(this) as common.UIAbilityContext
                    //     // //     )
                    //     // // },
                    //
                    //     // properties: {
                    //     //     value: 0 //TODO
                    //     // }
                    //
                    // }),
                    new SettingsItem_HasChildSheet({
                        key: SettingsListEnums.Appearance.THEME_COLOR,
                        title: $r('app.string.settingsList_item_title_appearance_themeColor'),
                        icon: $r('sys.symbol.paintpalette'),
                        childSheet: {
                            height: SheetSize.MEDIUM,
                            content: wrapBuilder(themeColorChildSheetBuilder)
                        }
                    })
                ]
            }),
            // new SettingsGroupModel({
            //     key: SettingsListEnums.Groups.BILLING,
            //     title: $r('app.string.settingsList_group_title_billing'),
            //     items: [
            //         new SettingsItem_HasChildSheet({
            //             key: "todo10086",
            //             title: "todo",
            //             subtitle: $r('app.string.settingsList_item_subtitle_data_export'),
            //             icon: $r('sys.symbol.upload'),
            //             childSheet: {
            //                 height: SheetSize.MEDIUM,
            //                 content: wrapBuilder(colorModeChildSheetBuilder)
            //             },
            //             // properties: {
            //             //     options:[],
            //             //     value: 0
            //             // }
            //         }),
            //         new SettingsItem_HasChildSheet({
            //             key: "todo3",
            //             title: $r('app.string.settingsList_item_title_data_export'),
            //             subtitle: $r('app.string.settingsList_item_subtitle_data_export'),
            //             icon: $r('sys.symbol.upload'),
            //             childSheet: {
            //                 height: SheetSize.MEDIUM,
            //                 content: wrapBuilder(colorModeChildSheetBuilder)
            //             },
            //             // properties: {
            //             //     value: 0
            //             // }
            //         }),
            //         new SettingsItem_HasChildSheet({
            //             key: "todo2",
            //             title: $r('app.string.settingsList_item_title_data_export'),
            //             subtitle: $r('app.string.settingsList_item_subtitle_data_export'),
            //             icon: $r('sys.symbol.upload'),
            //             childSheet: {
            //                 height: SheetSize.MEDIUM,
            //                 content: wrapBuilder(colorModeChildSheetBuilder)
            //             },
            //             // properties: {
            //             //     value: 0
            //             // }
            //         })
            //     ]
            // }),
            // new SettingsGroupModel({
            //     key: SettingsListEnums.Groups.DATA,
            //     title: $r('app.string.settingsList_group_title_data'),
            //     items: [
            //         new SettingsItem_HasChildSheet({
            //             key: SettingsListEnums.Data.EXPORT,
            //             title: $r('app.string.settingsList_item_title_data_export'),
            //             subtitle: $r('app.string.settingsList_item_subtitle_data_export'),
            //             icon: $r('sys.symbol.upload'),
            //             childSheet: {
            //                 height: SheetSize.MEDIUM,
            //                 content: wrapBuilder(colorModeChildSheetBuilder)
            //             },
            //         }),
            //         new SettingsItem_HasChildSheet({
            //             key: SettingsListEnums.Data.IMPORT,
            //             title: $r('app.string.settingsList_item_title_data_import'),
            //             subtitle: $r('app.string.settingsList_item_subtitle_data_import'),
            //             icon: $r('sys.symbol.download'),
            //             childSheet: {
            //                 height: SheetSize.MEDIUM,
            //                 content: wrapBuilder(colorModeChildSheetBuilder)
            //             },
            //         })
            //     ]
            // }),
            // new SettingsGroupModel({
            //     key: SettingsListEnums.Groups.SECURITY,
            //     title: $r('app.string.settingsList_group_title_security'),
            //     items: [
            //         new SettingsItem_Toggle({
            //             key: SettingsListEnums.Security.APP_LOCK,
            //             title: $r('app.string.settingsList_item_title_security_appLock'),
            //             subtitle: $r('app.string.settingsList_item_subtitle_security_appLock'),
            //             icon: $r('sys.symbol.lock'),
            //             isOn: false,
            //             childSettings: [
            //                 {
            //                     key: SettingsListEnums.Security.UNLOCK_METHOD
            //                 },
            //                 {
            //                     key: SettingsListEnums.Security.TIME_OUT
            //                 }
            //             ]
            //         }),
            //         new SettingsItem_HasChildSheet({
            //             key: SettingsListEnums.Security.UNLOCK_METHOD,
            //             title: $r('app.string.settingsList_item_title_security_unlockMethod'),
            //             subtitle: $r('app.string.settingsList_item_subtitle_security_unlockMethod'),
            //             icon: $r('sys.symbol.key'),
            //             childSheet: {
            //                 height: SheetSize.MEDIUM,
            //                 content: wrapBuilder(colorModeChildSheetBuilder)
            //             }
            //         }),
            //         new SettingsItem_HasChildSheet({
            //             key: SettingsListEnums.Security.TIME_OUT,
            //             title: $r('app.string.settingsList_item_title_security_lockTimeout'),
            //             subtitle: $r('app.string.settingsList_item_subtitle_security_lockTimeout'),
            //             icon: $r('sys.symbol.clock'),
            //             childSheet: {
            //                 height: SheetSize.MEDIUM,
            //                 content: wrapBuilder(colorModeChildSheetBuilder)
            //             }
            //         })
            //     ]
            // }),
            new SettingsGroupModel({
                key: SettingsListEnums.Groups.ABOUT,
                title: $r('app.string.settingsList_group_title_about'),
                items: [
                    new SettingsItem_HasChildSheet({
                        key: SettingsListEnums.About.ABOUT_THIS_APP,
                        title: $r('app.string.settingsList_item_title_about_aboutThisApp'),
                        //subtitle: CommonConstants.appVersion,
                        icon: $r('sys.symbol.info_circle'),
                        childSheet: {
                            height: SheetSize.LARGE,
                            content: wrapBuilder(AboutThisAppChildSheetBuilder)
                        }
                    }),
                    // new SettingsItem_InstantAction({
                    //     key: SettingsListEnums.About.CHECK_UPGRADE,
                    //     title: $r('app.string.settingsList_item_title_about_checkUpgrade'),
                    //     icon: $r('sys.symbol.arrowshape_up_frame'),
                    //     instantAction: () => {
                    //         promptAction.showToast({
                    //             message: $r('app.string.settings_toast_checkingUpgrade')
                    //         });
                    //     }
                    // })
                ]
            })
        ]

        return data
    }
}

const settingsViewModel = new SettingsViewModel()

export default settingsViewModel as SettingsViewModel



