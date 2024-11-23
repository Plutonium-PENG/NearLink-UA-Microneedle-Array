import { ChildSheetListModelWithIcon } from '../../../models/Profile/ChildSheetModels/ChildSheetModels'
import AboutThisAppChildSheetViewModel
    from '../../../viewmodels/Profile/ChildSheetViewModels/AboutThisAppChildSheetViewModel'
import ColorModeChildSheetViewModel
    from '../../../viewmodels/Profile/ChildSheetViewModels/ColorModeChildSheetViewModel'


// 按引用传递
// @Builder
// export function colorModeChildSheetBuilder($$:{msg:string}) {}

@Builder
export function colorModeChildSheetBuilder() {

    Column({ space: 8 }) {

        List() {
            ForEach(
                ColorModeChildSheetViewModel.ColorModeChildSheetList,
                (item: ChildSheetListModelWithIcon) => {
                    ListItem() {
                        Column() {
                            Row({ space: 6 }) {
                                SymbolGlyph(item.icon)
                                Column() {
                                    Text(item.title)
                                        .alignSelf(ItemAlign.Start)
                                        .fontWeight(FontWeight.Medium)
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

                    }

                },
                (item: ChildSheetListModelWithIcon) => item.key
            )

        }
        .height('auto')
        .width('100%')
        .backgroundColor($r('app.color.background_light_accent'))
        .borderRadius(8)
        .divider({
            strokeWidth: 1,
            color: "#a0a0a0",
            startMargin: 36,
            endMargin: 12
        })

    }
    .height('100%')
    .width('100%')
    .padding(24)
}

@Builder
export function AboutThisAppChildSheetBuilder() {

    Column({ space: 8 }) {
        // SymbolGlyph($r('sys.symbol.character_square'))
        Image($r('app.media.app_icon'))
            .height(72)
            .width(72)

        Text($r('app.string.app_name'))
            .width('100%')
            .height('auto')
            .fontSize(24)//todo
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)

        List() {
            ForEach(
                AboutThisAppChildSheetViewModel.AboutThisAppChildSheetList,
                (item: ChildSheetListModelWithIcon) => {
                    ListItem() {
                        Column() {
                            Row({ space: 6 }) {
                                SymbolGlyph(item.icon)
                                Column() {
                                    Text(item.title)
                                        .alignSelf(ItemAlign.Start)
                                        .fontWeight(FontWeight.Medium)
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

                    }

                },
                (item: ChildSheetListModelWithIcon) => item.key
            )

        }
        .height('auto')
        .width('100%')
        .backgroundColor($r('app.color.background_light_accent'))
        .borderRadius(8)
        .divider({
            strokeWidth: 1,
            color: "#a0a0a0",
            startMargin: 36,
            endMargin: 12
        })

    }
    .height('100%')
    .width('100%')
    .padding(24)

}

@Builder
export function themeColorChildSheetBuilder() {
    Button("change height")
}


@Preview
@Component
struct TestPreview {
    build() {
        colorModeChildSheetBuilder()
    }
}

