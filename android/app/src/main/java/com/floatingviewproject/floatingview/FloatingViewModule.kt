package com.floatingviewproject.floatingview

import android.content.Intent
import android.provider.Settings
import android.widget.Toast
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class FloatingViewModule(reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "FloatingView"
    }

    @ReactMethod
    fun checkOverlayPermission(promise: Promise) {
        val context = reactApplicationContext
        val canDrawOverlays = Settings.canDrawOverlays(context)
        promise.resolve(canDrawOverlays)
    }

    @ReactMethod
    fun requestOverlayPermission() {
        val intent = Intent(
            Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
            android.net.Uri.parse("package:${reactApplicationContext.packageName}")
        )
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        reactApplicationContext.startActivity(intent)
    }

    @ReactMethod
    fun showFloatingView() {
        val intent = Intent(reactApplicationContext, FloatingViewService::class.java)
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            reactApplicationContext.startForegroundService(intent)
        } else {
            reactApplicationContext.startService(intent)
        }
    }

    @ReactMethod
    fun hideFloatingView() {
        val intent = Intent(reactApplicationContext, FloatingViewService::class.java)
        reactApplicationContext.stopService(intent)
    }
}
