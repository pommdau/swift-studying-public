# [iOS Dev Weekly - Issue 668](https://iosdevweekly.com/issues/668)

## General
- SwiftPMのセキュリティ問題
- SwiftPM Repositoryを使ってzipアーカイブを利用する方法がある
- [What is Swift\-Package\-Registry?](https://lukaspistrol.com/blog/what-is-swift-package-registry/)

>これはおそらく、企業環境または大規模なオープンソース プロジェクトでのみ実行可能でしょう。小規模なプロジェクトの場合、Swift パッケージのサポートが追加されたら、GitHub パッケージ レジストリの方がおそらくより良い選択です。

## [Plotting a Path to a Package Ecosystem without Data Race Errors](https://www.swift.org/blog/ready-for-swift-6/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20668)
- Swift6の互換性やデータ競合のチェックができる

![image](https://i.imgur.com/x1jtOHy.png)

## [〜StreamUI: Make videos with SwiftUI](https://forums.swift.org/t/streamui-make-videos-with-swiftui/72822/1)

- SwiftUIで動画を作るライブラリ(Beta版)
- 他の言語でできた似たようなライブラリにインスパイアされた

> Around this time I came across projects to programmatically generate videos in react/js (https://www.remotion.dev 36 and https://re.video 19).

- [Make videos programmatically\.](https://www.remotion.dev/)

## [Zoom transitions](https://douglashill.co/zoom-transitions/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20668)
- TBD



## [Consolidated ViewState](https://www.ludafux.com/post/consolidated-viewstate?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20668)
- SwiftUIのViewで複数の状態を管理するのにViewModelを作ると良い

```swift
class SomeViewModel: ObservableObject {
   @Published var data: DataType 
   @Published var error: String? 
   @Published var isLoading: Bool
}
```

- ただしisLoadingの詳しい状態がわからないという問題がある
- そこで下記のソリューション

```swift
public enum ViewState<T> {
  case idle(data: T) 
  case loading 
  case error(message: String)
}
```

- 正式なコードは以下の通り
- https://github.com/fuxlud/Modularized_iOS_App/blob/f1a0fd24b508dfa49e7ee6383404adf8ba34361a/Submodules/Sources/InfrastructureLayer/Architecture/ViewState.swift#L4

```swift
import Foundation
import SwiftUI

public enum ViewState<T>: Equatable where T: Equatable {
    case idle(data: T)
    case loading
    case error(message: String)
    
    public static func ==(lhs: ViewState<T>, rhs: ViewState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.error(let lhsMessage), .error(let rhsMessage)):
            return lhsMessage == rhsMessage
        case (.idle(let lhsData), .idle(let rhsData)):
            return lhsData == rhsData
        default:
            return false
        }
    }
    
    public var data: T? {
        switch self {
        case .idle(let data):
            return data
        default:
            return nil
        }
    }
    
    public var isLoading: Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }
    
    public var error: String? {
        switch self {
        case .error(let message):
            return message
        default:
            return nil
        }
    }
}
```

- 宣言は以下の通り

```swift
@Observable 
public class BreedsViewModel {
    public let id = UUID()
    public var state: ViewState<[BreedViewModel]> = .idle(data: [])
```

## [Diffuse reflection UV computation tool](https://www.elkraneo.com/diffuse-reflection-uv-computation-tool/?utm_campaign=iOS%20Dev%20Weekly&utm_medium=web&utm_source=iOS%20Dev%20Weekly%20Issue%20668)
- 画面が環境に固定されていることで存在感が増す
- またこの表現を実現している反射表現が良い。リソースにそのPythonスクリプトを見つけられる

> 都合の良いことに、リソースを注意深く見ると、今年唯一のダウンロードである、エミッターと減衰 UV を計算するアルゴリズムを備えた Python スクリプト (既存の USD Python ライブラリ上で動作する) を見つけることができます。

## [Our App Store screenshot nightmare is \(almost\) over](https://www.jessesquires.com/blog/2024/07/04/app-store-screenshot-changes/)
- iOSでスクリーンショットが楽になるよ
- でもmacOSではまだ変更はないよ

> App Store Connect がアップデートされ、 iPhone と iPad で必要なスクリーンショットは 1 セットのみになります。
> [また、これらの変更が App Store Connect でいつ有効になるかも明らかではありません。現時点では、古い要件が残っています。App Store Connect のアップデートは、今年後半の iOS 18 と macOS 15 の最終リリースと同時に行われるのではないかと思います。つまり、数か月待つ必要があるということです。

>macOS のスクリーンショットはどうでしょうか?そこにも問題があります。具体的には、許可されているサイズとアスペクト比です。残念ながら、macOS のスクリーンショットの既存の要件はそのまま残るようです。少なくとも iOS では進歩がありました。](https://www.jessesquires.com/blog/2024/07/04/app-store-screenshot-changes/)
