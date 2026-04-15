.class public Lcom/gamevil/nexus2/ui/UIEditText;
.super Landroid/widget/EditText;
.source "UIEditText.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 36
    const-string v0, "Enter Name"

    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/ui/UIEditText;->setHint(Ljava/lang/CharSequence;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    const-string v0, "Enter Name"

    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/ui/UIEditText;->setHint(Ljava/lang/CharSequence;)V

    .line 43
    return-void
.end method


# virtual methods
.method public clearText()V
    .locals 1

    .prologue
    .line 47
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/ui/UIEditText;->setText(Ljava/lang/CharSequence;)V

    .line 48
    const-string v0, "Enter Name"

    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/ui/UIEditText;->setHint(Ljava/lang/CharSequence;)V

    .line 49
    return-void
.end method

.method public onCommitCompletion(Landroid/view/inputmethod/CompletionInfo;)V
    .locals 0
    .param p1, "text"    # Landroid/view/inputmethod/CompletionInfo;

    .prologue
    .line 73
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 79
    return-void
.end method

.method public onEditorAction(I)V
    .locals 2
    .param p1, "actionCode"    # I

    .prologue
    .line 85
    const/4 v0, 0x6

    if-ne p1, v0, :cond_0

    .line 89
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/UIEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->textInputed:Ljava/lang/String;

    .line 91
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/EditText;->onEditorAction(I)V

    .line 92
    return-void
.end method

.method public onEndBatchEdit()V
    .locals 3

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/UIEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v0

    .line 63
    .local v0, "length":I
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/UIEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->textInputed:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x0

    .line 102
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/UIEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->textInputed:Ljava/lang/String;

    .line 103
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v0, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->textInputed:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_1

    const/16 v0, 0x43

    if-ne p1, v0, :cond_1

    .line 105
    sget-object v0, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    const/16 v1, -0x10

    invoke-virtual {v0, v3, v1, v2, v2}, Lcom/gamevil/nexus2/NexusGLRenderer;->setTouchEvent(IIII)V

    .line 111
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0

    .line 107
    :cond_1
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    iget-object v0, v0, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->textInputed:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/16 v0, 0x17

    if-ne p1, v0, :cond_0

    .line 109
    sget-object v0, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    const/4 v1, -0x5

    invoke-virtual {v0, v3, v1, v2, v2}, Lcom/gamevil/nexus2/NexusGLRenderer;->setTouchEvent(IIII)V

    goto :goto_0
.end method

.method public showInput()V
    .locals 3

    .prologue
    .line 116
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 117
    .local v0, "mgr":Landroid/view/inputmethod/InputMethodManager;
    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 118
    return-void
.end method
