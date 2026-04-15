.class public abstract Lcom/gamevil/nexus2/ui/UIArea;
.super Ljava/lang/Object;
.source "UIArea.java"


# static fields
.field private static final INVALID_POINTER_ID:I = -0x1

.field public static final OUT_OF_AREA:I = -0x1

.field public static final UIAREA_ACTION_DOWN:I = 0x65

.field public static final UIAREA_ACTION_MOVE:I = 0x66

.field public static final UIAREA_ACTION_NONE:I = -0x63

.field public static final UIAREA_ACTION_UP:I = 0x64

.field private static mFindPointerIndex:Ljava/lang/reflect/Method;

.field private static mGetPointerId:Ljava/lang/reflect/Method;

.field private static mGetX:Ljava/lang/reflect/Method;

.field private static mGetY:Ljava/lang/reflect/Method;

.field public static mIsMultiTouchSupported:Z


# instance fields
.field public mActivePointerId:I

.field public mHeight:I

.field public mIsHidden:Z

.field public mPointX:I

.field public mPointY:I

.field public mStatus:I

.field public mTag:I

.field public mUiAction:I

.field public mUseTouchMove:Z

.field public mWidth:I

.field public mX:I

.field public mY:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x0

    sput-boolean v0, Lcom/gamevil/nexus2/ui/UIArea;->mIsMultiTouchSupported:Z

    .line 65
    invoke-static {}, Lcom/gamevil/nexus2/ui/UIArea;->initCompatibility()V

    .line 31
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, -0x1

    iput v0, p0, Lcom/gamevil/nexus2/ui/UIArea;->mActivePointerId:I

    .line 31
    return-void
.end method

.method public static initCompatibility()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 79
    :try_start_0
    const-class v1, Landroid/view/MotionEvent;

    const-string v2, "getPointerId"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/gamevil/nexus2/ui/UIArea;->mGetPointerId:Ljava/lang/reflect/Method;

    .line 80
    const-class v1, Landroid/view/MotionEvent;

    const-string v2, "findPointerIndex"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/gamevil/nexus2/ui/UIArea;->mFindPointerIndex:Ljava/lang/reflect/Method;

    .line 81
    const-class v1, Landroid/view/MotionEvent;

    const-string v2, "getX"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/gamevil/nexus2/ui/UIArea;->mGetX:Ljava/lang/reflect/Method;

    .line 82
    const-class v1, Landroid/view/MotionEvent;

    const-string v2, "getY"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcom/gamevil/nexus2/ui/UIArea;->mGetY:Ljava/lang/reflect/Method;

    .line 83
    const/4 v1, 0x1

    sput-boolean v1, Lcom/gamevil/nexus2/ui/UIArea;->mIsMultiTouchSupported:Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1

    .line 91
    :goto_0
    return-void

    .line 84
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 85
    .local v0, "e":Ljava/lang/SecurityException;
    sput-boolean v6, Lcom/gamevil/nexus2/ui/UIArea;->mIsMultiTouchSupported:Z

    .line 86
    invoke-virtual {v0}, Ljava/lang/SecurityException;->printStackTrace()V

    goto :goto_0

    .line 87
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v1

    move-object v0, v1

    .line 88
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    sput-boolean v6, Lcom/gamevil/nexus2/ui/UIArea;->mIsMultiTouchSupported:Z

    .line 89
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public findPointerIndex(Landroid/view/MotionEvent;I)I
    .locals 7
    .param p1, "_event"    # Landroid/view/MotionEvent;
    .param p2, "_pointerID"    # I

    .prologue
    .line 117
    const/4 v0, 0x0

    .line 119
    .local v0, "_count":I
    sget-object v3, Lcom/gamevil/nexus2/ui/UIArea;->mGetPointerId:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_0

    .line 123
    :try_start_0
    sget-object v3, Lcom/gamevil/nexus2/ui/UIArea;->mFindPointerIndex:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 124
    .local v2, "result":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    .line 134
    .end local v2    # "result":Ljava/lang/Integer;
    :cond_0
    :goto_0
    return v0

    .line 125
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 126
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .line 127
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v3

    move-object v1, v3

    .line 128
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 129
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v3

    move-object v1, v3

    .line 130
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0
.end method

.method getFloatBufferFromFloatArray([F)Ljava/nio/FloatBuffer;
    .locals 3
    .param p1, "array"    # [F

    .prologue
    .line 369
    array-length v2, p1

    mul-int/lit8 v2, v2, 0x4

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 370
    .local v1, "tempBuffer":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 371
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    .line 372
    .local v0, "buffer":Ljava/nio/FloatBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 373
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 374
    return-object v0
.end method

.method public getIsHidden()Z
    .locals 1

    .prologue
    .line 198
    iget-boolean v0, p0, Lcom/gamevil/nexus2/ui/UIArea;->mIsHidden:Z

    return v0
.end method

.method public getPointerId(Landroid/view/MotionEvent;I)I
    .locals 7
    .param p1, "_event"    # Landroid/view/MotionEvent;
    .param p2, "_pointerIndex"    # I

    .prologue
    .line 95
    const/4 v0, 0x0

    .line 97
    .local v0, "_count":I
    sget-object v3, Lcom/gamevil/nexus2/ui/UIArea;->mGetPointerId:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_0

    .line 101
    :try_start_0
    sget-object v3, Lcom/gamevil/nexus2/ui/UIArea;->mGetPointerId:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 102
    .local v2, "result":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    .line 112
    .end local v2    # "result":Ljava/lang/Integer;
    :cond_0
    :goto_0
    return v0

    .line 103
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 104
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .line 105
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v3

    move-object v1, v3

    .line 106
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 107
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v3

    move-object v1, v3

    .line 108
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0
.end method

.method public getTag()I
    .locals 1

    .prologue
    .line 183
    iget v0, p0, Lcom/gamevil/nexus2/ui/UIArea;->mTag:I

    return v0
.end method

.method public getX(Landroid/view/MotionEvent;I)I
    .locals 7
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "_id"    # I

    .prologue
    .line 139
    const/4 v0, 0x0

    .line 140
    .local v0, "_pointX":I
    sget-object v3, Lcom/gamevil/nexus2/ui/UIArea;->mGetX:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_0

    .line 144
    :try_start_0
    sget-object v3, Lcom/gamevil/nexus2/ui/UIArea;->mGetX:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    .line 145
    .local v2, "result":Ljava/lang/Float;
    invoke-virtual {v2}, Ljava/lang/Float;->intValue()I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    .line 156
    .end local v2    # "result":Ljava/lang/Float;
    :cond_0
    :goto_0
    return v0

    .line 146
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 147
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .line 148
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v3

    move-object v1, v3

    .line 149
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 150
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v3

    move-object v1, v3

    .line 151
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0
.end method

.method public getY(Landroid/view/MotionEvent;I)I
    .locals 7
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "_id"    # I

    .prologue
    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, "_pointX":I
    sget-object v3, Lcom/gamevil/nexus2/ui/UIArea;->mGetY:Ljava/lang/reflect/Method;

    if-eqz v3, :cond_0

    .line 166
    :try_start_0
    sget-object v3, Lcom/gamevil/nexus2/ui/UIArea;->mGetY:Ljava/lang/reflect/Method;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    .line 167
    .local v2, "result":Ljava/lang/Float;
    invoke-virtual {v2}, Ljava/lang/Float;->intValue()I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    move-result v0

    .line 176
    .end local v2    # "result":Ljava/lang/Float;
    :cond_0
    :goto_0
    return v0

    .line 168
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 169
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .line 170
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v3

    move-object v1, v3

    .line 171
    .local v1, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 172
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v3

    move-object v1, v3

    .line 173
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0
.end method

.method public abstract initialize()V
.end method

.method public abstract onAction(III)V
.end method

.method public abstract onDraw(Landroid/graphics/Canvas;)V
.end method

.method public abstract onDraw(Ljavax/microedition/khronos/opengles/GL10;)V
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/16 v12, 0x66

    const/4 v11, -0x1

    const v10, 0xff00

    const/16 v9, 0x65

    const/16 v8, 0x64

    .line 234
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 235
    .local v0, "action":I
    sget-boolean v7, Lcom/gamevil/nexus2/ui/UIArea;->mIsMultiTouchSupported:Z

    if-eqz v7, :cond_1

    .line 237
    and-int/lit16 v7, v0, 0xff

    packed-switch v7, :pswitch_data_0

    .line 351
    :cond_0
    :goto_0
    :pswitch_0
    const/4 v7, 0x1

    return v7

    .line 240
    :pswitch_1
    and-int v7, v0, v10

    shr-int/lit8 v2, v7, 0x8

    .line 241
    .local v2, "pind":I
    invoke-virtual {p0, p1, v2}, Lcom/gamevil/nexus2/ui/UIArea;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v1

    .line 242
    .local v1, "pid":I
    invoke-virtual {p0, p1, v1}, Lcom/gamevil/nexus2/ui/UIArea;->getX(Landroid/view/MotionEvent;I)I

    move-result v5

    .line 243
    .local v5, "x":I
    invoke-virtual {p0, p1, v1}, Lcom/gamevil/nexus2/ui/UIArea;->getY(Landroid/view/MotionEvent;I)I

    move-result v6

    .line 245
    .local v6, "y":I
    invoke-virtual {p0, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->pointInArea(II)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 247
    iput v1, p0, Lcom/gamevil/nexus2/ui/UIArea;->mActivePointerId:I

    .line 249
    invoke-virtual {p0, v9, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->onAction(III)V

    goto :goto_0

    .line 254
    .end local v1    # "pid":I
    .end local v2    # "pind":I
    .end local v5    # "x":I
    .end local v6    # "y":I
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v5, v7

    .line 255
    .restart local v5    # "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v6, v7

    .line 256
    .restart local v6    # "y":I
    invoke-virtual {p0, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->pointInArea(II)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 258
    const/4 v7, 0x0

    invoke-virtual {p0, p1, v7}, Lcom/gamevil/nexus2/ui/UIArea;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v7

    iput v7, p0, Lcom/gamevil/nexus2/ui/UIArea;->mActivePointerId:I

    .line 260
    invoke-virtual {p0, v9, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->onAction(III)V

    goto :goto_0

    .line 267
    .end local v5    # "x":I
    .end local v6    # "y":I
    :pswitch_3
    iget v7, p0, Lcom/gamevil/nexus2/ui/UIArea;->mActivePointerId:I

    if-ltz v7, :cond_0

    .line 270
    and-int v7, v0, v10

    shr-int/lit8 v4, v7, 0x8

    .line 273
    .local v4, "pointerIndex":I
    invoke-virtual {p0, p1, v4}, Lcom/gamevil/nexus2/ui/UIArea;->getX(Landroid/view/MotionEvent;I)I

    move-result v5

    .line 274
    .restart local v5    # "x":I
    invoke-virtual {p0, p1, v4}, Lcom/gamevil/nexus2/ui/UIArea;->getY(Landroid/view/MotionEvent;I)I

    move-result v6

    .line 276
    .restart local v6    # "y":I
    invoke-virtual {p0, v12, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->onAction(III)V

    goto :goto_0

    .line 283
    .end local v4    # "pointerIndex":I
    .end local v5    # "x":I
    .end local v6    # "y":I
    :pswitch_4
    iput v11, p0, Lcom/gamevil/nexus2/ui/UIArea;->mActivePointerId:I

    goto :goto_0

    .line 287
    :pswitch_5
    iput v11, p0, Lcom/gamevil/nexus2/ui/UIArea;->mActivePointerId:I

    .line 288
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v5, v7

    .line 289
    .restart local v5    # "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v6, v7

    .line 290
    .restart local v6    # "y":I
    invoke-virtual {p0, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->pointInArea(II)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 293
    invoke-virtual {p0, v8, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->onAction(III)V

    goto :goto_0

    .line 299
    .end local v5    # "x":I
    .end local v6    # "y":I
    :pswitch_6
    and-int v7, v0, v10

    shr-int/lit8 v4, v7, 0x8

    .line 301
    .restart local v4    # "pointerIndex":I
    invoke-virtual {p0, p1, v4}, Lcom/gamevil/nexus2/ui/UIArea;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    .line 304
    .local v3, "pointerId":I
    invoke-virtual {p0, p1, v3}, Lcom/gamevil/nexus2/ui/UIArea;->getX(Landroid/view/MotionEvent;I)I

    move-result v5

    .line 305
    .restart local v5    # "x":I
    invoke-virtual {p0, p1, v3}, Lcom/gamevil/nexus2/ui/UIArea;->getY(Landroid/view/MotionEvent;I)I

    move-result v6

    .line 307
    .restart local v6    # "y":I
    invoke-virtual {p0, v8, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->onAction(III)V

    goto :goto_0

    .line 315
    .end local v3    # "pointerId":I
    .end local v4    # "pointerIndex":I
    .end local v5    # "x":I
    .end local v6    # "y":I
    :cond_1
    packed-switch v0, :pswitch_data_1

    goto :goto_0

    .line 318
    :pswitch_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v5, v7

    .line 319
    .restart local v5    # "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v6, v7

    .line 320
    .restart local v6    # "y":I
    invoke-virtual {p0, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->pointInArea(II)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 323
    invoke-virtual {p0, v9, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->onAction(III)V

    goto/16 :goto_0

    .line 329
    .end local v5    # "x":I
    .end local v6    # "y":I
    :pswitch_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v5, v7

    .line 330
    .restart local v5    # "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v6, v7

    .line 331
    .restart local v6    # "y":I
    invoke-virtual {p0, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->pointInArea(II)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 334
    invoke-virtual {p0, v12, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->onAction(III)V

    goto/16 :goto_0

    .line 343
    .end local v5    # "x":I
    .end local v6    # "y":I
    :pswitch_9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v5, v7

    .line 344
    .restart local v5    # "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v6, v7

    .line 346
    .restart local v6    # "y":I
    invoke-virtual {p0, v8, v5, v6}, Lcom/gamevil/nexus2/ui/UIArea;->onAction(III)V

    goto/16 :goto_0

    .line 237
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_5
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_1
        :pswitch_6
    .end packed-switch

    .line 315
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_9
        :pswitch_8
        :pswitch_0
    .end packed-switch
.end method

.method public pointInArea(II)Z
    .locals 3
    .param p1, "_x"    # I
    .param p2, "_y"    # I

    .prologue
    const/4 v2, 0x0

    .line 216
    iget-boolean v0, p0, Lcom/gamevil/nexus2/ui/UIArea;->mIsHidden:Z

    if-eqz v0, :cond_0

    move v0, v2

    .line 225
    :goto_0
    return v0

    .line 218
    :cond_0
    iget v0, p0, Lcom/gamevil/nexus2/ui/UIArea;->mX:I

    if-gt v0, p1, :cond_1

    iget v0, p0, Lcom/gamevil/nexus2/ui/UIArea;->mX:I

    iget v1, p0, Lcom/gamevil/nexus2/ui/UIArea;->mWidth:I

    add-int/2addr v0, v1

    if-lt v0, p1, :cond_1

    .line 220
    iget v0, p0, Lcom/gamevil/nexus2/ui/UIArea;->mY:I

    if-gt v0, p2, :cond_1

    iget v0, p0, Lcom/gamevil/nexus2/ui/UIArea;->mY:I

    iget v1, p0, Lcom/gamevil/nexus2/ui/UIArea;->mHeight:I

    add-int/2addr v0, v1

    if-lt v0, p2, :cond_1

    .line 222
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 225
    goto :goto_0
.end method

.method public abstract releaseAll()V
.end method

.method public abstract setGLTexturPlane(Ljavax/microedition/khronos/opengles/GL10;)V
.end method

.method public setIsHidden(Z)V
    .locals 1
    .param p1, "_isHide"    # Z

    .prologue
    .line 192
    const/4 v0, -0x1

    iput v0, p0, Lcom/gamevil/nexus2/ui/UIArea;->mActivePointerId:I

    .line 193
    iput-boolean p1, p0, Lcom/gamevil/nexus2/ui/UIArea;->mIsHidden:Z

    .line 194
    return-void
.end method

.method public setIsUsingTouchMove(Z)V
    .locals 0
    .param p1, "_enable"    # Z

    .prologue
    .line 203
    iput-boolean p1, p0, Lcom/gamevil/nexus2/ui/UIArea;->mUseTouchMove:Z

    .line 204
    return-void
.end method

.method public setPosition(IIII)V
    .locals 0
    .param p1, "_x"    # I
    .param p2, "_y"    # I
    .param p3, "_width"    # I
    .param p4, "_height"    # I

    .prologue
    .line 208
    iput p1, p0, Lcom/gamevil/nexus2/ui/UIArea;->mX:I

    .line 209
    iput p2, p0, Lcom/gamevil/nexus2/ui/UIArea;->mY:I

    .line 210
    iput p3, p0, Lcom/gamevil/nexus2/ui/UIArea;->mWidth:I

    .line 211
    iput p4, p0, Lcom/gamevil/nexus2/ui/UIArea;->mHeight:I

    .line 212
    return-void
.end method

.method public setTag(I)V
    .locals 0
    .param p1, "_tag"    # I

    .prologue
    .line 187
    iput p1, p0, Lcom/gamevil/nexus2/ui/UIArea;->mTag:I

    .line 188
    return-void
.end method
