export namespace MainTabEnums {
    export enum TabLabels {

    }
}

export namespace SettingsListEnums {

    export enum Groups {
        APPEARANCE = "appearance",
        SECURITY = "security",
        BILLING = "billing",
        DATA = "data",
        ABOUT = "about"
    }

    export enum Appearance {
        COLOR_MODE = "appearance_colorMode",
        THEME_COLOR = "appearance_themeColor"
    }

    export enum Billing {

    }

    export enum Data {
        EXPORT = "data_export",
        IMPORT = "data_import"
    }

    export enum Security {
        APP_LOCK = "security_appLock",
        UNLOCK_METHOD = "security_unlockMethod",
        TIME_OUT = "security_timeOut"

    }

    export enum About {
        ABOUT_THIS_APP = "about_aboutThisApp",
        CHECK_UPGRADE = "about_checkUpgrade"
    }




}

export namespace SettingsListItemOptions {
    export enum ColorModeOptions {
        LIGHT,
        DARK,
        SYSTEM_DEFAULT
    }

    export enum ThemeColor {
        HARMONY_BLUE,

    }
}

export namespace SettingsChildSheetEnums {
    export enum AboutThisApp {
        EULA = "aboutThisApp_EULA",
        PRIVACY_AGREEMENT = "aboutThisApp_privacyAgreement",
        OPEN_SOURCE_LICENSES = "aboutThisApp_openSourceLicenses"
    }
}

export namespace AppGlobalConfigEnums {
    export enum Preference {

        PRIVACY_AGREEMENT = "misc_privacyAgreement",
        EULA = "misc_EULA",
    }
}

