.class public Lcom/gamevil/nexus2/ui/UITextView;
.super Landroid/view/View;
.source "UITextView.java"


# instance fields
.field k:Ljava/lang/String;

.field slash:Ljava/lang/String;

.field strBuffer:Ljava/lang/StringBuffer;

.field strFps:Ljava/lang/String;

.field strMem:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    const-string v0, "fps: "

    iput-object v0, p0, Lcom/gamevil/nexus2/ui/UITextView;->strFps:Ljava/lang/String;

    .line 29
    const-string v0, " | heap: "

    iput-object v0, p0, Lcom/gamevil/nexus2/ui/UITextView;->strMem:Ljava/lang/String;

    .line 30
    const-string v0, " / "

    iput-object v0, p0, Lcom/gamevil/nexus2/ui/UITextView;->slash:Ljava/lang/String;

    .line 31
    const-string v0, "Kb"

    iput-object v0, p0, Lcom/gamevil/nexus2/ui/UITextView;->k:Ljava/lang/String;

    .line 35
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nexus2/ui/UITextView;->strBuffer:Ljava/lang/StringBuffer;

    .line 36
    const/high16 v0, 0x55000000

    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/ui/UITextView;->setBackgroundColor(I)V

    .line 37
    return-void
.end method


# virtual methods
.method public onDraw()V
    .locals 0

    .prologue
    .line 48
    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/UITextView;->postInvalidate()V

    .line 49
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/16 v1, 0xc

    .line 41
    invoke-static {p1}, Lcom/gamevil/nexus2/ui/UIGraphics;->setCanvas(Landroid/graphics/Canvas;)V

    .line 42
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITextView;->strBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const v4, -0xff0001

    const/4 v5, 0x4

    move v2, v1

    move v3, v1

    invoke-static/range {v0 .. v5}, Lcom/gamevil/nexus2/ui/UIGraphics;->drawString(Ljava/lang/String;IIIII)V

    .line 44
    return-void
.end method

.method public setFPS(I)V
    .locals 3
    .param p1, "_fps"    # I

    .prologue
    .line 53
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITextView;->strBuffer:Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/gamevil/nexus2/ui/UITextView;->strBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 54
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITextView;->strBuffer:Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITextView;->strFps:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 55
    return-void
.end method

.method public setMemeoryStatus(II)V
    .locals 2
    .param p1, "_current"    # I
    .param p2, "_total"    # I

    .prologue
    .line 59
    iget-object v0, p0, Lcom/gamevil/nexus2/ui/UITextView;->strBuffer:Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITextView;->strMem:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITextView;->k:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITextView;->slash:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lcom/gamevil/nexus2/ui/UITextView;->k:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 60
    return-void
.end method
