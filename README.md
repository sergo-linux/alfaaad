# AlfaScan

Красивый iOS QR-сканер. При запуске сразу открывает камеру, сканирует QR и запускает ссылку вида:

```text
advance://<содержимое QR>
```

## Как поменять deeplink

Открой `AlfaScan/DeepLinkSettings.swift`:

```swift
static let prefix = "advance://"
static let percentEncodePayload = false
```

Если приложение-приёмник не понимает обычный вариант, попробуй `percentEncodePayload = true`.

## Как собрать без GitHub

1. Разархивируй проект на Mac.
2. Открой `AlfaScan.xcodeproj` в Xcode.
3. Открой вкладку проекта `AlfaScan` → `Signing & Capabilities`.
4. В `Team` выбери свой Apple ID / Personal Team.
5. Поменяй `Bundle Identifier` на уникальный, например:
   `com.sergo.AlfaScan123`.
6. Подключи iPhone кабелем.
7. Выбери свой iPhone сверху в Xcode.
8. Нажми ▶ Run.
9. На iPhone: Настройки → Основные → VPN и управление устройством → доверяй своему Apple ID.
10. Открой приложение и дай доступ к камере.

GitHub не нужен.

## Важно

Не сканируй неизвестные QR, потому что приложение сразу передаёт содержимое QR в `advance://`.


## Сборка через Yarn / GitHub Actions

Этот проект нативный SwiftUI, поэтому Yarn сам по себе iOS не компилирует. Здесь Yarn используется как удобная обёртка над `xcodebuild`.

Локально на Mac:

```bash
yarn build:ipa
```

Через GitHub Actions:

1. Залей проект в репозиторий.
2. Открой вкладку `Actions`.
3. Выбери `Build AlfaScan IPA`.
4. Нажми `Run workflow`.
5. Скачай artifact `AlfaScan-unsigned-ipa`.
6. Подпиши IPA через KSign / SideStore / AltStore / свой сертификат.

Без macOS runner или Mac нативный SwiftUI-проект не соберётся.
