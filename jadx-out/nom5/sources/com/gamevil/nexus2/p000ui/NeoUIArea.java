package com.gamevil.nexus2.p000ui;

import android.graphics.Canvas;

/* JADX INFO: loaded from: classes.dex */
public abstract class NeoUIArea {
    public static final int OUT_OF_AREA = -1;
    public static final int UIAREA_ACTION_DOWN = 101;
    public static final int UIAREA_ACTION_MOVE = 102;
    public static final int UIAREA_ACTION_NONE = -99;
    public static final int UIAREA_ACTION_UP = 100;
    public int mHeight;
    public boolean mIsHidden = false;
    public int mStatus;
    public int mTag;
    public boolean mUseTouchMove;
    public int mWidth;

    /* JADX INFO: renamed from: mX */
    public int f1mX;

    /* JADX INFO: renamed from: mY */
    public int f2mY;

    public abstract void initialize();

    public abstract void onAction(int i, float f, float f2, int i2);

    public abstract void onDraw(Canvas canvas);

    public abstract void releaseAll();

    public int getTag() {
        return this.mTag;
    }

    public void setTag(int _tag) {
        this.mTag = _tag;
    }

    public void setIsHidden(boolean _isHide) {
        this.mIsHidden = _isHide;
    }

    public boolean getIsHidden() {
        return this.mIsHidden;
    }

    public void setIsUsingTouchMove(boolean _enable) {
        this.mUseTouchMove = _enable;
    }

    public void setPosition(int _x, int _y, int _width, int _height) {
        this.f1mX = _x;
        this.f2mY = _y;
        this.mWidth = _width;
        this.mHeight = _height;
    }

    public boolean pointInArea(int _x, int _y) {
        if (this.mIsHidden) {
            return false;
        }
        return this.f1mX <= _x && this.f1mX + this.mWidth >= _x && this.f2mY <= _y && this.f2mY + this.mHeight >= _y;
    }
}
