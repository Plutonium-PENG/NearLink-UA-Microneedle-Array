import { bundleManager } from '@kit.AbilityKit'
import { SettingsListItemOptions } from '../enums/CommonEnums'


export class CommonConstants {
    // static readonly appVersion: string = bundleManager
    //     .getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION)
    //     .versionName
    static readonly mainPreferenceFileName = "mainPref"
}

export class PreferenceDefaultValue {
    static readonly default_Appearance_ColorMode: number = SettingsListItemOptions.ColorModeOptions.LIGHT
}