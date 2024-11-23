import { Home } from './Home'
import { Devices } from './Devices'
import { Profile } from './Profile'
import { StyleConstants } from '../common/constants/StyleConstants'
import { ConfigurationConstant } from '@kit.AbilityKit'


@Entry
@Component
struct Main {
  // @Consume('mainPageStack') pageStack: NavPathStack
  // const navPath: NavPathInfo = new NavPathInfo('AboutMePage', undefined)
  //this.pageStack.pushPath(navPath)
  @State currentPage: number = 0
  private mainTabsController: TabsController = new TabsController()
  // TODO
  @StorageProp('currentColorMode') @Watch('onColorModeChange') currentMode: number
    = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;

  aboutToAppear(): void {
    if (this.currentMode == ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      //当前为浅色模式，资源初始化逻辑
    }
    else {
      //当前为深色模式，资源初始化逻辑
    }
  }

  onColorModeChange(changedPropertyName: string) {
    if (this.currentMode == ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT) {
      //当前为浅色模式，资源初始化逻辑
    }
    else {
      //当前为深色模式，资源初始化逻辑
    }
  }

  @Builder
  TabBuilder(
    index: number,
    selectedIcon: Resource,
    unselectedIcon: Resource
  ) {
    Column() {
      SymbolGlyph(
        index == this.currentPage ? selectedIcon : unselectedIcon
      ).renderingStrategy(SymbolRenderingStrategy.MULTIPLE_OPACITY)

      Text(
        (() => {
          switch (index) {
            case 0:
              return $r('app.string.mainTab_home')
            case 1:
              return $r('app.string.mainTab_devices')
            case 2:
              return $r('app.string.mainTab_profile')
            default:
              return
          }
        }
        )() // 立即调用函数表达式(IIFE)
      ).fontSize('10fp')
        .fontWeight(500)
        .margin({ top: '4vp' })
    }
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  MainNavigationTitle(
    title: Resource,
    subtitle?: Resource
  ) {
    Column() {
      Flex({
        direction: FlexDirection.Column,
        wrap: FlexWrap.NoWrap,
        // alignItems: ItemAlign.Center
        // alignContent: FlexAlign.Center,
        justifyContent: FlexAlign.Center
      }) {
        Text(title)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        if (subtitle) {
          Text(subtitle)
            .fontSize(16)
            .opacity(0.2)
        }
      }
      .height('100%')
      .width('100%')
      .padding({
        left: StyleConstants.NAV_TITLE_MARGIN,
        right: StyleConstants.NAV_TITLE_MARGIN
      })
    }
    .height('100%')
    .width('100%')
    .alignSelf(ItemAlign.Center)
  }

  build() {
    Navigation() {
      // NavRouter() {
      //     Row() {
      //         Row()
      //             .width(30)
      //             .height(30)
      //             .borderRadius(30)
      //             .margin({ left: 3, right: 10 })
      //             .backgroundColor(Color.Pink)
      //         Text(`WLAN`)
      //             .fontSize(22)
      //             .fontWeight(500)
      //             .textAlign(TextAlign.Center)
      //     }
      //     .width('90%')
      //     .height(60)
      // }

      // NavDestination() {
      Tabs({
        barPosition: BarPosition.End,
        controller: this.mainTabsController
      }) {
        TabContent() {
          Home()
            .width('100%')
            .height('100%')
        }
        .tabBar(this.TabBuilder(
          0,
          $r('sys.symbol.house_fill'),
          $r('sys.symbol.house')
        ))

        TabContent() {
          Devices()
        }
        .tabBar(this.TabBuilder(
          1,
          $r('sys.symbol.watch_fill'),
          $r('sys.symbol.watch')
        ))

        TabContent() {
          Profile()
        }
        .tabBar(this.TabBuilder(
          2,
          $r('sys.symbol.person_fill'),
          $r('sys.symbol.person'),
        ))

      }
      .height('100%')
      .width('100%')
      .onChange((index: number) => {
        this.currentPage = index
      })
      .scrollable(false)
      .vertical(false)

      // .divider({
      //     strokeWidth: 0.5,
      //     color: '#0D182431'
      // }) TODO
    }
    .height('100%')
    .width('100%')
    .mode(NavigationMode.Auto)
    .title(
      this.MainNavigationTitle(
        (() => {
          switch (this.currentPage) {
            case 1:
              return $r('app.string.mainTab_devices')
            case 2:
              return $r('app.string.mainTab_profile')
            default:
              return $r('app.string.app_name')
          }
        }
        )(),
        // (() => {
        //   switch (this.currentPage) {
        //     case 1:
        //       return $r('app.string.mainTab_devices')
        //     case 2:
        //       return $r('app.string.mainTab_profile')
        //     default:
        //       return
        //   }
        // }
        // )()
      )
    )
    .titleMode(NavigationTitleMode.Mini)
    .menus(
      (() => {
        switch (this.currentPage) {
          case 1:

          default:

        }
      }
      )()
    )
    .hideBackButton(true)

  }
}
