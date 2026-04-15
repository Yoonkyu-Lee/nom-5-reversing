.class public Lcom/gamevil/nexus2/ui/UITexturePlane;
.super Ljava/lang/Object;
.source "UITexturePlane.java"


# instance fields
.field private final TEXTURE_SIZE:I

.field private height:I

.field private imgH:I

.field private imgW:I

.field private mCoordBuffer:Ljava/nio/FloatBuffer;

.field private mTextureID:I

.field private mVertexBuffer:Ljava/nio/FloatBuffer;

.field private offX:F

.field private offY:F

.field private posX:F

.field private posY:F

.field private texImage:[Landroid/graphics/Bitmap;

.field private width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/16 v0, 0x80

    iput v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->TEXTURE_SIZE:I

    .line 28
    return-void
.end method


# virtual methods
.method public draw(Ljavax/microedition/khronos/opengles/GL10;I)V
    .locals 7
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "_imgIdx"    # I

    .prologue
    const v6, 0x8078

    const/16 v5, 0x1406

    const/16 v4, 0xbe2

    const/16 v3, 0xde1

    const/4 v2, 0x0

    .line 204
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->texImage:[Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 206
    invoke-interface {p1, v4}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 207
    invoke-interface {p1, v3}, Ljavax/microedition/khronos/opengles/GL10;->glEnable(I)V

    .line 208
    invoke-interface {p1, v6}, Ljavax/microedition/khronos/opengles/GL10;->glEnableClientState(I)V

    .line 210
    iget v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mTextureID:I

    invoke-interface {p1, v3, v0}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 212
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mCoordBuffer:Ljava/nio/FloatBuffer;

    if-eqz v0, :cond_0

    .line 213
    const/4 v0, 0x2

    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mCoordBuffer:Ljava/nio/FloatBuffer;

    invoke-interface {p1, v0, v5, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    .line 215
    :cond_0
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    if-eqz v0, :cond_1

    .line 216
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    invoke-interface {p1, v0, v5, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glVertexPointer(IIILjava/nio/Buffer;)V

    .line 218
    :cond_1
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->texImage:[Landroid/graphics/Bitmap;

    aget-object v0, v0, p2

    invoke-static {v3, v2, v2, v2, v0}, Landroid/opengl/GLUtils;->texSubImage2D(IIIILandroid/graphics/Bitmap;)V

    .line 220
    const/4 v0, 0x5

    const/4 v1, 0x6

    invoke-interface {p1, v0, v2, v1}, Ljavax/microedition/khronos/opengles/GL10;->glDrawArrays(III)V

    .line 222
    invoke-interface {p1, v6}, Ljavax/microedition/khronos/opengles/GL10;->glDisableClientState(I)V

    .line 223
    invoke-interface {p1, v3}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 224
    invoke-interface {p1, v4}, Ljavax/microedition/khronos/opengles/GL10;->glDisable(I)V

    .line 226
    :cond_2
    return-void
.end method

.method getFloatBufferFromFloatArray([F)Ljava/nio/FloatBuffer;
    .locals 3
    .param p1, "array"    # [F

    .prologue
    .line 229
    array-length v2, p1

    mul-int/lit8 v2, v2, 0x4

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 230
    .local v1, "tempBuffer":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 231
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object v0

    .line 232
    .local v0, "buffer":Ljava/nio/FloatBuffer;
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 233
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 234
    return-object v0
.end method

.method public initializeTexturPlane(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 9
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    const/16 v8, 0x80

    const/4 v7, 0x1

    const/16 v6, 0xde1

    const/4 v5, 0x0

    .line 180
    new-array v3, v7, [I

    .line 181
    .local v3, "textures":[I
    invoke-interface {p1, v7, v3, v5}, Ljavax/microedition/khronos/opengles/GL10;->glGenTextures(I[II)V

    .line 182
    aget v4, v3, v5

    iput v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mTextureID:I

    .line 184
    iget v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mTextureID:I

    invoke-interface {p1, v6, v4}, Ljavax/microedition/khronos/opengles/GL10;->glBindTexture(II)V

    .line 186
    const/16 v4, 0x4000

    new-array v1, v4, [I

    .line 187
    .local v1, "color":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v1

    if-lt v2, v4, :cond_0

    .line 191
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v8, v8, v4}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 192
    .local v0, "bitmap256":Landroid/graphics/Bitmap;
    invoke-static {v6, v5, v0, v5}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    .line 193
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 196
    const/16 v4, 0x303

    invoke-interface {p1, v7, v4}, Ljavax/microedition/khronos/opengles/GL10;->glBlendFunc(II)V

    .line 198
    const/16 v4, 0x2801

    const/high16 v5, 0x46180000    # 9728.0f

    invoke-interface {p1, v6, v4, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 199
    const/16 v4, 0x2800

    const v5, 0x46180400    # 9729.0f

    invoke-interface {p1, v6, v4, v5}, Ljavax/microedition/khronos/opengles/GL10;->glTexParameterf(IIF)V

    .line 201
    return-void

    .line 188
    .end local v0    # "bitmap256":Landroid/graphics/Bitmap;
    :cond_0
    const v4, 0xffffff

    aput v4, v1, v2

    .line 187
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public releaseAll()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 57
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->texImage:[Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    .line 59
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->texImage:[Landroid/graphics/Bitmap;

    array-length v1, v1

    if-lt v0, v1, :cond_1

    .line 62
    iput-object v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->texImage:[Landroid/graphics/Bitmap;

    .line 65
    .end local v0    # "i":I
    :cond_0
    iput-object v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 66
    return-void

    .line 60
    .restart local v0    # "i":I
    :cond_1
    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->texImage:[Landroid/graphics/Bitmap;

    aput-object v2, v1, v0

    .line 59
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setPlanePosition(II)V
    .locals 6
    .param p1, "_x"    # I
    .param p2, "_y"    # I

    .prologue
    .line 145
    iget v3, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->imgW:I

    iget v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->imgH:I

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/gamevil/nexus2/ui/UITexturePlane;->setPlanePosition(IIIII)V

    .line 146
    return-void
.end method

.method public setPlanePosition(IIII)V
    .locals 6
    .param p1, "_x"    # I
    .param p2, "_y"    # I
    .param p3, "_width"    # I
    .param p4, "_height"    # I

    .prologue
    .line 139
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/gamevil/nexus2/ui/UITexturePlane;->setPlanePosition(IIIII)V

    .line 140
    return-void
.end method

.method public setPlanePosition(IIIII)V
    .locals 7
    .param p1, "_x"    # I
    .param p2, "_y"    # I
    .param p3, "_width"    # I
    .param p4, "_height"    # I
    .param p5, "_dist"    # I

    .prologue
    .line 88
    iget v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->offX:F

    int-to-float v5, p1

    add-float/2addr v4, v5

    iput v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    .line 89
    iget v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->offY:F

    int-to-float v5, p2

    sub-float/2addr v4, v5

    iput v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    .line 90
    iput p3, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->width:I

    .line 91
    iput p4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->height:I

    .line 93
    const/16 v4, 0x12

    new-array v3, v4, [F

    const/4 v4, 0x0

    .line 94
    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    aput v5, v3, v4

    const/4 v4, 0x1

    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    aput v5, v3, v4

    const/4 v4, 0x2

    int-to-float v5, p5

    aput v5, v3, v4

    const/4 v4, 0x3

    .line 95
    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    aput v5, v3, v4

    const/4 v4, 0x4

    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    iget v6, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->height:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    aput v5, v3, v4

    const/4 v4, 0x5

    int-to-float v5, p5

    aput v5, v3, v4

    const/4 v4, 0x6

    .line 96
    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    iget v6, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->width:I

    int-to-float v6, v6

    add-float/2addr v5, v6

    aput v5, v3, v4

    const/4 v4, 0x7

    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    iget v6, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->height:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    aput v5, v3, v4

    const/16 v4, 0x8

    int-to-float v5, p5

    aput v5, v3, v4

    const/16 v4, 0x9

    .line 97
    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    aput v5, v3, v4

    const/16 v4, 0xa

    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    aput v5, v3, v4

    const/16 v4, 0xb

    int-to-float v5, p5

    aput v5, v3, v4

    const/16 v4, 0xc

    .line 98
    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    iget v6, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->width:I

    int-to-float v6, v6

    add-float/2addr v5, v6

    aput v5, v3, v4

    const/16 v4, 0xd

    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    aput v5, v3, v4

    const/16 v4, 0xe

    int-to-float v5, p5

    aput v5, v3, v4

    const/16 v4, 0xf

    .line 99
    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    iget v6, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->width:I

    int-to-float v6, v6

    add-float/2addr v5, v6

    aput v5, v3, v4

    const/16 v4, 0x10

    iget v5, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    iget v6, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->height:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    aput v5, v3, v4

    const/16 v4, 0x11

    int-to-float v5, p5

    aput v5, v3, v4

    .line 102
    .local v3, "vertices":[F
    iget v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->width:I

    int-to-float v4, v4

    const/high16 v5, 0x43000000    # 128.0f

    div-float v1, v4, v5

    .line 103
    .local v1, "ratioW":F
    iget v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->height:I

    int-to-float v4, v4

    const/high16 v5, 0x43000000    # 128.0f

    div-float v0, v4, v5

    .line 104
    .local v0, "ratioH":F
    const/16 v4, 0xc

    new-array v2, v4, [F

    const/4 v4, 0x0

    .line 105
    const/4 v5, 0x0

    aput v5, v2, v4

    const/4 v4, 0x1

    const/4 v5, 0x0

    aput v5, v2, v4

    const/4 v4, 0x2

    .line 106
    const/4 v5, 0x0

    aput v5, v2, v4

    const/4 v4, 0x3

    aput v0, v2, v4

    const/4 v4, 0x4

    .line 107
    aput v1, v2, v4

    const/4 v4, 0x5

    aput v0, v2, v4

    const/4 v4, 0x6

    .line 108
    const/4 v5, 0x0

    aput v5, v2, v4

    const/4 v4, 0x7

    const/4 v5, 0x0

    aput v5, v2, v4

    const/16 v4, 0x8

    .line 109
    aput v1, v2, v4

    const/16 v4, 0x9

    const/4 v5, 0x0

    aput v5, v2, v4

    const/16 v4, 0xa

    .line 110
    aput v1, v2, v4

    const/16 v4, 0xb

    aput v0, v2, v4

    .line 113
    .local v2, "texCoords":[F
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 114
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mCoordBuffer:Ljava/nio/FloatBuffer;

    .line 115
    invoke-virtual {p0, v3}, Lcom/gamevil/nexus2/ui/UITexturePlane;->getFloatBufferFromFloatArray([F)Ljava/nio/FloatBuffer;

    move-result-object v4

    iput-object v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    .line 116
    invoke-virtual {p0, v2}, Lcom/gamevil/nexus2/ui/UITexturePlane;->getFloatBufferFromFloatArray([F)Ljava/nio/FloatBuffer;

    move-result-object v4

    iput-object v4, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mCoordBuffer:Ljava/nio/FloatBuffer;

    .line 117
    return-void
.end method

.method public setPosition(II)V
    .locals 5
    .param p1, "_x"    # I
    .param p2, "_y"    # I

    .prologue
    const/4 v4, 0x0

    .line 150
    iget v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->offX:F

    int-to-float v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    .line 151
    iget v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->offY:F

    int-to-float v1, p2

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    .line 153
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x0

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 154
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x1

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 155
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, v4}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 156
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x3

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 157
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x4

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    iget v3, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->height:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 158
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, v4}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 159
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x6

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    iget v3, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->width:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 160
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/4 v1, 0x7

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    iget v3, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->height:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 161
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0x8

    invoke-virtual {v0, v1, v4}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 162
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0x9

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 163
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0xa

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 164
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0xb

    invoke-virtual {v0, v1, v4}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 165
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0xc

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    iget v3, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->width:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 166
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0xd

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 167
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0xe

    invoke-virtual {v0, v1, v4}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 168
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0xf

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posX:F

    iget v3, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->width:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 169
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0x10

    iget v2, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->posY:F

    iget v3, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->height:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 170
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->mVertexBuffer:Ljava/nio/FloatBuffer;

    const/16 v1, 0x11

    invoke-virtual {v0, v1, v4}, Ljava/nio/FloatBuffer;->put(IF)Ljava/nio/FloatBuffer;

    .line 171
    return-void
.end method

.method public setScreenSize(FF)V
    .locals 2
    .param p1, "_width"    # F
    .param p2, "_height"    # F

    .prologue
    const/high16 v1, 0x40000000    # 2.0f

    .line 82
    neg-float v0, p1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->offX:F

    .line 83
    div-float v0, p2, v1

    iput v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->offY:F

    .line 84
    return-void
.end method

.method public setTextureImages([Landroid/graphics/Bitmap;)V
    .locals 2
    .param p1, "_texImg"    # [Landroid/graphics/Bitmap;

    .prologue
    const/4 v1, 0x0

    .line 70
    iput-object p1, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->texImage:[Landroid/graphics/Bitmap;

    .line 71
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->texImage:[Landroid/graphics/Bitmap;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->imgW:I

    .line 72
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->texImage:[Landroid/graphics/Bitmap;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/gamevil/nexus2/ui/UITexturePlane;->imgH:I

    .line 73
    return-void
.end method
