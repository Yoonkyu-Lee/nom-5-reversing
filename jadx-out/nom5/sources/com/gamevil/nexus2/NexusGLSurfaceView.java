package com.gamevil.nexus2;

import android.content.Context;
import android.util.AttributeSet;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import javax.microedition.khronos.opengles.GL10;

/* JADX INFO: loaded from: classes.dex */
public class NexusGLSurfaceView extends SurfaceView implements SurfaceHolder.Callback {
    private NexusGLThread mGLThread;
    private SurfaceHolder mHolder;

    public interface Renderer {
        void drawFrame(GL10 gl10);

        int[] getConfigSpec();

        void surfaceChanged(GL10 gl10, int i, int i2);

        void surfaceCreated(GL10 gl10);
    }

    public NexusGLSurfaceView(Context context) {
        super(context);
        init();
    }

    public NexusGLSurfaceView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    private void init() {
        this.mHolder = getHolder();
        this.mHolder.addCallback(this);
        this.mHolder.setType(2);
    }

    public SurfaceHolder getSurfaceHolder() {
        return this.mHolder;
    }

    public void setRenderer(Renderer renderer) {
        this.mGLThread = new NexusGLThread(renderer, this.mHolder);
        this.mGLThread.start();
        Natives.setEventListener(this.mGLThread);
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceCreated(SurfaceHolder holder) {
        this.mGLThread.surfaceCreated();
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceDestroyed(SurfaceHolder holder) {
        this.mGLThread.surfaceDestroyed();
    }

    @Override // android.view.SurfaceHolder.Callback
    public void surfaceChanged(SurfaceHolder holder, int format, int w, int h) {
        this.mGLThread.onSurfaceChaged(w, h);
    }

    public void onPause() {
        this.mGLThread.onPause();
        Natives.NativePauseClet();
    }

    public void onResume() {
        this.mGLThread.onResume();
        Natives.NativeResumeClet();
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        this.mGLThread.onWindowFocusChanged(hasFocus);
    }

    public void queueEvent(Runnable r) {
        this.mGLThread.queueEvent(r);
    }

    @Override // android.view.SurfaceView, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mGLThread.requestExitAndWait();
    }

    public void releaseAll() {
        this.mHolder = null;
    }
}
