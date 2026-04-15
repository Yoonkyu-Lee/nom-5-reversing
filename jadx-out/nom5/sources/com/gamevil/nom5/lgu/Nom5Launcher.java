package com.gamevil.nom5.lgu;

import android.app.ProgressDialog;
import android.content.pm.PackageManager;
import android.media.AudioManager;
import android.os.Bundle;
import android.view.KeyEvent;
import android.widget.ImageView;
import android.widget.TextView;
import com.gamevil.nexus2.Natives;
import com.gamevil.nexus2.NexusGLActivity;
import com.gamevil.nexus2.NexusGLRenderer;
import com.gamevil.nexus2.NexusGLSurfaceView;
import com.gamevil.nexus2.NexusHal;
import com.gamevil.nexus2.p000ui.NexusSound;
import com.gamevil.nexus2.xml.NexusXmlChecker;
import com.gamevil.nom5.p001ui.Nom5UIControllerView;

/* JADX INFO: loaded from: classes.dex */
public class Nom5Launcher extends NexusGLActivity {
    public static ProgressDialog dialog = null;
    private static boolean armPassed = false;
    public static boolean isShownAlert = false;
    private final String STR_ARM_ID = "AQ00102631";
    private NexusXmlChecker updateChecker = null;
    private LgUtil lgUtil = new LgUtil(this);

    @Override // com.gamevil.nexus2.NexusGLActivity, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(C0046R.layout.main);
        this.glSurfaceview = (NexusGLSurfaceView) findViewById(C0046R.id.SurfaceView01);
        uiViewControll = (Nom5UIControllerView) findViewById(C0046R.id.UIView01);
        this.glSurfaceview.setRenderer(new NexusGLRenderer());
        setImgTitle((ImageView) NexusGLActivity.myActivity.findViewById(C0046R.id.titleImg));
        setVerionView((TextView) NexusGLActivity.myActivity.findViewById(C0046R.id.versionTxt));
        NexusSound.initSounds(NexusGLActivity.myActivity.getBaseContext(), 3);
        Natives.setUIListener(uiViewControll);
        try {
            this.version = getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
            if (this.txtVersion != null) {
                this.txtVersion.setText(String.format("v%s", this.version));
            }
        } catch (PackageManager.NameNotFoundException e) {
            this.version = "v1.0.0";
        }
        armPassed = this.lgUtil.runArmService("AQ00102631");
        Natives.bCanConn = false;
        this.lgUtil.bindIAPService();
        gameScreenWidth = 400;
        gameScreenHeight = 240;
    }

    @Override // com.gamevil.nexus2.NexusGLActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        this.lgUtil.releaseArmService();
        this.lgUtil.unbindIAPService();
        if (this.updateChecker != null) {
            this.updateChecker.releaseAll();
            this.updateChecker = null;
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        AudioManager audio = (AudioManager) getSystemService("audio");
        switch (keyCode) {
            case 4:
                NexusGLRenderer.m_renderer.setTouchEvent(2, -8, 0, 0);
                return true;
            case NexusHal.MH_POINTER_RELEASEEVENT /* 24 */:
                audio.adjustStreamVolume(3, 1, 1);
                return true;
            case NexusHal.MH_POINTER_MOVEEVENT /* 25 */:
                audio.adjustStreamVolume(3, -1, 1);
                return true;
            default:
                return super.onKeyDown(keyCode, event);
        }
    }

    public static boolean isArmPassed() {
        return armPassed;
    }

    public static void setArmPassed(boolean armPassed2) {
        armPassed = armPassed2;
    }
}
