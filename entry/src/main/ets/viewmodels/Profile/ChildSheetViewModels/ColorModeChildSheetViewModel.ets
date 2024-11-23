import { SettingsChildSheetEnums } from '../../../common/enums/CommonEnums'
import { ChildSheetListModelWithIcon } from '../../../models/Profile/ChildSheetModels/ChildSheetModels'
import { ChildSheetListViewModelWithIcon } from './ChildSheetBacicViewModels'


@Observed
export class ColorModeChildSheetViewModel {
    ColorModeChildSheetList: ChildSheetListModelWithIcon[] =
        [
            // new ChildSheetListViewModelWithIcon({
            //     key: SettingsChildSheetEnums.AboutThisApp.EULA,
            //     title: $r('app.string.settings_aboutThisApp_title_EULA'),
            //     icon: $r('sys.symbol.doc_plaintext_and_checkmark'),
            //     action: () => {
            //
            //     }
            // }),
        ]
}

const colorModeChildSheetViewModel = new ColorModeChildSheetViewModel()

export default colorModeChildSheetViewModel as ColorModeChildSheetViewModel
