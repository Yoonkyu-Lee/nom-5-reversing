.class public interface abstract Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;
.super Ljava/lang/Object;
.source "NexusGLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/NexusGLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Renderer"
.end annotation


# virtual methods
.method public abstract drawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
.end method

.method public abstract getConfigSpec()[I
.end method

.method public abstract surfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
.end method

.method public abstract surfaceCreated(Ljavax/microedition/khronos/opengles/GL10;)V
.end method
