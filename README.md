# Vket Toast

SwiftUI専用のリッチなトースト通知ビュー。アイコンや進捗バー、アニメーション、テーマカラーによるスタイリングが可能です。

> [!NOTE]
> The Framework is currently in **beta**. The API surface and feature sets are subject to change at any time before they become generally available. We do not currently recommend them for production use. The design may also be updated without prior notice.

## ✅ 主な機能

- SwiftUIのみで完結（UIKit不要）
- トーストの出現・消失にアニメーション付き
- プログレスバー（任意）
- アイコン（任意）
- 成功・エラー・情報に応じたテーマカラー
- アニメーションの時間調整が可能

## 💻 導入方法（Swift Package Manager）

1. Xcodeのメニューから「File > Add Packages...」を選択
2. 以下のリポジトリURLを入力：
 ` https://github.com/VKetDeveloper/VketToast.git`
3. `Vket Toast` パッケージを追加

## 🔧 使い方

```swift
import VketToast

struct ContentView: View {
 @State private var showToast = false

 var body: some View {
     ZStack {
         Button("トースト表示") {
             showToast = true
             DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                 showToast = false
             }
         }

         if showToast {
             ToastView(
                 message: "アップロード中 (3 / 5)",
                 progress: 0.6,
                 icon: "arrow.up.circle.fill",
                 theme: .info,
                 animationDuration: 0.4
             )
         }
     }
 }
}
```
## パラメータ一覧
| パラメータ名              | 型                             | 説明                                   |
| ------------------- | ----------------------------- | ------------------------------------ |
| `message`           | `String`                      | 表示するメッセージ                            |
| `progress`          | `Float?`                      | 0.0〜1.0の進捗バー（任意）                     |
| `icon`              | `String?`                     | SF Symbols名（例: `"checkmark.circle"`） |
| `theme`             | `.success`, `.error`, `.info` | テーマカラーの種類                            |
| `animationDuration` | `Double`                      | 表示・非表示のアニメーション時間（秒）                  |

## テーマカラー
| テーマ        | 内容         |
| ---------- | ---------- |
| `.success` | 成功・完了系（緑）  |
| `.error`   | エラー・警告系（赤） |
| `.info`    | 情報通知系（青）   |

## license
MIT License
