import {
    BasicChildSheetListModel,
    ChildSheetListModelWithIcon,
    ChildSheetListModelWithIconSelector
} from '../../../models/Profile/ChildSheetModels/ChildSheetModels'



@Observed
export class BasicChildSheetListViewModel implements BasicChildSheetListModel {
    key: string
    title: ResourceStr
    action: () => void

    constructor(
        object: BasicChildSheetListModel
    ) {
        this.key = object.key
        this.title = object.title
        this.action = object.action
    }
}


@Observed
export class ChildSheetListViewModelWithIcon extends BasicChildSheetListViewModel implements ChildSheetListModelWithIcon {
    icon: Resource

    constructor(
        object: ChildSheetListModelWithIcon
    ) {
        super({
            key: object.key,
            title: object.title,
            action: object.action
        })
        this.icon = object.icon
    }
}

@Observed
export class ChildSheetListViewModelWithIconSelector extends BasicChildSheetListViewModel implements ChildSheetListModelWithIconSelector {
    isSelected: boolean
    icon: Resource

    constructor(
        object: ChildSheetListModelWithIconSelector
    ) {
        super({
            key: object.key,
            title: object.title,
            action: object.action
        })
        this.isSelected = object.isSelected
        this.icon = object.icon
    }
}




