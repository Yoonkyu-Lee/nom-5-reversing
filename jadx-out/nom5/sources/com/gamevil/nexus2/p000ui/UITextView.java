package com.gamevil.nexus2.p000ui;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;

/* JADX INFO: loaded from: classes.dex */
public class UITextView extends View {

    /* JADX INFO: renamed from: k */
    String f5k;
    String slash;
    StringBuffer strBuffer;
    String strFps;
    String strMem;

    public UITextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.strFps = "fps: ";
        this.strMem = " | heap: ";
        this.slash = " / ";
        this.f5k = "Kb";
        this.strBuffer = new StringBuffer();
        setBackgroundColor(1426063360);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        UIGraphics.setCanvas(canvas);
        UIGraphics.drawString(this.strBuffer.toString(), 12, 12, 12, -16711681, 4);
    }

    public void onDraw() {
        postInvalidate();
    }

    public void setFPS(int _fps) {
        this.strBuffer.delete(0, this.strBuffer.length());
        this.strBuffer.append(this.strFps).append(_fps);
    }

    public void setMemeoryStatus(int _current, int _total) {
        this.strBuffer.append(this.strMem).append(_current).append(this.f5k).append(this.slash).append(_total).append(this.f5k);
    }
}
