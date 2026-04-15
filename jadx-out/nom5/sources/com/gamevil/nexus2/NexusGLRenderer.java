package com.gamevil.nexus2;

import com.gamevil.nexus2.NexusGLSurfaceView;
import com.gamevil.nexus2.p000ui.EventQueue;
import javax.microedition.khronos.opengles.GL10;

/* JADX INFO: loaded from: classes.dex */
public class NexusGLRenderer implements NexusGLSurfaceView.Renderer {
    public static NexusGLRenderer m_renderer;
    private int currentMotionEvent = 8;
    private int handleCletParam1 = 0;
    private int handleCletParam2 = 0;
    private int pointerId;

    @Override // com.gamevil.nexus2.NexusGLSurfaceView.Renderer
    public void drawFrame(GL10 gl) {
        sendHandleCletEvent();
        Natives.NativeRender();
        if (NexusGLActivity.uiViewControll != null) {
            NexusGLActivity.uiViewControll.checkUIStatus();
        }
    }

    @Override // com.gamevil.nexus2.NexusGLSurfaceView.Renderer
    public int[] getConfigSpec() {
        int[] configSpec = {12325, 16, 12344};
        return configSpec;
    }

    @Override // com.gamevil.nexus2.NexusGLSurfaceView.Renderer
    public void surfaceChanged(GL10 _gl, int _width, int _height) {
        NexusGLActivity.displayWidth = _width;
        NexusGLActivity.displayHeight = _height;
        if (NexusGLActivity.uiViewControll != null) {
            NexusGLActivity.uiViewControll.removeAllUIArea();
            NexusGLActivity.uiViewControll.setSize(_width, _height);
        }
        Natives.NativeInitDeviceInfo(NexusGLActivity.gameScreenWidth, NexusGLActivity.gameScreenHeight);
        Natives.NativeResize(_width, _height);
    }

    @Override // com.gamevil.nexus2.NexusGLSurfaceView.Renderer
    public void surfaceCreated(GL10 gl) {
        m_renderer = this;
        Natives.NativeInitWithBufferSize(NexusGLActivity.gameScreenWidth, NexusGLActivity.gameScreenHeight);
    }

    public void setTouchEvent(int action, int _param1, int _param2, int _param3) {
        if (NexusGLActivity.uiViewControll.eventQueue.IsFull()) {
            NexusGLActivity.uiViewControll.eventQueue.ClearEvent();
            NexusGLActivity.uiViewControll.eventQueue.Enqueue(action, _param1, _param2, _param3);
        } else {
            NexusGLActivity.uiViewControll.eventQueue.Enqueue(action, _param1, _param2, _param3);
        }
    }

    private void sendHandleCletEvent() {
        if (!NexusGLActivity.uiViewControll.eventQueue.IsEmpty()) {
            EventQueue.EventItem currentEvent = NexusGLActivity.uiViewControll.eventQueue.Dequeue();
            Natives.handleCletEvent(currentEvent.GetEvent(), currentEvent.GetParam1(), currentEvent.GetParam2(), currentEvent.GetPointerID());
        }
    }
}
