.class public Lcom/gamevil/nexus2/ui/UIGraphics;
.super Ljava/lang/Object;
.source "UIGraphics.java"


# static fields
.field public static final BOTTOM:I = 0x20

.field public static final DASHED:I = 0x2

.field public static final DOTTED:I = 0x1

.field public static final HCENTER:I = 0x1

.field public static final LEFT:I = 0x4

.field public static final RIGHT:I = 0x8

.field public static final SOLID:I = 0x0

.field public static final TOP:I = 0x10

.field public static final VCENTER:I = 0x2

.field private static canvas:Landroid/graphics/Canvas;

.field private static graphics:Lcom/gamevil/nexus2/ui/UIGraphics;

.field public static lcdCx:I

.field public static lcdCy:I

.field public static lcdHeight:I

.field public static lcdWidth:I

.field private static paint:Landroid/graphics/Paint;

.field private static path_effect:Landroid/graphics/PathEffect;

.field private static rect:Landroid/graphics/Rect;

.field private static rectF:Landroid/graphics/RectF;

.field private static strokeStyle:I

.field private static textPaint:Landroid/graphics/Paint;

.field private static typeface:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 362
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    .line 363
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    sput-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->typeface:Landroid/graphics/Typeface;

    .line 38
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    sput-object p0, Lcom/gamevil/nexus2/ui/UIGraphics;->graphics:Lcom/gamevil/nexus2/ui/UIGraphics;

    .line 67
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    .line 68
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->rect:Landroid/graphics/Rect;

    .line 69
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    sput-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    .line 70
    return-void
.end method

.method public static clipRect(IIII)V
    .locals 6
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 177
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v1, p0

    int-to-float v2, p1

    add-int v3, p0, p2

    int-to-float v3, v3

    add-int v4, p1, p3

    int-to-float v4, v4

    sget-object v5, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->clipRect(FFFFLandroid/graphics/Region$Op;)Z

    .line 178
    return-void
.end method

.method public static createImage(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p0, "_path"    # Ljava/lang/String;

    .prologue
    .line 401
    const/4 v1, 0x0

    .line 402
    .local v1, "is":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 404
    .local v0, "img":Landroid/graphics/Bitmap;
    :try_start_0
    invoke-static {p0}, Lcom/gamevil/nexus2/ui/UIGraphics;->deletSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 405
    .local v2, "path":Ljava/lang/String;
    sget-object v3, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v3}, Lcom/gamevil/nexus2/NexusGLActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-static {v2}, Lcom/gamevil/nexus2/ui/UIGraphics;->deletSlash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 406
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 407
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 414
    .end local v2    # "path":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 409
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method public static deletSlash(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "strName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 419
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 420
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 422
    :cond_0
    return-object p0
.end method

.method public static drawArc(IIIIIII)V
    .locals 6
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "startAngle"    # I
    .param p5, "arcAngle"    # I
    .param p6, "color"    # I

    .prologue
    .line 220
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 221
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 222
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v1, p0

    int-to-float v2, p1

    add-int v3, p0, p2

    int-to-float v3, v3

    add-int v4, p1, p3

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 223
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v2, p4

    int-to-float v3, p5

    const/4 v4, 0x1

    sget-object v5, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 224
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 225
    return-void
.end method

.method public static drawChar([CIIIIIII)V
    .locals 7
    .param p0, "text"    # [C
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "index"    # I
    .param p4, "count"    # I
    .param p5, "size"    # I
    .param p6, "color"    # I
    .param p7, "anchor"    # I

    .prologue
    .line 386
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 387
    and-int/lit8 v0, p7, 0x1

    if-eqz v0, :cond_2

    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 390
    :cond_0
    :goto_0
    and-int/lit8 v0, p7, 0x2

    if-eqz v0, :cond_1

    .line 392
    div-int/lit8 v0, p5, 0x2

    add-int/2addr p2, v0

    .line 394
    :cond_1
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 395
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    int-to-float v1, p5

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 396
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v4, p1

    int-to-float v5, p2

    sget-object v6, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    move-object v1, p0

    move v2, p3

    move v3, p4

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText([CIIFFLandroid/graphics/Paint;)V

    .line 397
    return-void

    .line 388
    :cond_2
    and-int/lit8 v0, p7, 0x4

    if-eqz v0, :cond_3

    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0

    .line 389
    :cond_3
    and-int/lit8 v0, p7, 0x8

    if-eqz v0, :cond_0

    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0
.end method

.method public static drawEnlargedImage(Landroid/graphics/Bitmap;IIFFI)V
    .locals 6
    .param p0, "img"    # Landroid/graphics/Bitmap;
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "ratioX"    # F
    .param p4, "ratioY"    # F
    .param p5, "anchor"    # I

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 333
    if-nez p5, :cond_0

    .line 334
    const/16 p5, 0x14

    .line 337
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 338
    .local v1, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 340
    .local v0, "height":I
    and-int/lit8 v2, p5, 0x1

    if-eqz v2, :cond_3

    .line 341
    int-to-float v2, p1

    int-to-float v3, v1

    mul-float/2addr v3, p3

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    float-to-int p1, v2

    .line 348
    :cond_1
    :goto_0
    and-int/lit8 v2, p5, 0x2

    if-eqz v2, :cond_4

    .line 349
    int-to-float v2, p2

    int-to-float v3, v0

    mul-float/2addr v3, p4

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    float-to-int p2, v2

    .line 355
    :cond_2
    :goto_1
    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    .line 356
    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-virtual {v2, p3, p4, v3, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 357
    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v3, p1

    int-to-float v4, p2

    const/4 v5, 0x0

    invoke-virtual {v2, p0, v3, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 358
    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v2}, Landroid/graphics/Canvas;->restore()V

    .line 359
    return-void

    .line 343
    :cond_3
    and-int/lit8 v2, p5, 0x8

    if-eqz v2, :cond_1

    .line 344
    sub-int/2addr p1, v1

    goto :goto_0

    .line 351
    :cond_4
    and-int/lit8 v2, p5, 0x20

    if-eqz v2, :cond_2

    .line 352
    sub-int/2addr p2, v0

    goto :goto_1
.end method

.method public static drawFilteredImage(Landroid/graphics/Bitmap;IIILandroid/graphics/ColorFilter;Landroid/graphics/MaskFilter;I)V
    .locals 2
    .param p0, "img"    # Landroid/graphics/Bitmap;
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "anchor"    # I
    .param p4, "filter"    # Landroid/graphics/ColorFilter;
    .param p5, "mask"    # Landroid/graphics/MaskFilter;
    .param p6, "_alpha"    # I

    .prologue
    .line 123
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 124
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p5}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 125
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 126
    invoke-static {p0, p1, p2, p3, p6}, Lcom/gamevil/nexus2/ui/UIGraphics;->drawImage(Landroid/graphics/Bitmap;IIII)V

    .line 127
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 128
    return-void
.end method

.method public static drawImage(Landroid/graphics/Bitmap;III)V
    .locals 6
    .param p0, "img"    # Landroid/graphics/Bitmap;
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "anchor"    # I

    .prologue
    .line 91
    if-nez p3, :cond_0

    .line 92
    const/16 p3, 0x14

    .line 99
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 100
    .local v1, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 102
    .local v0, "height":I
    and-int/lit8 v2, p3, 0x1

    if-eqz v2, :cond_3

    .line 103
    div-int/lit8 v2, v1, 0x2

    sub-int/2addr p1, v2

    .line 110
    :cond_1
    :goto_0
    and-int/lit8 v2, p3, 0x2

    if-eqz v2, :cond_4

    .line 111
    div-int/lit8 v2, v0, 0x2

    sub-int/2addr p2, v2

    .line 118
    :cond_2
    :goto_1
    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v3, p1

    int-to-float v4, p2

    sget-object v5, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v2, p0, v3, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 119
    return-void

    .line 105
    :cond_3
    and-int/lit8 v2, p3, 0x8

    if-eqz v2, :cond_1

    .line 106
    sub-int/2addr p1, v1

    goto :goto_0

    .line 113
    :cond_4
    and-int/lit8 v2, p3, 0x20

    if-eqz v2, :cond_2

    .line 114
    sub-int/2addr p2, v0

    goto :goto_1
.end method

.method public static drawImage(Landroid/graphics/Bitmap;IIII)V
    .locals 6
    .param p0, "img"    # Landroid/graphics/Bitmap;
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "anchor"    # I
    .param p4, "_alpha"    # I

    .prologue
    .line 131
    if-nez p3, :cond_0

    .line 132
    const/16 p3, 0x14

    .line 135
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    .line 136
    .local v1, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 138
    .local v0, "height":I
    and-int/lit8 v2, p3, 0x1

    if-eqz v2, :cond_3

    .line 139
    div-int/lit8 v2, v1, 0x2

    sub-int/2addr p1, v2

    .line 145
    :cond_1
    :goto_0
    and-int/lit8 v2, p3, 0x2

    if-eqz v2, :cond_4

    .line 146
    div-int/lit8 v2, v0, 0x2

    sub-int/2addr p2, v2

    .line 151
    :cond_2
    :goto_1
    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v2, p4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 152
    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v3, p1

    int-to-float v4, p2

    sget-object v5, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v2, p0, v3, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 153
    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->reset()V

    .line 154
    return-void

    .line 141
    :cond_3
    and-int/lit8 v2, p3, 0x8

    if-eqz v2, :cond_1

    .line 142
    sub-int/2addr p1, v1

    goto :goto_0

    .line 148
    :cond_4
    and-int/lit8 v2, p3, 0x20

    if-eqz v2, :cond_2

    .line 149
    sub-int/2addr p2, v0

    goto :goto_1
.end method

.method public static drawImageRotate(Landroid/graphics/Bitmap;III)V
    .locals 4
    .param p0, "img"    # Landroid/graphics/Bitmap;
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "degrees"    # I

    .prologue
    .line 325
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    .line 326
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v1, p3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v2, p1

    int-to-float v2, v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, p2

    int-to-float v3, v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 327
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v1, p1

    int-to-float v2, p2

    sget-object v3, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 328
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 329
    return-void
.end method

.method public static drawLine(IIIII)V
    .locals 6
    .param p0, "x1"    # I
    .param p1, "y1"    # I
    .param p2, "x2"    # I
    .param p3, "y2"    # I
    .param p4, "color"    # I

    .prologue
    .line 202
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->path_effect:Landroid/graphics/PathEffect;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 203
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 204
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 205
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v1, p0

    int-to-float v2, p1

    int-to-float v3, p2

    int-to-float v4, p3

    sget-object v5, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 206
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 207
    return-void
.end method

.method public static drawRect(IIIII)V
    .locals 3
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "color"    # I

    .prologue
    .line 186
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 187
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 188
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->rect:Landroid/graphics/Rect;

    add-int v1, p0, p2

    add-int v2, p1, p3

    invoke-virtual {v0, p0, p1, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 189
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->rect:Landroid/graphics/Rect;

    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 190
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 191
    return-void
.end method

.method public static drawRoundRect(IIIIIII)V
    .locals 5
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "rx"    # I
    .param p5, "ry"    # I
    .param p6, "color"    # I

    .prologue
    .line 229
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 230
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 231
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v1, p0

    int-to-float v2, p1

    add-int v3, p0, p2

    int-to-float v3, v3

    add-int v4, p1, p3

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 232
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v2, p4

    int-to-float v3, p5

    sget-object v4, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 233
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 234
    return-void
.end method

.method public static drawString(Ljava/lang/String;IIIII)V
    .locals 4
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "size"    # I
    .param p4, "color"    # I
    .param p5, "anchor"    # I

    .prologue
    .line 371
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 372
    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_2

    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 375
    :cond_0
    :goto_0
    and-int/lit8 v0, p5, 0x2

    if-eqz v0, :cond_1

    .line 377
    div-int/lit8 v0, p3, 0x2

    add-int/2addr p2, v0

    .line 379
    :cond_1
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 380
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    int-to-float v1, p3

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 381
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v1, p1

    int-to-float v2, p2

    sget-object v3, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 382
    return-void

    .line 373
    :cond_2
    and-int/lit8 v0, p5, 0x4

    if-eqz v0, :cond_3

    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0

    .line 374
    :cond_3
    and-int/lit8 v0, p5, 0x8

    if-eqz v0, :cond_0

    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->textPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0
.end method

.method public static fillArc(IIIIIII)V
    .locals 6
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "startAngle"    # I
    .param p5, "arcAngle"    # I
    .param p6, "color"    # I

    .prologue
    .line 211
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 212
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 213
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v1, p0

    int-to-float v2, p1

    add-int v3, p0, p2

    int-to-float v3, v3

    add-int v4, p1, p3

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 214
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v2, p4

    int-to-float v3, p5

    const/4 v4, 0x1

    sget-object v5, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 215
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 216
    return-void
.end method

.method public static fillRect(IIIII)V
    .locals 3
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "color"    # I

    .prologue
    .line 194
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 195
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setColor(I)V

    .line 196
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->rect:Landroid/graphics/Rect;

    add-int v1, p0, p2

    add-int v2, p1, p3

    invoke-virtual {v0, p0, p1, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 197
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->rect:Landroid/graphics/Rect;

    sget-object v2, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 198
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 199
    return-void
.end method

.method public static fillRoundRect(IIIIIII)V
    .locals 5
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "rx"    # I
    .param p5, "ry"    # I
    .param p6, "color"    # I

    .prologue
    .line 238
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 239
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 240
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v1, p0

    int-to-float v2, p1

    add-int v3, p0, p2

    int-to-float v3, v3

    add-int v4, p1, p3

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 241
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v2, p4

    int-to-float v3, p5

    sget-object v4, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 242
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    .line 243
    return-void
.end method

.method public static fillRoundRect(IIIIIIILandroid/graphics/Paint;)V
    .locals 5
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "rx"    # I
    .param p5, "ry"    # I
    .param p6, "color"    # I
    .param p7, "p"    # Landroid/graphics/Paint;

    .prologue
    .line 247
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p7, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 248
    invoke-virtual {p7, p6}, Landroid/graphics/Paint;->setColor(I)V

    .line 249
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v1, p0

    int-to-float v2, p1

    add-int v3, p0, p2

    int-to-float v3, v3

    add-int v4, p1, p3

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 250
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->rectF:Landroid/graphics/RectF;

    int-to-float v2, p4

    int-to-float v3, p5

    invoke-virtual {v0, v1, v2, v3, p7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 251
    return-void
.end method

.method public static getClipHeight()I
    .locals 3

    .prologue
    .line 172
    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 173
    .local v0, "rect":Landroid/graphics/Rect;
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    return v1
.end method

.method public static getClipWidth()I
    .locals 3

    .prologue
    .line 167
    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 168
    .local v0, "rect":Landroid/graphics/Rect;
    iget v1, v0, Landroid/graphics/Rect;->right:I

    iget v2, v0, Landroid/graphics/Rect;->left:I

    sub-int/2addr v1, v2

    return v1
.end method

.method public static getClipX()I
    .locals 2

    .prologue
    .line 157
    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 158
    .local v0, "rect":Landroid/graphics/Rect;
    iget v1, v0, Landroid/graphics/Rect;->left:I

    return v1
.end method

.method public static getClipY()I
    .locals 2

    .prologue
    .line 162
    sget-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 163
    .local v0, "rect":Landroid/graphics/Rect;
    iget v1, v0, Landroid/graphics/Rect;->top:I

    return v1
.end method

.method public static getInstance()Lcom/gamevil/nexus2/ui/UIGraphics;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->graphics:Lcom/gamevil/nexus2/ui/UIGraphics;

    return-object v0
.end method

.method public static getStrokeStyle()I
    .locals 1

    .prologue
    .line 280
    sget v0, Lcom/gamevil/nexus2/ui/UIGraphics;->strokeStyle:I

    return v0
.end method

.method public static getStrokeWidth()I
    .locals 1

    .prologue
    .line 307
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public static initialize(II)V
    .locals 1
    .param p0, "_lcdWidth"    # I
    .param p1, "_lcdHeight"    # I

    .prologue
    .line 74
    sput p0, Lcom/gamevil/nexus2/ui/UIGraphics;->lcdWidth:I

    .line 75
    sput p1, Lcom/gamevil/nexus2/ui/UIGraphics;->lcdHeight:I

    .line 76
    sget v0, Lcom/gamevil/nexus2/ui/UIGraphics;->lcdWidth:I

    div-int/lit8 v0, v0, 0x2

    sput v0, Lcom/gamevil/nexus2/ui/UIGraphics;->lcdCx:I

    .line 77
    sget v0, Lcom/gamevil/nexus2/ui/UIGraphics;->lcdHeight:I

    div-int/lit8 v0, v0, 0x2

    sput v0, Lcom/gamevil/nexus2/ui/UIGraphics;->lcdCy:I

    .line 78
    return-void
.end method

.method public static restore()V
    .locals 1

    .prologue
    .line 319
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 320
    return-void
.end method

.method public static save()V
    .locals 1

    .prologue
    .line 315
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    .line 316
    return-void
.end method

.method public static setAlpha(I)V
    .locals 1
    .param p0, "alpha"    # I

    .prologue
    .line 311
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 312
    return-void
.end method

.method public static setCanvas(Landroid/graphics/Canvas;)V
    .locals 0
    .param p0, "_canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 87
    sput-object p0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    .line 88
    return-void
.end method

.method public static setClip(IIII)V
    .locals 6
    .param p0, "x"    # I
    .param p1, "y"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 181
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v1, p0

    int-to-float v2, p1

    add-int v3, p0, p2

    int-to-float v3, v3

    add-int v4, p1, p3

    int-to-float v4, v4

    sget-object v5, Landroid/graphics/Region$Op;->REPLACE:Landroid/graphics/Region$Op;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->clipRect(FFFFLandroid/graphics/Region$Op;)Z

    .line 182
    return-void
.end method

.method public static setStrokeStyle(I)V
    .locals 2
    .param p0, "style"    # I

    .prologue
    const/4 v1, 0x0

    .line 268
    if-nez p0, :cond_1

    .line 269
    invoke-static {}, Lcom/gamevil/nexus2/ui/UIGraphics;->setStrokeStyleSolid()V

    .line 277
    :cond_0
    :goto_0
    return-void

    .line 271
    :cond_1
    const/4 v0, 0x1

    if-ne p0, v0, :cond_2

    .line 272
    const/4 v0, 0x5

    invoke-static {v0, v1}, Lcom/gamevil/nexus2/ui/UIGraphics;->setStrokeStyleDotted(II)V

    goto :goto_0

    .line 274
    :cond_2
    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    .line 275
    const/4 v0, 0x4

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0, v1}, Lcom/gamevil/nexus2/ui/UIGraphics;->setStrokeStyleDashed([FI)V

    goto :goto_0

    :array_0
    .array-data 4
        0x41200000    # 10.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
    .end array-data
.end method

.method public static setStrokeStyleDashed([FI)V
    .locals 2
    .param p0, "intervals"    # [F
    .param p1, "phase"    # I

    .prologue
    .line 297
    const/4 v0, 0x2

    sput v0, Lcom/gamevil/nexus2/ui/UIGraphics;->strokeStyle:I

    .line 299
    new-instance v0, Landroid/graphics/DashPathEffect;

    int-to-float v1, p1

    invoke-direct {v0, p0, v1}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    sput-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->path_effect:Landroid/graphics/PathEffect;

    .line 300
    return-void
.end method

.method public static setStrokeStyleDotted(II)V
    .locals 4
    .param p0, "interval"    # I
    .param p1, "phase"    # I

    .prologue
    const/4 v3, 0x1

    .line 290
    sput v3, Lcom/gamevil/nexus2/ui/UIGraphics;->strokeStyle:I

    .line 292
    const/4 v1, 0x2

    new-array v0, v1, [F

    const/4 v1, 0x0

    int-to-float v2, p0

    aput v2, v0, v1

    int-to-float v1, p0

    aput v1, v0, v3

    .line 293
    .local v0, "intervals":[F
    new-instance v1, Landroid/graphics/DashPathEffect;

    int-to-float v2, p1

    invoke-direct {v1, v0, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    sput-object v1, Lcom/gamevil/nexus2/ui/UIGraphics;->path_effect:Landroid/graphics/PathEffect;

    .line 294
    return-void
.end method

.method public static setStrokeStyleSolid()V
    .locals 1

    .prologue
    .line 284
    const/4 v0, 0x0

    sput v0, Lcom/gamevil/nexus2/ui/UIGraphics;->strokeStyle:I

    .line 286
    const/4 v0, 0x0

    sput-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->path_effect:Landroid/graphics/PathEffect;

    .line 287
    return-void
.end method

.method public static setStrokeWidth(I)V
    .locals 2
    .param p0, "width"    # I

    .prologue
    .line 303
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->paint:Landroid/graphics/Paint;

    int-to-float v1, p0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 304
    return-void
.end method

.method public static setTypeface(Landroid/graphics/Typeface;)V
    .locals 0
    .param p0, "_typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 366
    sput-object p0, Lcom/gamevil/nexus2/ui/UIGraphics;->typeface:Landroid/graphics/Typeface;

    .line 367
    return-void
.end method

.method public static translate(II)V
    .locals 3
    .param p0, "x"    # I
    .param p1, "y"    # I

    .prologue
    .line 254
    sget-object v0, Lcom/gamevil/nexus2/ui/UIGraphics;->canvas:Landroid/graphics/Canvas;

    int-to-float v1, p0

    int-to-float v2, p1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 255
    return-void
.end method
