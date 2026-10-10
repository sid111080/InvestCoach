import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController
    RegisterGeneratedPlugins(registry: flutterViewController)
    super.awakeFromNib()

    // Отключаем state restoration — macOS не будет восстанавливать
    // старый frame из прошлого запуска.
    self.isRestorable = false
    self.setFrameAutosaveName("")

    // Размер смартфона (430 × 932 pt, ~Pixel 10 Pro / iPhone 17 Pro).
    let target = NSRect(x: 0, y: 0, width: 430, height: 932)
    self.setContentSize(target.size)
    self.center()

    // Ограничения ресайза: компактный телефон → планшет.
    self.minSize = NSSize(width: 360, height: 740)
    self.maxSize = NSSize(width: 560, height: 1100)
  }
}
