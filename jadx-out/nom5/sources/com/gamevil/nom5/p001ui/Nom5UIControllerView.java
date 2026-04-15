package com.gamevil.nom5.p001ui;

import android.content.Context;
import android.graphics.Canvas;
import android.os.Build;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import com.gamevil.nexus2.Natives;
import com.gamevil.nexus2.NexusGLActivity;
import com.gamevil.nexus2.NexusGLRenderer;
import com.gamevil.nexus2.p000ui.NeoUIArea;
import com.gamevil.nexus2.p000ui.NeoUIControllerView;
import com.gamevil.nexus2.p000ui.NexusSound;
import com.gamevil.nexus2.p000ui.UIEditText;
import com.gamevil.nexus2.xml.GamevilLiveWebView;
import com.gamevil.nexus2.xml.NewsViewTask;
import com.gamevil.nom5.lgu.C0046R;

/* JADX INFO: loaded from: classes.dex */
public class Nom5UIControllerView extends NeoUIControllerView {
    public static final int UI_STATUS_ABOUT = 5;
    public static final int UI_STATUS_CERTIFICATION = 12;
    public static final int UI_STATUS_CERT_CP_VERIFY = 8;
    public static final int UI_STATUS_EDIT = 3;
    public static final int UI_STATUS_EDITPLAYER = 7;
    public static final int UI_STATUS_EDIT_INPUT_INVISIBLE = 18;
    public static final int UI_STATUS_EDIT_MY_INPUT_VISIBLE = 16;
    public static final int UI_STATUS_EDIT_TEAM_INPUT_VISIBLE = 17;
    public static final int UI_STATUS_EXIT = 104;
    public static final int UI_STATUS_FULLTOUCH = 14;
    public static final int UI_STATUS_GAME_DPAD = 13;
    public static final int UI_STATUS_GAME_DPAD_MY = 15;
    public static final int UI_STATUS_GAME_LOADING = 6;
    public static final int UI_STATUS_HELP = 4;
    public static final int UI_STATUS_LOGO = 0;
    public static final int UI_STATUS_MAINMENU = 2;
    public static final int UI_STATUS_NEWS = 19;
    public static final int UI_STATUS_RANKING = 10;
    public static final int UI_STATUS_SPECIAL = 9;
    public static final int UI_STATUS_THANKYOU = 105;
    public static final int UI_STATUS_TITLE = 1;
    public static final int UI_STATUS_TROPHY = 11;
    private final String aboutUrl;
    UIFullTouch fullTouch;
    private final String helpUrl;
    private Context mContext;
    Handler mHandler;
    Handler mHandler2;

    /* JADX INFO: renamed from: pl */
    private FrameLayout.LayoutParams f8pl;
    UIEditText textInput;
    boolean togle;

    public Nom5UIControllerView(Context context) {
        super(context);
        this.helpUrl = "http://www.google.com";
        this.aboutUrl = "http://www.naver.com";
        this.mHandler = new Handler();
        this.mHandler2 = new Handler();
        this.mContext = context;
    }

    public Nom5UIControllerView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.helpUrl = "http://www.google.com";
        this.aboutUrl = "http://www.naver.com";
        this.mHandler = new Handler();
        this.mHandler2 = new Handler();
        this.mContext = context;
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView
    public void onInitialize() {
        this.fullTouch = new UIFullTouch();
        this.fullTouch.initialize();
        addSubView(this.fullTouch);
        this.textInput = (UIEditText) NexusGLActivity.myActivity.findViewById(C0046R.id.text_edit);
        if (Build.MODEL.equals("Nexus One") || Build.MODEL.equals("PC36100") || Build.MODEL.equals("ADR6300") || Build.MODEL.equals("HTC Desire")) {
            Natives.NativeIsNexusOne(true);
        } else {
            Natives.NativeIsNexusOne(false);
        }
    }

    public void startBlock() {
        this.mHandler.post(new Runnable() { // from class: com.gamevil.nom5.ui.Nom5UIControllerView.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Thread.sleep(10L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (NexusGLActivity.myActivity != null) {
                    Nom5UIControllerView.this.startBlock();
                }
            }
        });
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView, android.view.View
    protected void onDraw(Canvas canvas) {
        NeoUIArea _area;
        if (this.uiStatus == 0 && this.subViews != null && (_area = (NeoUIArea) this.subViews.getElement(0)) != null && !_area.mIsHidden) {
            _area.onDraw(canvas);
        }
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView
    public void hideAllUI() {
        int _subViewSize = this.subViews.getElemetsSize();
        for (int _i = 0; _i < _subViewSize; _i++) {
            NeoUIArea _area = (NeoUIArea) this.subViews.getElement(_i);
            if (!_area.mIsHidden) {
                _area.setIsHidden(true);
                _area.mStatus = 0;
            }
        }
        setTextInputInvisible();
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView
    public void setUIState() {
        switch (this.uiStatus) {
            case 14:
                NewsViewTask.hideNewsView();
                GamevilLiveWebView.hideLiveButton();
                this.fullTouch.setIsHidden(false);
                break;
            case 16:
                this.fullTouch.setIsHidden(false);
                break;
            case 17:
                this.fullTouch.setIsHidden(false);
                break;
            case 18:
                setTextInputInvisible();
                this.fullTouch.setIsHidden(false);
                break;
            case 19:
                NewsViewTask.showNewsView();
                this.fullTouch.setIsHidden(false);
                GamevilLiveWebView.showLiveButton();
                break;
            case 104:
                NexusGLActivity.myActivity.finishApp();
                break;
            default:
                this.fullTouch.setIsHidden(false);
                break;
        }
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView, com.gamevil.nexus2.Natives.UIListener
    public void OnEvent(int event) {
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        super.onTouchEvent(event);
        return true;
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (NexusGLRenderer.m_renderer != null) {
            NexusGLRenderer.m_renderer.setTouchEvent(2, getHalKeyCode(keyCode), 0, 0);
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        if (NexusGLRenderer.m_renderer != null) {
            NexusGLRenderer.m_renderer.setTouchEvent(3, getHalKeyCode(keyCode), 0, 0);
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView, com.gamevil.nexus2.Natives.UIListener
    public void OnUIStatusChange(int status) {
        System.out.println("ZenoniaUIController OnUIStatusChange");
        changeUIStatus(status);
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView, com.gamevil.nexus2.Natives.UIListener
    public void OnSoundPlay(int sndID, int vol, boolean isLoop) {
        if (vol == 0 && isLoop) {
            NexusSound.stopBGMSound();
        } else {
            NexusSound.setVolume(vol / 10);
            NexusSound.playSound(C0046R.raw.n000 + sndID, isLoop);
        }
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView, com.gamevil.nexus2.Natives.UIListener
    public void OnStopSound() {
        NexusSound.stopAllSound();
    }

    @Override // com.gamevil.nexus2.p000ui.NeoUIControllerView, com.gamevil.nexus2.Natives.UIListener
    public void OnVibrate(int time) {
        NexusSound.Vibrator(time);
    }

    private void setTextInputVisible() {
        this.mHandler.post(new Runnable() { // from class: com.gamevil.nom5.ui.Nom5UIControllerView.2
            @Override // java.lang.Runnable
            public void run() {
                Nom5UIControllerView.this.textInput.setVisibility(0);
                Nom5UIControllerView.this.textInput.requestFocus();
                InputMethodManager mgr = (InputMethodManager) NexusGLActivity.myActivity.getSystemService("input_method");
                mgr.showSoftInput(Nom5UIControllerView.this.textInput, 0);
            }
        });
    }

    private void setTextInputInvisible() {
        this.mHandler.post(new Runnable() { // from class: com.gamevil.nom5.ui.Nom5UIControllerView.3
            @Override // java.lang.Runnable
            public void run() {
                Nom5UIControllerView.this.textInput.setVisibility(4);
                Nom5UIControllerView.this.textInput.clearText();
            }
        });
    }
}
