export interface ISettingsGroup {
    key: string,
    title: Resource,
    items: ISettingsBasicItems[]
}

export interface ISettingsBasicItems {
    key: string,
    title: ResourceStr | string,
    subtitle?: ResourceStr | string,
    icon: Resource,
    properties?: ISettingsProperties,
}

export interface ISettingsItem_HasChildSheet extends ISettingsBasicItems {
    childSheet: ISettingsChildSheet,
}

export interface ISettingsItem_InstantAction extends ISettingsBasicItems {
    instantAction: () => void
}

export interface ISettingsItem_Toggle extends ISettingsBasicItems {
    isOn: boolean,
    childSettings?: IChildSettings[],
}

export interface ISettingsProperties {
    value: boolean | number,
    options: []
}

export interface IChildSettings {
    key: string
}

export interface ISettingsChildSheet {
height: number | SheetSize
content: WrappedBuilder<[]>
}
