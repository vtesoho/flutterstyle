package com.vteso.brightness_tools

import android.app.Activity
import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import com.sun.org.apache.xpath.internal.operations.Bool
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class BrightnessToolsPlugin: MethodCallHandler {

  companion object {
    var registrars: Registrar? = null
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      registrars = registrar
      val channel = MethodChannel(registrar.messenger(), "brightness_tools")
      channel.setMethodCallHandler(BrightnessToolsPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    var resultMo = ResultModel()
    when (call.method) {

        "isAutoBrightness" -> {
          try {
            resultMo.values =  BrightnessTools.isAutoBrightness(registrars?.activity()?.contentResolver)
            result.success(resultMo)
          } catch (e: Exception){
            resultMo.status = false
            resultMo.infos = "error"
            result.success(resultMo)
          }
        }
        "getScreenBrightness" -> {
          try {
            var getScreenBrightness =  BrightnessTools.getScreenBrightness(registrars?.activity()!!)
            result.success(getScreenBrightness)
          } catch (e: Exception){
            result.success("error")
          }
        }
        "setBrightness" -> {
          try {
            var brightness = call.argument<Int>("brightness")
            brightness?.let { BrightnessTools.setBrightness(registrars?.activity()!!, it) }
            result.success(true)
          } catch (e:Exception){
            result.success("error")
          }
        }
        "stopAutoBrightness" -> {
          try {
            BrightnessTools.stopAutoBrightness(registrars?.activity()!!)
            result.success(true)
          } catch (e:Exception){
            result.success("error")
          }
        }
        "startAutoBrightness" -> {
          try {
            BrightnessTools.startAutoBrightness(registrars?.activity()!!)
            result.success(true)
          } catch (e:Exception){
            result.success("error")
          }
        }
        "saveBrightness" -> {
          try {
            var brightness = call.argument<Int>("brightness")
            brightness?.let { registrars?.activity()?.contentResolver?.let { it1 -> BrightnessTools.saveBrightness(it1, it) } }
            result.success(true)
          } catch (e:Exception){
            result.success("error")
          }
        }
        else -> {
          result.notImplemented()
        }
    }
  }






  


}


class ResultModel{
  var status: Boolean = true
  var values: Boolean = true
  var infos: String = "ok"

}