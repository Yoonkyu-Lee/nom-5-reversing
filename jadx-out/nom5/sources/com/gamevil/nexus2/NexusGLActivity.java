package com.gamevil.nexus2;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.gamevil.nexus2.p000ui.NeoUIControllerView;
import com.gamevil.nexus2.p000ui.NexusSound;
import com.google.android.apps.analytics.GoogleAnalyticsTracker;
import java.util.Random;

/* JADX INFO: loaded from: classes.dex */
public class NexusGLActivity extends Activity {
    private static final String PREFS_NAME = "MyDeviceId";
    public static boolean armPassed;
    public static String beforePage;
    public static int displayHeight;
    public static int displayWidth;
    public static boolean isShownAlert;
    public static int m_timeout;
    public static int m_timerIndex;
    public static NexusGLActivity myActivity;
    public static NativesAsyncTask task;
    public static GoogleAnalyticsTracker tracker;
    public static NeoUIControllerView uiViewControll;
    public NexusGLSurfaceView glSurfaceview;
    public ImageView imgDefault;
    public ImageView imgTitle;
    private ProgressBar loadingBar;
    public String mockDeviceID;
    public String packageInfo;
    Random random;
    public TextView txtVersion;
    public static int gameScreenWidth = 400;
    public static int gameScreenHeight = 240;
    public String version = "1.0.0";
    public boolean isNoDeviceID = false;
    private Handler handler = new Handler();

    static {
        System.loadLibrary("gameDSO");
    }

    public static void AnalyticsInitialize(String _uaID, Context _context) {
        System.out.println("*************************************************** ");
        System.out.println("**\t\t\t");
        System.out.println("**\t\t\tAnalyticsInitialize " + _uaID);
        System.out.println("**\t\t\t");
        System.out.println("*************************************************** ");
        tracker = null;
        if (_uaID != null) {
            tracker = GoogleAnalyticsTracker.getInstance();
            tracker.start(_uaID, _context);
        }
    }

    public static void AnalyticsTrackPageView(String str) {
        System.out.println("*************************************************** ");
        System.out.println("**\t\t\t");
        System.out.println("**\t\t\tAnalyticsTrackPageView " + str);
        System.out.println("**\t\t\t");
        System.out.println("*************************************************** ");
        if (str != null && tracker != null) {
            beforePage = str;
            tracker.trackPageView(str);
            tracker.dispatch();
        }
    }

    public static void AnalyticsTrackEvent(String _action, String _lable) {
        System.out.println("*************************************************** ");
        System.out.println("**\t\t\t");
        System.out.println("**\t\t\tAnalyticsTrackEvent " + _lable);
        System.out.println("**\t\t\t");
        System.out.println("*************************************************** ");
        if (_lable != null && tracker != null) {
            if (_action == null) {
                _action = "Action";
            }
            tracker.trackEvent("Event", _action, _lable, 1);
            tracker.dispatch();
        }
    }

    public static void AnalyticsTrackStop() {
        if (tracker != null) {
            tracker.stop();
            tracker = null;
        }
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public void setVerionView(TextView _txtVersionView) {
        this.txtVersion = _txtVersionView;
    }

    public void setImgTitle(ImageView imgTitle) {
        this.imgTitle = imgTitle;
    }

    public void setImgDefault(ImageView imgDefault) {
        this.imgDefault = imgDefault;
    }

    public void setNexusGLSurfaceView(NexusGLSurfaceView _surfaceView) {
        this.glSurfaceview = _surfaceView;
    }

    int random(int max) {
        if (this.random == null) {
            this.random = new Random();
        }
        if (max == 0) {
            max = 1;
        }
        return Math.abs(this.random.nextInt()) % max;
    }

    private void checkDeviceID() {
        String deviceID = ((TelephonyManager) getSystemService("phone")).getDeviceId();
        if (deviceID == null) {
            SharedPreferences settings = getSharedPreferences(PREFS_NAME, 0);
            this.mockDeviceID = settings.getString("myDeviceID", "NONE");
            if (this.mockDeviceID.equals("NONE")) {
                long time = System.currentTimeMillis();
                int randomID = random(100);
                this.mockDeviceID = "id" + time + "r" + randomID;
                SharedPreferences.Editor editor = settings.edit();
                editor.putString("myDeviceID", this.mockDeviceID);
                editor.commit();
            }
            this.isNoDeviceID = true;
        }
    }

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        myActivity = this;
        checkDeviceID();
        DisplayMetrics metrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(metrics);
        gameScreenWidth = metrics.widthPixels;
        gameScreenHeight = metrics.heightPixels;
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        NexusSound.stopAllSound();
        if (this.glSurfaceview != null) {
            this.glSurfaceview.onPause();
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        if (this.glSurfaceview != null) {
            this.glSurfaceview.onResume();
        }
        Natives.InitializeJNIGlobalRef();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        System.out.println("----------------------------------------------------");
        System.out.println("|\t\tActivity onDestroy ");
        System.out.println("----------------------------------------------------");
        NexusSound.stopAllSound();
        NexusSound.releaseAll();
        Natives.NativeDestroyClet();
        if (this.glSurfaceview != null) {
            this.glSurfaceview.onDetachedFromWindow();
        }
        if (uiViewControll != null) {
            uiViewControll.releaseAll();
            uiViewControll = null;
        }
        if (this.glSurfaceview != null) {
            this.glSurfaceview.releaseAll();
            this.glSurfaceview = null;
        }
        myActivity = null;
        this.version = null;
        ActivityManager am = (ActivityManager) getSystemService("activity");
        am.restartPackage(getPackageName());
    }

    public void OnAsyncTimerSet(int timeOut, int timerIndex) {
        if (task != null && task.m_nTimerIndex == timerIndex) {
            task.cancel(false);
        }
        m_timeout = timeOut;
        m_timerIndex = timerIndex;
        this.handler.post(new Runnable() { // from class: com.gamevil.nexus2.NexusGLActivity.1
            @Override // java.lang.Runnable
            public void run() {
                NexusGLActivity.task = new NativesAsyncTask();
                NexusGLActivity.task.setTimeOut(NexusGLActivity.m_timeout, NexusGLActivity.m_timerIndex);
                NexusGLActivity.task.execute(0);
            }
        });
    }

    public void finishApp() {
        finish();
    }

    public void setLoagdingProgressBar(ProgressBar _loadingBar) {
    }

    public void showLoadingDialog() {
        if (this.loadingBar != null) {
            this.loadingBar.setVisibility(0);
        }
    }

    public void hideLoadingDialog() {
        if (this.loadingBar != null) {
            this.loadingBar.setVisibility(4);
        }
    }

    public void showTitleComponent() {
        if (this.imgTitle != null) {
            this.imgTitle.setVisibility(0);
        }
        if (this.txtVersion != null) {
            this.txtVersion.setVisibility(0);
        }
        if (this.imgDefault != null) {
            this.imgDefault.setVisibility(4);
        }
    }

    public void hideTitleComponent() {
        if (this.imgTitle != null) {
            this.imgTitle.setVisibility(4);
        }
        if (this.txtVersion != null) {
            this.txtVersion.setVisibility(4);
        }
    }
}
