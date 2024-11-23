export interface BasicChildSheetListModel {
    key: string,
    title: ResourceStr | string
    action: () => void
}

export interface ChildSheetListModelWithIcon extends BasicChildSheetListModel {
    icon: Resource,
}

export interface ChildSheetListModelWithIconSelector extends BasicChildSheetListModel {
    isSelected: boolean,
    icon: Resource,
}
