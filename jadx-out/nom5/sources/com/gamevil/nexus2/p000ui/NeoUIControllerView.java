package com.gamevil.nexus2.p000ui;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import com.gamevil.nexus2.Natives;
import com.gamevil.nexus2.NexusHal;
import com.gamevil.nexus2.p000ui.NeoTouchDetector;
import com.google.android.apps.analytics.CustomVariable;
import javax.microedition.khronos.opengles.GL10;

/* JADX INFO: loaded from: classes.dex */
public class NeoUIControllerView extends View implements Natives.UIListener {
    public static int height;
    public static int width;
    public EventQueue eventQueue;
    private int eventQueueSize;
    public boolean isStatusChanging;
    private Context mContext;
    private NeoTouchDetector mDetector;
    public GL10 mgl;
    private int moveEventClip;
    public NxArray subViews;
    public String textInputed;
    public int uiStatus;

    public NeoUIControllerView(Context context) {
        super(context, null, 0);
        this.uiStatus = -99;
        this.eventQueueSize = 30;
        this.moveEventClip = 3;
    }

    public NeoUIControllerView(Context context, AttributeSet attrs) {
        super(context, attrs, 0);
        this.uiStatus = -99;
        this.eventQueueSize = 30;
        this.moveEventClip = 3;
        Log.i("##JAVA##", "@@@@@@@@@@@@@ Create NeoUIControllerView");
        this.mContext = context;
        this.subViews = new NxArray();
        this.uiStatus = -99;
        this.mDetector = NeoTouchDetector.newInstance(context, new ActionCallback(this, null));
        this.eventQueue = new EventQueue(this.eventQueueSize, this.moveEventClip);
    }

    public void setSize(int _width, int _height) {
        width = _width;
        height = _height;
        onInitialize();
    }

    public void onInitialize() {
    }

    private class ActionCallback implements NeoTouchDetector.OnActionListener {
        private ActionCallback() {
        }

        /* synthetic */ ActionCallback(NeoUIControllerView neoUIControllerView, ActionCallback actionCallback) {
            this();
        }

        @Override // com.gamevil.nexus2.ui.NeoTouchDetector.OnActionListener
        public void onAction(int _action, float dx, float dy, int pointerId) {
            if (NeoUIControllerView.this.subViews != null) {
                int _subViewSize = NeoUIControllerView.this.subViews.getElemetsSize();
                for (int _i = 0; _i < _subViewSize; _i++) {
                    NeoUIArea _area = (NeoUIArea) NeoUIControllerView.this.subViews.getElement(_i);
                    if (_area != null && !_area.mIsHidden) {
                        _area.onAction(_action, dx, dy, pointerId);
                    }
                }
            }
        }
    }

    public void addSubView(NeoUIArea _view) {
        this.subViews.addElemet(_view);
    }

    public NeoUIArea getSubView(int _idx) {
        return (NeoUIArea) this.subViews.getElement(_idx);
    }

    public void hideAllUI() {
        int _subViewSize = this.subViews.getElemetsSize();
        for (int _i = 0; _i < _subViewSize; _i++) {
            NeoUIArea _area = (NeoUIArea) this.subViews.getElement(_i);
            if (_area != null && !_area.mIsHidden) {
                _area.setIsHidden(true);
            }
        }
    }

    public void changeUIStatus(int _status) {
        this.uiStatus = _status;
        this.isStatusChanging = true;
        hideAllUI();
    }

    public void setUIState() {
    }

    public void checkUIStatus() {
        if (this.isStatusChanging) {
            setUIState();
            this.isStatusChanging = false;
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        this.mDetector.onTouchEvent(ev);
        try {
            Thread.sleep(35L);
            return true;
        } catch (InterruptedException e) {
            e.printStackTrace();
            return true;
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.subViews != null) {
            int _subViewSize = this.subViews.getElemetsSize();
            for (int _i = 0; _i < _subViewSize; _i++) {
                NeoUIArea _area = (NeoUIArea) this.subViews.getElement(_i);
                if (_area != null && !_area.mIsHidden) {
                    _area.onDraw(canvas);
                }
            }
        }
    }

    public int getHalKeyCode(int _keyCode) {
        switch (_keyCode) {
            case 4:
                return -8;
            case 5:
            case 6:
            case 17:
            case 18:
            case NexusHal.MH_POINTER_RELEASEEVENT /* 24 */:
            case NexusHal.MH_POINTER_MOVEEVENT /* 25 */:
            case NexusHal.MH_POINTER_DBLCLKEVENT /* 26 */:
            case NexusHal.MH_POINTER_REPEATEVENT /* 27 */:
            case NexusHal.MH_WCDMA_CDMA_EVENT /* 30 */:
            case 34:
            case NexusHal.MH_KEY_POUND /* 35 */:
            case 36:
            case 37:
            case 38:
            case 39:
            case 40:
            case 41:
            case NexusHal.MH_KEY_ASTERISK /* 42 */:
            case 43:
            case 44:
            case 46:
            case NexusHal.MH_KEY_0 /* 48 */:
            case NexusHal.MH_KEY_1 /* 49 */:
            case NexusHal.MH_KEY_2 /* 50 */:
            case NexusHal.MH_KEY_5 /* 53 */:
            case NexusHal.MH_KEY_7 /* 55 */:
            case NexusHal.MH_KEY_8 /* 56 */:
            case NexusHal.MH_KEY_9 /* 57 */:
            case 58:
            case 59:
            case 60:
            case 61:
            case 62:
            case 63:
            case CustomVariable.MAX_CUSTOM_VARIABLE_LENGTH /* 64 */:
            case 65:
            default:
                return _keyCode;
            case 7:
                return 48;
            case 8:
                return 49;
            case 9:
                return 50;
            case 10:
                return 51;
            case 11:
                return 52;
            case 12:
                return 53;
            case 13:
                return 54;
            case 14:
                return 55;
            case 15:
                return 56;
            case 16:
                return 57;
            case 19:
                return -1;
            case 20:
                return -2;
            case NexusHal.MH_REMOTE_KEY_RELEASEEVENT /* 21 */:
                return -3;
            case NexusHal.MH_REMOTE_KEY_REPEATEVENT /* 22 */:
                return -4;
            case NexusHal.MH_POINTER_PRESSEVENT /* 23 */:
                return -5;
            case NexusHal.MH_LCD_EVENT /* 28 */:
                return -16;
            case NexusHal.MH_EXTMEM_EVENT /* 29 */:
                return -3;
            case NexusHal.NEXUS_KEY_PRESS_RELEASE /* 31 */:
            case 47:
            case NexusHal.MH_KEY_4 /* 52 */:
            case NexusHal.MH_KEY_6 /* 54 */:
                return -2;
            case 32:
                return -4;
            case NexusHal.NEXUS_IAP_ERROR_EVENT /* 33 */:
            case 45:
            case NexusHal.MH_KEY_3 /* 51 */:
                return -1;
            case 66:
                return -5;
            case 67:
                return -16;
        }
    }

    public void removeAllUIArea() {
        if (this.subViews != null) {
            this.subViews.cleanUpAll();
            this.isStatusChanging = true;
        }
    }

    public void releaseAll() {
        if (this.subViews != null) {
            this.subViews.releaseAll();
            this.subViews = null;
        }
    }

    @Override // com.gamevil.nexus2.Natives.UIListener
    public void OnUIStatusChange(int _status) {
    }

    @Override // com.gamevil.nexus2.Natives.UIListener
    public void OnSoundPlay(int sndID, int vol, boolean isLoop) {
    }

    @Override // com.gamevil.nexus2.Natives.UIListener
    public void OnStopSound() {
    }

    @Override // com.gamevil.nexus2.Natives.UIListener
    public void OnVibrate(int _time) {
    }

    @Override // com.gamevil.nexus2.Natives.UIListener
    public void OnEvent(int _event) {
    }
}
