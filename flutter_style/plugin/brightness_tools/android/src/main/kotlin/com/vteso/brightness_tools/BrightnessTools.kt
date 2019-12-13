package com.vteso.brightness_tools

import android.app.Activity
import android.content.ContentResolver
import android.net.Uri
import android.provider.Settings
import android.provider.Settings.System.*
import android.view.WindowManager


object BrightnessTools {
    /**
     * 判断是否开启了自动亮度调节
     */
    fun isAutoBrightness(aContentResolver: ContentResolver?): Boolean {
        var automicBrightness: Boolean = false
        try {
            automicBrightness = getInt(aContentResolver,
                    SCREEN_BRIGHTNESS_MODE) === SCREEN_BRIGHTNESS_MODE_AUTOMATIC
        } catch (e: Settings.SettingNotFoundException) {
            e.printStackTrace()
        }
        return automicBrightness
    }

    /**
     * 获取屏幕的亮度
     *
     * @param activity
     * @return
     */
    fun getScreenBrightness(activity: Activity): Int {
        var nowBrightnessValue = 0
        val resolver: ContentResolver = activity.contentResolver
        try {
            nowBrightnessValue = getInt(
                    resolver, SCREEN_BRIGHTNESS)
        } catch (e: Exception) {
            e.printStackTrace()
        }
        return nowBrightnessValue
    }

    /**
     * 设置亮度
     *
     * @param activity
     * @param brightness
     */
    fun setBrightness(activity: Activity, brightness: Int) {
        // Settings.System.putInt(activity.getContentResolver(),
        // Settings.System.SCREEN_BRIGHTNESS_MODE,
        // Settings.System.SCREEN_BRIGHTNESS_MODE_MANUAL);
        val lp: WindowManager.LayoutParams = activity.window.attributes
        lp.screenBrightness = java.lang.Float.valueOf(brightness.toFloat()) * (1f / 255f)
        //        Log.d("lxy", "set  lp.screenBrightness == " + lp.screenBrightnessghtness);
        activity.getWindow().setAttributes(lp)
    }
    // 那么，能设置了，但是为什么还是会出现，设置了，没反映呢？
// 嘿嘿，那是因为，开启了自动调节功能了，那如何关闭呢？这才是最重要的：
    /**
     * 停止自动亮度调节
     *
     * @param activity
     */
    fun stopAutoBrightness(activity: Activity) {
        putInt(activity.getContentResolver(),
                SCREEN_BRIGHTNESS_MODE,
                SCREEN_BRIGHTNESS_MODE_MANUAL)
    }

    /**
     * 开启亮度自动调节
     *
     * @param activity
     */
    fun startAutoBrightness(activity: Activity) {
        putInt(activity.contentResolver,
                SCREEN_BRIGHTNESS_MODE,
                SCREEN_BRIGHTNESS_MODE_AUTOMATIC)
    }
    // 至此，应该说操作亮度的差不多都有了，结束！
// 哎，本来认为是应该结束了，但是悲剧得是，既然像刚才那样设置的话，只能在当前的activity中有作用，一段退出的时候，会发现毫无作用，悲剧，原来是忘记了保存了。汗！
    /**
     * 保存亮度设置状态
     *
     * @param resolver
     * @param brightness
     */
    fun saveBrightness(resolver: ContentResolver, brightness: Int) {
        val uri: Uri = getUriFor("screen_brightness")
        putInt(resolver, "screen_brightness",
                brightness)
        // resolver.registerContentObserver(uri, true, myContentObserver);
        resolver.notifyChange(uri, null)
    }
}