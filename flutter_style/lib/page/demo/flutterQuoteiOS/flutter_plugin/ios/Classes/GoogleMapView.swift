import Flutter
import Foundation
 
class GoogleMapView : NSObject,FlutterPlatformView{
    let frame: CGRect;
    let viewId: Int64;
    var messenger: FlutterBinaryMessenger!
    
    init(_ frame: CGRect,viewID: Int64,args :Any?, binaryMessenger: FlutterBinaryMessenger) {
        self.frame = frame;
        self.viewId = viewID;
        self.messenger=binaryMessenger;
    }
 
    
    func initMethodChannel(){
        let googleMapChannel = FlutterMethodChannel.init(name: "samples.flutter.io/googleMap",
                                                         binaryMessenger: messenger);
        googleMapChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            if(call.method == "startLoaction"){
                //do something
            }else if(call.method == "stopLoaction"){
                
            }
        });
    }
    
    
    func view() -> UIView {
        initMethodChannel()
        var mapView = UILabel()
        mapView.text="阿姨洗吧思密达"
        mapView.color=UIColor.red
        mapView.frame = frame
        return mapView;
    }   
}