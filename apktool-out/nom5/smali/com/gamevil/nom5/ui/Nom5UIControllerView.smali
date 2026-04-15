.class public Lcom/gamevil/nom5/ui/Nom5UIControllerView;
.super Lcom/gamevil/nexus2/ui/NeoUIControllerView;
.source "Nom5UIControllerView.java"


# static fields
.field public static final UI_STATUS_ABOUT:I = 0x5

.field public static final UI_STATUS_CERTIFICATION:I = 0xc

.field public static final UI_STATUS_CERT_CP_VERIFY:I = 0x8

.field public static final UI_STATUS_EDIT:I = 0x3

.field public static final UI_STATUS_EDITPLAYER:I = 0x7

.field public static final UI_STATUS_EDIT_INPUT_INVISIBLE:I = 0x12

.field public static final UI_STATUS_EDIT_MY_INPUT_VISIBLE:I = 0x10

.field public static final UI_STATUS_EDIT_TEAM_INPUT_VISIBLE:I = 0x11

.field public static final UI_STATUS_EXIT:I = 0x68

.field public static final UI_STATUS_FULLTOUCH:I = 0xe

.field public static final UI_STATUS_GAME_DPAD:I = 0xd

.field public static final UI_STATUS_GAME_DPAD_MY:I = 0xf

.field public static final UI_STATUS_GAME_LOADING:I = 0x6

.field public static final UI_STATUS_HELP:I = 0x4

.field public static final UI_STATUS_LOGO:I = 0x0

.field public static final UI_STATUS_MAINMENU:I = 0x2

.field public static final UI_STATUS_NEWS:I = 0x13

.field public static final UI_STATUS_RANKING:I = 0xa

.field public static final UI_STATUS_SPECIAL:I = 0x9

.field public static final UI_STATUS_THANKYOU:I = 0x69

.field public static final UI_STATUS_TITLE:I = 0x1

.field public static final UI_STATUS_TROPHY:I = 0xb


# instance fields
.field private final aboutUrl:Ljava/lang/String;

.field fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

.field private final helpUrl:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field mHandler:Landroid/os/Handler;

.field mHandler2:Landroid/os/Handler;

.field private pl:Landroid/widget/FrameLayout$LayoutParams;

.field textInput:Lcom/gamevil/nexus2/ui/UIEditText;

.field togle:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;-><init>(Landroid/content/Context;)V

    .line 68
    const-string v0, "http://www.google.com"

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->helpUrl:Ljava/lang/String;

    .line 69
    const-string v0, "http://www.naver.com"

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->aboutUrl:Ljava/lang/String;

    .line 111
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->mHandler:Landroid/os/Handler;

    .line 112
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->mHandler2:Landroid/os/Handler;

    .line 81
    iput-object p1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->mContext:Landroid/content/Context;

    .line 82
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 85
    invoke-direct {p0, p1, p2}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 68
    const-string v0, "http://www.google.com"

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->helpUrl:Ljava/lang/String;

    .line 69
    const-string v0, "http://www.naver.com"

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->aboutUrl:Ljava/lang/String;

    .line 111
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->mHandler:Landroid/os/Handler;

    .line 112
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->mHandler2:Landroid/os/Handler;

    .line 86
    iput-object p1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->mContext:Landroid/content/Context;

    .line 87
    return-void
.end method

.method private setTextInputInvisible()V
    .locals 2

    .prologue
    .line 289
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nom5/ui/Nom5UIControllerView$3;

    invoke-direct {v1, p0}, Lcom/gamevil/nom5/ui/Nom5UIControllerView$3;-><init>(Lcom/gamevil/nom5/ui/Nom5UIControllerView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 296
    return-void
.end method

.method private setTextInputVisible()V
    .locals 2

    .prologue
    .line 276
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nom5/ui/Nom5UIControllerView$2;

    invoke-direct {v1, p0}, Lcom/gamevil/nom5/ui/Nom5UIControllerView$2;-><init>(Lcom/gamevil/nom5/ui/Nom5UIControllerView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 286
    return-void
.end method


# virtual methods
.method public OnEvent(I)V
    .locals 0
    .param p1, "event"    # I

    .prologue
    .line 211
    return-void
.end method

.method public OnSoundPlay(IIZ)V
    .locals 1
    .param p1, "sndID"    # I
    .param p2, "vol"    # I
    .param p3, "isLoop"    # Z

    .prologue
    .line 252
    if-nez p2, :cond_0

    if-eqz p3, :cond_0

    .line 253
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopBGMSound()V

    .line 263
    :goto_0
    return-void

    .line 256
    :cond_0
    div-int/lit8 v0, p2, 0xa

    invoke-static {v0}, Lcom/gamevil/nexus2/ui/NexusSound;->setVolume(I)V

    .line 261
    const v0, 0x7f060001

    add-int/2addr v0, p1

    invoke-static {v0, p3}, Lcom/gamevil/nexus2/ui/NexusSound;->playSound(IZ)V

    goto :goto_0
.end method

.method public OnStopSound()V
    .locals 0

    .prologue
    .line 267
    invoke-static {}, Lcom/gamevil/nexus2/ui/NexusSound;->stopAllSound()V

    .line 268
    return-void
.end method

.method public OnUIStatusChange(I)V
    .locals 2
    .param p1, "status"    # I

    .prologue
    .line 244
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ZenoniaUIController OnUIStatusChange"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 245
    invoke-virtual {p0, p1}, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->changeUIStatus(I)V

    .line 246
    return-void
.end method

.method public OnVibrate(I)V
    .locals 0
    .param p1, "time"    # I

    .prologue
    .line 272
    invoke-static {p1}, Lcom/gamevil/nexus2/ui/NexusSound;->Vibrator(I)V

    .line 273
    return-void
.end method

.method public hideAllUI()V
    .locals 4

    .prologue
    .line 150
    iget-object v3, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->subViews:Lcom/gamevil/nexus2/ui/NxArray;

    invoke-virtual {v3}, Lcom/gamevil/nexus2/ui/NxArray;->getElemetsSize()I

    move-result v2

    .line 151
    .local v2, "_subViewSize":I
    const/4 v1, 0x0

    .local v1, "_i":I
    :goto_0
    if-lt v1, v2, :cond_0

    .line 158
    invoke-direct {p0}, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->setTextInputInvisible()V

    .line 159
    return-void

    .line 152
    :cond_0
    iget-object v3, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->subViews:Lcom/gamevil/nexus2/ui/NxArray;

    invoke-virtual {v3, v1}, Lcom/gamevil/nexus2/ui/NxArray;->getElement(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gamevil/nexus2/ui/NeoUIArea;

    .line 153
    .local v0, "_area":Lcom/gamevil/nexus2/ui/NeoUIArea;
    iget-boolean v3, v0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mIsHidden:Z

    if-nez v3, :cond_1

    .line 154
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/gamevil/nexus2/ui/NeoUIArea;->setIsHidden(Z)V

    .line 155
    const/4 v3, 0x0

    iput v3, v0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mStatus:I

    .line 151
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 134
    iget v1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->uiStatus:I

    if-nez v1, :cond_0

    .line 136
    iget-object v1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->subViews:Lcom/gamevil/nexus2/ui/NxArray;

    if-eqz v1, :cond_0

    .line 137
    iget-object v1, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->subViews:Lcom/gamevil/nexus2/ui/NxArray;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/ui/NxArray;->getElement(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/gamevil/nexus2/ui/NeoUIArea;

    .line 138
    .local v0, "_area":Lcom/gamevil/nexus2/ui/NeoUIArea;
    if-eqz v0, :cond_0

    iget-boolean v1, v0, Lcom/gamevil/nexus2/ui/NeoUIArea;->mIsHidden:Z

    if-nez v1, :cond_0

    .line 139
    invoke-virtual {v0, p1}, Lcom/gamevil/nexus2/ui/NeoUIArea;->onDraw(Landroid/graphics/Canvas;)V

    .line 145
    .end local v0    # "_area":Lcom/gamevil/nexus2/ui/NeoUIArea;
    :cond_0
    return-void
.end method

.method public onInitialize()V
    .locals 2

    .prologue
    .line 92
    new-instance v0, Lcom/gamevil/nom5/ui/UIFullTouch;

    invoke-direct {v0}, Lcom/gamevil/nom5/ui/UIFullTouch;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

    .line 93
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

    invoke-virtual {v0}, Lcom/gamevil/nom5/ui/UIFullTouch;->initialize()V

    .line 94
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

    invoke-virtual {p0, v0}, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->addSubView(Lcom/gamevil/nexus2/ui/NeoUIArea;)V

    .line 96
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v1, 0x7f080004

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/gamevil/nexus2/ui/UIEditText;

    iput-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->textInput:Lcom/gamevil/nexus2/ui/UIEditText;

    .line 98
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "Nexus One"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 99
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "PC36100"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 100
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ADR6300"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "HTC Desire"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 105
    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/gamevil/nexus2/Natives;->NativeIsNexusOne(Z)V

    .line 109
    :goto_0
    return-void

    .line 107
    :cond_1
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/gamevil/nexus2/Natives;->NativeIsNexusOne(Z)V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x0

    .line 224
    sget-object v0, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    if-eqz v0, :cond_0

    .line 226
    sget-object v0, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    const/4 v1, 0x2

    invoke-virtual {p0, p1}, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->getHalKeyCode(I)I

    move-result v2

    invoke-virtual {v0, v1, v2, v3, v3}, Lcom/gamevil/nexus2/NexusGLRenderer;->setTouchEvent(IIII)V

    .line 228
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x0

    .line 234
    sget-object v0, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    if-eqz v0, :cond_0

    .line 236
    sget-object v0, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    const/4 v1, 0x3

    invoke-virtual {p0, p1}, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->getHalKeyCode(I)I

    move-result v2

    invoke-virtual {v0, v1, v2, v3, v3}, Lcom/gamevil/nexus2/NexusGLRenderer;->setTouchEvent(IIII)V

    .line 239
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 217
    invoke-super {p0, p1}, Lcom/gamevil/nexus2/ui/NeoUIControllerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 218
    const/4 v0, 0x1

    return v0
.end method

.method public setUIState()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 164
    iget v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->uiStatus:I

    sparse-switch v0, :sswitch_data_0

    .line 203
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

    invoke-virtual {v0, v1}, Lcom/gamevil/nom5/ui/UIFullTouch;->setIsHidden(Z)V

    .line 206
    :goto_0
    return-void

    .line 167
    :sswitch_0
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->showNewsView()V

    .line 168
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

    invoke-virtual {v0, v1}, Lcom/gamevil/nom5/ui/UIFullTouch;->setIsHidden(Z)V

    .line 170
    invoke-static {}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->showLiveButton()V

    goto :goto_0

    .line 178
    :sswitch_1
    invoke-static {}, Lcom/gamevil/nexus2/xml/NewsViewTask;->hideNewsView()V

    .line 180
    invoke-static {}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->hideLiveButton()V

    .line 182
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

    invoke-virtual {v0, v1}, Lcom/gamevil/nom5/ui/UIFullTouch;->setIsHidden(Z)V

    goto :goto_0

    .line 187
    :sswitch_2
    sget-object v0, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/NexusGLActivity;->finishApp()V

    goto :goto_0

    .line 191
    :sswitch_3
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

    invoke-virtual {v0, v1}, Lcom/gamevil/nom5/ui/UIFullTouch;->setIsHidden(Z)V

    goto :goto_0

    .line 195
    :sswitch_4
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

    invoke-virtual {v0, v1}, Lcom/gamevil/nom5/ui/UIFullTouch;->setIsHidden(Z)V

    goto :goto_0

    .line 199
    :sswitch_5
    invoke-direct {p0}, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->setTextInputInvisible()V

    .line 200
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->fullTouch:Lcom/gamevil/nom5/ui/UIFullTouch;

    invoke-virtual {v0, v1}, Lcom/gamevil/nom5/ui/UIFullTouch;->setIsHidden(Z)V

    goto :goto_0

    .line 164
    nop

    :sswitch_data_0
    .sparse-switch
        0xe -> :sswitch_1
        0x10 -> :sswitch_4
        0x11 -> :sswitch_3
        0x12 -> :sswitch_5
        0x13 -> :sswitch_0
        0x68 -> :sswitch_2
    .end sparse-switch
.end method

.method public startBlock()V
    .locals 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/gamevil/nom5/ui/Nom5UIControllerView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/gamevil/nom5/ui/Nom5UIControllerView$1;

    invoke-direct {v1, p0}, Lcom/gamevil/nom5/ui/Nom5UIControllerView$1;-><init>(Lcom/gamevil/nom5/ui/Nom5UIControllerView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 129
    return-void
.end method
