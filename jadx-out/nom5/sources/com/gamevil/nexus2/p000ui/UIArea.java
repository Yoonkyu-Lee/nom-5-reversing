package com.gamevil.nexus2.p000ui;

import android.graphics.Canvas;
import android.view.MotionEvent;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import javax.microedition.khronos.opengles.GL10;

/* JADX INFO: loaded from: classes.dex */
public abstract class UIArea {
    private static final int INVALID_POINTER_ID = -1;
    public static final int OUT_OF_AREA = -1;
    public static final int UIAREA_ACTION_DOWN = 101;
    public static final int UIAREA_ACTION_MOVE = 102;
    public static final int UIAREA_ACTION_NONE = -99;
    public static final int UIAREA_ACTION_UP = 100;
    private static Method mFindPointerIndex;
    private static Method mGetPointerId;
    private static Method mGetX;
    private static Method mGetY;
    public static boolean mIsMultiTouchSupported = false;
    public int mActivePointerId = -1;
    public int mHeight;
    public boolean mIsHidden;
    public int mPointX;
    public int mPointY;
    public int mStatus;
    public int mTag;
    public int mUiAction;
    public boolean mUseTouchMove;
    public int mWidth;

    /* JADX INFO: renamed from: mX */
    public int f3mX;

    /* JADX INFO: renamed from: mY */
    public int f4mY;

    public abstract void initialize();

    public abstract void onAction(int i, int i2, int i3);

    public abstract void onDraw(Canvas canvas);

    public abstract void onDraw(GL10 gl10);

    public abstract void releaseAll();

    public abstract void setGLTexturPlane(GL10 gl10);

    static {
        initCompatibility();
    }

    public static void initCompatibility() {
        try {
            mGetPointerId = MotionEvent.class.getMethod("getPointerId", Integer.TYPE);
            mFindPointerIndex = MotionEvent.class.getMethod("findPointerIndex", Integer.TYPE);
            mGetX = MotionEvent.class.getMethod("getX", Integer.TYPE);
            mGetY = MotionEvent.class.getMethod("getY", Integer.TYPE);
            mIsMultiTouchSupported = true;
        } catch (NoSuchMethodException e) {
            mIsMultiTouchSupported = false;
            e.printStackTrace();
        } catch (SecurityException e2) {
            mIsMultiTouchSupported = false;
            e2.printStackTrace();
        }
    }

    public int getPointerId(MotionEvent _event, int _pointerIndex) {
        if (mGetPointerId == null) {
            return 0;
        }
        try {
            Integer result = (Integer) mGetPointerId.invoke(_event, Integer.valueOf(_pointerIndex));
            int _count = result.intValue();
            return _count;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return 0;
        } catch (IllegalArgumentException e2) {
            e2.printStackTrace();
            return 0;
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
            return 0;
        }
    }

    public int findPointerIndex(MotionEvent _event, int _pointerID) {
        if (mGetPointerId == null) {
            return 0;
        }
        try {
            Integer result = (Integer) mFindPointerIndex.invoke(_event, Integer.valueOf(_pointerID));
            int _count = result.intValue();
            return _count;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return 0;
        } catch (IllegalArgumentException e2) {
            e2.printStackTrace();
            return 0;
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
            return 0;
        }
    }

    public int getX(MotionEvent event, int _id) {
        if (mGetX == null) {
            return 0;
        }
        try {
            Float result = (Float) mGetX.invoke(event, Integer.valueOf(_id));
            int _pointX = result.intValue();
            return _pointX;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return 0;
        } catch (IllegalArgumentException e2) {
            e2.printStackTrace();
            return 0;
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
            return 0;
        }
    }

    public int getY(MotionEvent event, int _id) {
        if (mGetY == null) {
            return 0;
        }
        try {
            Float result = (Float) mGetY.invoke(event, Integer.valueOf(_id));
            int _pointX = result.intValue();
            return _pointX;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return 0;
        } catch (IllegalArgumentException e2) {
            e2.printStackTrace();
            return 0;
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
            return 0;
        }
    }

    public int getTag() {
        return this.mTag;
    }

    public void setTag(int _tag) {
        this.mTag = _tag;
    }

    public void setIsHidden(boolean _isHide) {
        this.mActivePointerId = -1;
        this.mIsHidden = _isHide;
    }

    public boolean getIsHidden() {
        return this.mIsHidden;
    }

    public void setIsUsingTouchMove(boolean _enable) {
        this.mUseTouchMove = _enable;
    }

    public void setPosition(int _x, int _y, int _width, int _height) {
        this.f3mX = _x;
        this.f4mY = _y;
        this.mWidth = _width;
        this.mHeight = _height;
    }

    public boolean pointInArea(int _x, int _y) {
        if (this.mIsHidden) {
            return false;
        }
        return this.f3mX <= _x && this.f3mX + this.mWidth >= _x && this.f4mY <= _y && this.f4mY + this.mHeight >= _y;
    }

    public boolean onTouchEvent(MotionEvent event) {
        int action = event.getAction();
        if (mIsMultiTouchSupported) {
            switch (action & 255) {
                case 0:
                    int x = (int) event.getX();
                    int y = (int) event.getY();
                    if (pointInArea(x, y)) {
                        this.mActivePointerId = getPointerId(event, 0);
                        onAction(101, x, y);
                    }
                    break;
                case 1:
                    this.mActivePointerId = -1;
                    int x2 = (int) event.getX();
                    int y2 = (int) event.getY();
                    if (pointInArea(x2, y2)) {
                        onAction(100, x2, y2);
                    }
                    break;
                case 2:
                    if (this.mActivePointerId >= 0) {
                        int pointerIndex = (action & 65280) >> 8;
                        onAction(102, getX(event, pointerIndex), getY(event, pointerIndex));
                    }
                    break;
                case 3:
                    this.mActivePointerId = -1;
                    break;
                case 5:
                    int pind = (action & 65280) >> 8;
                    int pid = getPointerId(event, pind);
                    int x3 = getX(event, pid);
                    int y3 = getY(event, pid);
                    if (pointInArea(x3, y3)) {
                        this.mActivePointerId = pid;
                        onAction(101, x3, y3);
                    }
                    break;
                case 6:
                    int pointerId = getPointerId(event, (action & 65280) >> 8);
                    onAction(100, getX(event, pointerId), getY(event, pointerId));
                    break;
            }
            return true;
        }
        switch (action) {
            case 0:
                int x4 = (int) event.getX();
                int y4 = (int) event.getY();
                if (pointInArea(x4, y4)) {
                    onAction(101, x4, y4);
                }
                break;
            case 1:
                onAction(100, (int) event.getX(), (int) event.getY());
                break;
            case 2:
                int x5 = (int) event.getX();
                int y5 = (int) event.getY();
                if (pointInArea(x5, y5)) {
                    onAction(102, x5, y5);
                }
                break;
        }
        return true;
    }

    FloatBuffer getFloatBufferFromFloatArray(float[] array) {
        ByteBuffer tempBuffer = ByteBuffer.allocateDirect(array.length * 4);
        tempBuffer.order(ByteOrder.nativeOrder());
        FloatBuffer buffer = tempBuffer.asFloatBuffer();
        buffer.put(array);
        buffer.position(0);
        return buffer;
    }
}
