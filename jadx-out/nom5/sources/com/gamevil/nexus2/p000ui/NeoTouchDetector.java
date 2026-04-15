package com.gamevil.nexus2.p000ui;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.view.MotionEvent;

/* JADX INFO: loaded from: classes.dex */
public abstract class NeoTouchDetector {
    private static final int INVALID_POINTER_ID = -1;
    private static int mActivePointerId = -1;
    OnActionListener mListener;

    public interface OnActionListener {
        void onAction(int i, float f, float f2, int i2);
    }

    public abstract boolean onTouchEvent(MotionEvent motionEvent);

    public static NeoTouchDetector newInstance(Context context, OnActionListener listener) {
        NeoTouchDetector detector;
        Froyo froyo = null;
        int sdkVersion = Integer.parseInt(Build.VERSION.SDK);
        Log.i("##JAVA##", "@@@@@@@@@@@@@ Create Cupcake NeoTouchDetector newInstance");
        if (sdkVersion < 5) {
            Log.i("##JAVA##", "@@@@@@@@@@@@@ Create Cupcake NeoTouchDetector");
            detector = new Cupcake(froyo, froyo);
        } else if (sdkVersion < 8) {
            Log.i("##JAVA##", "@@@@@@@@@@@@@ Create Eclair NeoTouchDetector");
            detector = new Eclair(froyo, froyo);
        } else {
            Log.i("##JAVA##", "@@@@@@@@@@@@@ Create Froyo NeoTouchDetector");
            detector = new Froyo(froyo);
        }
        detector.mListener = listener;
        return detector;
    }

    private static class Cupcake extends NeoTouchDetector {
        private Cupcake() {
        }

        /* synthetic */ Cupcake(Cupcake cupcake) {
            this();
        }

        /* synthetic */ Cupcake(Cupcake cupcake, Cupcake cupcake2) {
            this();
        }

        float getActiveX(MotionEvent ev) {
            return ev.getX();
        }

        float getActiveY(MotionEvent ev) {
            return ev.getY();
        }

        @Override // com.gamevil.nexus2.p000ui.NeoTouchDetector
        public boolean onTouchEvent(MotionEvent ev) {
            switch (ev.getAction()) {
                case 0:
                    if (NeoTouchDetector.mActivePointerId == -1) {
                        float _x = getActiveX(ev);
                        float _y = getActiveY(ev);
                        NeoTouchDetector.mActivePointerId = 0;
                        this.mListener.onAction(101, _x, _y, 0);
                    }
                    break;
                case 1:
                    float _x2 = getActiveX(ev);
                    float _y2 = getActiveY(ev);
                    NeoTouchDetector.mActivePointerId = -1;
                    this.mListener.onAction(100, _x2, _y2, 0);
                    break;
            }
            return true;
        }
    }

    private static class Eclair extends Cupcake {
        private Eclair() {
            super(null);
        }

        /* synthetic */ Eclair(Eclair eclair) {
            this();
        }

        /* synthetic */ Eclair(Eclair eclair, Eclair eclair2) {
            this();
        }

        @Override // com.gamevil.nexus2.ui.NeoTouchDetector.Cupcake, com.gamevil.nexus2.p000ui.NeoTouchDetector
        public boolean onTouchEvent(MotionEvent ev) {
            int action = ev.getAction();
            switch (action & 255) {
                case 2:
                    ev.getPointerId((ev.getAction() & 65280) >> 8);
                    if (NeoTouchDetector.mActivePointerId >= 0) {
                        for (int _i = 0; _i <= NeoTouchDetector.mActivePointerId; _i++) {
                            float _x = ev.getX(_i);
                            float _y = ev.getY(_i);
                            this.mListener.onAction(102, _x, _y, ev.getPointerId(_i));
                        }
                    }
                    break;
                case 3:
                    NeoTouchDetector.mActivePointerId = -1;
                    break;
                case 5:
                    if (NeoTouchDetector.mActivePointerId >= 0) {
                        int pointerIndex = (action & 65280) >> 8;
                        int pointerId = ev.getPointerId(pointerIndex);
                        NeoTouchDetector.mActivePointerId++;
                        float _x2 = ev.getX(pointerIndex);
                        float _y2 = ev.getY(pointerIndex);
                        this.mListener.onAction(101, _x2, _y2, pointerId);
                    }
                    break;
                case 6:
                    int pointerIndex2 = (ev.getAction() & 65280) >> 8;
                    int pointerId2 = ev.getPointerId(pointerIndex2);
                    float _x3 = ev.getX(pointerIndex2);
                    float _y3 = ev.getY(pointerIndex2);
                    NeoTouchDetector.mActivePointerId--;
                    this.mListener.onAction(100, _x3, _y3, pointerId2);
                    break;
            }
            return super.onTouchEvent(ev);
        }
    }

    private static class Froyo extends Eclair {
        private Froyo() {
            super(null);
        }

        /* synthetic */ Froyo(Froyo froyo) {
            this();
        }

        @Override // com.gamevil.nexus2.ui.NeoTouchDetector.Eclair, com.gamevil.nexus2.ui.NeoTouchDetector.Cupcake, com.gamevil.nexus2.p000ui.NeoTouchDetector
        public boolean onTouchEvent(MotionEvent ev) {
            return super.onTouchEvent(ev);
        }
    }
}
