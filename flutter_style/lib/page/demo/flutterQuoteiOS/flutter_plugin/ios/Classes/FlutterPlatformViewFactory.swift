class GoogleMapFactory : NSObject,FlutterPlatformViewFactory{
    
    var messenger: FlutterBinaryMessenger!
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return GoogleMapView(frame,viewID : viewId , args : args,binaryMessenger:messenger);
    }
    
    @objc public init(messenger: (NSObject & FlutterBinaryMessenger)?) {
        super.init()
        self.messenger = messenger
    }
}