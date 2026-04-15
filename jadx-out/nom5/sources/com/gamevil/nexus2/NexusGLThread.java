package com.gamevil.nexus2;

import android.view.SurfaceHolder;
import com.gamevil.nexus2.Natives;
import com.gamevil.nexus2.NexusGLSurfaceView;
import java.util.ArrayList;
import java.util.concurrent.Semaphore;
import javax.microedition.khronos.opengles.GL10;

/* JADX INFO: loaded from: classes.dex */
class NexusGLThread extends Thread implements Natives.EventListener {
    private static int m_nPeriod;
    private boolean mContextLost;
    private EglHelper mEglHelper;
    private boolean mHasFocus;
    private boolean mHasSurface;
    private SurfaceHolder mHolder;
    private boolean mPaused;
    private NexusGLSurfaceView.Renderer mRenderer;
    private long nStartTime;
    private boolean mSizeChanged = true;
    private ArrayList<Runnable> mEventQueue = new ArrayList<>();
    private final Semaphore sEglSemaphore = new Semaphore(1);
    private boolean mDone = false;
    private int mWidth = 0;
    private int mHeight = 0;

    NexusGLThread(NexusGLSurfaceView.Renderer renderer, SurfaceHolder holder) {
        this.mRenderer = renderer;
        this.mHolder = holder;
        setName("NxGLThread");
    }

    public static void SetFPS(int nFPS) {
        if (nFPS > 0) {
            m_nPeriod = 1000 / nFPS;
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        try {
            try {
                this.sEglSemaphore.acquire();
                try {
                    guardedRun();
                } catch (InterruptedException e) {
                }
            } catch (InterruptedException e2) {
            }
        } finally {
            this.sEglSemaphore.release();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0085, code lost:
    
        if (r8 == false) goto L31;
     */
    /* JADX WARN: Code restructure failed: missing block: B:30:0x0087, code lost:
    
        r21.mEglHelper.start(r4);
        r13 = true;
        r3 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0091, code lost:
    
        if (r3 == false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x0093, code lost:
    
        r6 = (javax.microedition.khronos.opengles.GL10) r21.mEglHelper.createSurface(r21.mHolder);
        r12 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00a5, code lost:
    
        if (r13 == false) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00a7, code lost:
    
        r21.mRenderer.surfaceCreated(r6);
        r13 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00b0, code lost:
    
        if (r12 == false) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00b2, code lost:
    
        r21.mRenderer.surfaceChanged(r6, r0, r0);
        r12 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00bb, code lost:
    
        if (r0 <= 0) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00bd, code lost:
    
        if (r0 <= 0) goto L40;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00bf, code lost:
    
        r21.mRenderer.drawFrame(r6);
        r21.mEglHelper.swap();
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x00cf, code lost:
    
        r10 = ((long) com.gamevil.nexus2.NexusGLThread.m_nPeriod) - (java.lang.System.currentTimeMillis() - r21.nStartTime);
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00e4, code lost:
    
        if (r10 <= 0) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00e6, code lost:
    
        java.lang.Thread.sleep(r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00eb, code lost:
    
        r5 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00ec, code lost:
    
        r5.printStackTrace();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void guardedRun() throws InterruptedException {
        this.mEglHelper = new EglHelper();
        int[] configSpec = this.mRenderer.getConfigSpec();
        this.mEglHelper.start(configSpec);
        GL10 gl = null;
        boolean tellRendererSurfaceCreated = true;
        boolean tellRendererSurfaceChanged = true;
        while (true) {
            if (this.mDone) {
                break;
            }
            this.nStartTime = System.currentTimeMillis();
            boolean needStart = false;
            synchronized (this) {
                while (true) {
                    Runnable r = getEvent();
                    if (r == null) {
                        break;
                    } else {
                        r.run();
                    }
                }
                if (this.mPaused) {
                    this.mEglHelper.finish();
                    needStart = true;
                }
                if (needToWait()) {
                    while (needToWait()) {
                        wait();
                    }
                }
                if (this.mDone) {
                    break;
                }
                boolean changed = this.mSizeChanged;
                int w = this.mWidth;
                int h = this.mHeight;
                this.mSizeChanged = false;
            }
        }
        this.mEglHelper.finish();
    }

    private boolean needToWait() {
        return (this.mPaused || !this.mHasFocus || !this.mHasSurface || this.mContextLost) && !this.mDone;
    }

    public void surfaceCreated() {
        synchronized (this) {
            this.mHasSurface = true;
            this.mContextLost = false;
            notify();
        }
    }

    public void surfaceDestroyed() {
        synchronized (this) {
            this.mHasSurface = false;
            notify();
        }
    }

    public void onPause() {
        synchronized (this) {
            this.mPaused = true;
        }
    }

    public void onResume() {
        synchronized (this) {
            this.mPaused = false;
            notify();
        }
    }

    public void onWindowFocusChanged(boolean hasFocus) {
        synchronized (this) {
            this.mHasFocus = hasFocus;
            notifyAll();
        }
    }

    public void onSurfaceChaged(int w, int h) {
        synchronized (this) {
            this.mWidth = w;
            this.mHeight = h;
            this.mSizeChanged = true;
        }
    }

    public void requestExitAndWait() {
        synchronized (this) {
            this.mDone = true;
            notify();
        }
        try {
            join();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public void queueEvent(Runnable r) {
        synchronized (this) {
            this.mEventQueue.add(r);
        }
    }

    private Runnable getEvent() {
        synchronized (this) {
            if (this.mEventQueue.size() > 0) {
                return this.mEventQueue.remove(0);
            }
            return null;
        }
    }

    @Override // com.gamevil.nexus2.Natives.EventListener
    public void GWSwapBuffers() {
        if (this.mEglHelper != null && !this.mEglHelper.swap()) {
            System.out.println("!!Error  EGL_CONTEXT_LOST ");
        }
    }

    @Override // com.gamevil.nexus2.Natives.EventListener
    public void OnMessage(String _msg) {
        System.out.println("NXGLThread::OnMessage " + _msg);
    }
}
