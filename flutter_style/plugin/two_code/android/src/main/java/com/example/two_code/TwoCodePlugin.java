package com.example.two_code;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;

import com.uuzuche.lib_zxing.activity.ZXingLibrary;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** TwoCodePlugin */
public class TwoCodePlugin implements MethodCallHandler {
  private static final int ZBAR_CAMERA_PERMISSION = 1;
  private Activity activity;
  private Registrar registrar;
  /** Plugin registration. */
  public static void registerWith(Registrar registrar1) {
    final MethodChannel channel = new MethodChannel(registrar1.messenger(), "two_code");
    channel.setMethodCallHandler(new TwoCodePlugin(registrar1));
  }
  private TwoCodePlugin(Registrar registrar) {
    this.registrar = registrar;
    this.activity = registrar.activity();

  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    CommonValue.result = result;
    if (call.method.equals("scan")) {
      System.out.println("__________________scan");
      if (ContextCompat.checkSelfPermission(registrar.context(), Manifest.permission.CAMERA)
              != PackageManager.PERMISSION_GRANTED) {
        ActivityCompat.requestPermissions(registrar.activity(),
                new String[]{Manifest.permission.CAMERA}, ZBAR_CAMERA_PERMISSION);
      } else {
        ZXingLibrary.initDisplayOpinion(activity.getApplicationContext());
        Intent intent = new Intent(activity.getApplicationContext(), ScannerActivity.class);
        activity.startActivity(intent);
      }

    } else {
      result.notImplemented();
    }
  }
}
