@Preview
@Component
export struct Home {



  build() {
    /*RelativeContainer() {
      Text(this.message)
        .id('HomeHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')*/
    Column() {

    }
    .backgroundColor($r('app.color.background_light_main'))
    .height('100%')
    .width('100%')

  }
}

@Component
struct IntelligentSenseCard{
  build() {

  }
}
