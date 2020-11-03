import Flutter
import UIKit

public class SwiftTestPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "test_plugin", binaryMessenger: registrar.messenger())
    let instance = SwiftTestPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch (call.method) {
    case "getPlatform":
        result("iOS " + UIDevice.current.systemVersion)
        break;
    case "calc":
        let args = call.arguments as! [String:Int]
        let a = args["a"] as! Int
        let b = args["b"] as! Int
        
        result(a + b)
        break;
    
    default:
        result(Flutter.FlutterMethodNotImplemented)
        break;
    }
  }
}
