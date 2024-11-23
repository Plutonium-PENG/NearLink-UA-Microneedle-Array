import { SettingsChildSheetEnums } from '../../../common/enums/CommonEnums'
import { ChildSheetListModelWithIcon } from '../../../models/Profile/ChildSheetModels/ChildSheetModels'
import { ChildSheetListViewModelWithIcon } from './ChildSheetBacicViewModels'


@Observed
export class AboutThisAppChildSheetViewModel {
    AboutThisAppChildSheetList: ChildSheetListModelWithIcon[] =
        [
            new ChildSheetListViewModelWithIcon({
                key: SettingsChildSheetEnums.AboutThisApp.EULA,
                title: $r('app.string.settings_aboutThisApp_title_EULA'),
                icon: $r('sys.symbol.doc_plaintext_and_checkmark'),
                action: () => {

                }
            }),
            new ChildSheetListViewModelWithIcon({
                key: SettingsChildSheetEnums.AboutThisApp.PRIVACY_AGREEMENT,
                title: $r('app.string.settings_aboutThisApp_title_privacyPolicy'),
                icon: $r('sys.symbol.person_shield'),
                action: () => {

                }
            }),
            new ChildSheetListViewModelWithIcon({
                key: "1",
                title: "开放源代码许可",
                icon: $r('sys.symbol.flower'),
                action: () => {

                }
            }),
            new ChildSheetListViewModelWithIcon({
                key: "2",
                title: "联系我们",
                icon: $r('sys.symbol.envelope'),
                action: () => {

                }
            })
        ]

}

const aboutThisAppChildSheetViewModel = new AboutThisAppChildSheetViewModel()

export default aboutThisAppChildSheetViewModel as AboutThisAppChildSheetViewModel