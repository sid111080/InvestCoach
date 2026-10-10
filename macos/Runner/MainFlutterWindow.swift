import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    self.contentViewController = flutterViewController

    // Размер по умолчанию: крупный смартфон (430 × 932 pt, ~Pixel 10 Pro).
    self.setContentSize(NSSize(width: 430, height: 932))
    self.center()

    // Ограничения ресайза: компактный телефон → планшет.
    self.minSize = NSSize(width: 360, height: 740)
    self.maxSize = NSSize(width: 560, height: 1100)

    RegisterGeneratedPlugins(registry: flutterViewController)
    super.awakeFromNib()
  }
}
