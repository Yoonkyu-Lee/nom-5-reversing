package com.gamevil.nexus2;

import android.view.SurfaceHolder;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL;

/* JADX INFO: loaded from: classes.dex */
public class EglHelper {
    EGL10 mEgl;
    EGLConfig mEglConfig;
    EGLContext mEglContext;
    EGLDisplay mEglDisplay;
    EGLSurface mEglSurface;

    public void start(int[] configSpec) {
        this.mEgl = (EGL10) EGLContext.getEGL();
        this.mEglDisplay = this.mEgl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
        int[] version = new int[2];
        this.mEgl.eglInitialize(this.mEglDisplay, version);
        EGLConfig[] configs = new EGLConfig[1];
        int[] num_config = new int[1];
        this.mEgl.eglChooseConfig(this.mEglDisplay, configSpec, configs, 1, num_config);
        this.mEglConfig = configs[0];
        this.mEglContext = this.mEgl.eglCreateContext(this.mEglDisplay, this.mEglConfig, EGL10.EGL_NO_CONTEXT, null);
        this.mEglSurface = null;
    }

    public GL createSurface(SurfaceHolder holder) {
        if (this.mEglSurface != null) {
            this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            this.mEgl.eglDestroySurface(this.mEglDisplay, this.mEglSurface);
        }
        this.mEglSurface = this.mEgl.eglCreateWindowSurface(this.mEglDisplay, this.mEglConfig, holder, null);
        this.mEgl.eglMakeCurrent(this.mEglDisplay, this.mEglSurface, this.mEglSurface, this.mEglContext);
        GL gl = this.mEglContext.getGL();
        return gl;
    }

    public boolean swap() {
        this.mEgl.eglSwapBuffers(this.mEglDisplay, this.mEglSurface);
        return this.mEgl.eglGetError() != 12302;
    }

    public void finish() {
        if (this.mEglSurface != null) {
            this.mEgl.eglMakeCurrent(this.mEglDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
            this.mEgl.eglDestroySurface(this.mEglDisplay, this.mEglSurface);
            this.mEglSurface = null;
        }
        if (this.mEglContext != null) {
            this.mEgl.eglDestroyContext(this.mEglDisplay, this.mEglContext);
            this.mEglContext = null;
        }
        if (this.mEglDisplay != null) {
            this.mEgl.eglTerminate(this.mEglDisplay);
            this.mEglDisplay = null;
        }
    }
}
