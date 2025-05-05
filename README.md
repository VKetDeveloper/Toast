# Vket Toast

SwiftUI専用のリッチなトースト通知ビュー。アイコンや進捗バー、アニメーション、テーマカラーによるスタイリングが可能です。

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
import SwiftUI
import VketToast


struct InternalTestView: View {
    @StateObject private var toastManager = ToastManager()
    @State private var showVisionToast = false

    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Button("トースト表示（進捗あり）") {
                    toastManager.show(message: "アップロード中 (3 / 5)", progress: 0.6)
                }

                Button("保存完了通知を表示（5秒）") {
                    toastManager.show(message: "設定が保存されました", duration: 5)
                }

                Button("Vision Pro スタイル通知表示") {
                    showVisionToast = true
                }
            }
            .padding()

            // Vision Pro スタイルのトースト（Blur + 短時間）
            CustomToastView(
                message: "これは Vision Pro スタイルの通知です",
                style: .normal,
                isShowing: $showVisionToast
            )

            // 成功スタイルのカスタムトースト（進捗や通常メッセージ）
            if toastManager.isVisible {
                CustomToastView(
                    message: toastManager.message,
                    style: .success,
                    progress: toastManager.progress,
                    isShowing: $toastManager.isVisible
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
