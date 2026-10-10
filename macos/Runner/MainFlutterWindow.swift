import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController
    RegisterGeneratedPlugins(registry: flutterViewController)
    super.awakeFromNib()

    // Размер смартфона (430 × 932 pt) — устанавливаем ПОСЛЕ super,
    // чтобы переопределить frame, восстановленный macOS из прошлого запуска.
    self.setContentSize(NSSize(width: 430, height: 932))
    self.center()

    // Ограничения ресайза: компактный телефон → планшет.
    self.minSize = NSSize(width: 360, height: 740)
    self.maxSize = NSSize(width: 560, height: 1100)
  }
}
