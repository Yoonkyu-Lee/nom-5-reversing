.class public Lcom/gamevil/nom5/lgu/Nom5Launcher;
.super Lcom/gamevil/nexus2/NexusGLActivity;
.source "Nom5Launcher.java"


# static fields
.field private static armPassed:Z

.field public static dialog:Landroid/app/ProgressDialog;

.field public static isShownAlert:Z


# instance fields
.field private final STR_ARM_ID:Ljava/lang/String;

.field private lgUtil:Lcom/gamevil/nom5/lgu/LgUtil;

.field private updateChecker:Lcom/gamevil/nexus2/xml/NexusXmlChecker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 45
    const/4 v0, 0x0

    sput-object v0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->dialog:Landroid/app/ProgressDialog;

    .line 46
    sput-boolean v1, Lcom/gamevil/nom5/lgu/Nom5Launcher;->armPassed:Z

    .line 47
    sput-boolean v1, Lcom/gamevil/nom5/lgu/Nom5Launcher;->isShownAlert:Z

    .line 43
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/gamevil/nexus2/NexusGLActivity;-><init>()V

    .line 48
    const-string v0, "AQ00102631"

    iput-object v0, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->STR_ARM_ID:Ljava/lang/String;

    .line 49
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->updateChecker:Lcom/gamevil/nexus2/xml/NexusXmlChecker;

    .line 50
    new-instance v0, Lcom/gamevil/nom5/lgu/LgUtil;

    invoke-direct {v0, p0}, Lcom/gamevil/nom5/lgu/LgUtil;-><init>(Lcom/gamevil/nexus2/NexusGLActivity;)V

    iput-object v0, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->lgUtil:Lcom/gamevil/nom5/lgu/LgUtil;

    .line 43
    return-void
.end method

.method public static isArmPassed()Z
    .locals 1

    .prologue
    .line 183
    const/4 v0, 0x1

    return v0
.end method

.method public static setArmPassed(Z)V
    .locals 0
    .param p0, "armPassed"    # Z

    .prologue
    .line 187
    sput-boolean p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->armPassed:Z

    .line 188
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    .line 62
    invoke-super {p0, p1}, Lcom/gamevil/nexus2/NexusGLActivity;->onCreate(Landroid/os/Bundle;)V

    .line 66
    const/high16 v1, 0x7f030000

    invoke-virtual {p0, v1}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->setContentView(I)V

    .line 67
    const v1, 0x7f080001

    invoke-virtual {p0, v1}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/gamevil/nexus2/NexusGLSurfaceView;

    iput-object v1, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    .line 68
    const v1, 0x7f080002

    invoke-virtual {p0, v1}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/gamevil/nom5/ui/Nom5UIControllerView;

    sput-object v1, Lcom/gamevil/nom5/lgu/Nom5Launcher;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    .line 69
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->glSurfaceview:Lcom/gamevil/nexus2/NexusGLSurfaceView;

    new-instance v2, Lcom/gamevil/nexus2/NexusGLRenderer;

    invoke-direct {v2}, Lcom/gamevil/nexus2/NexusGLRenderer;-><init>()V

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLSurfaceView;->setRenderer(Lcom/gamevil/nexus2/NexusGLSurfaceView$Renderer;)V

    .line 70
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v2, 0x7f080005

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {p0, v1}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->setImgTitle(Landroid/widget/ImageView;)V

    .line 71
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    const v2, 0x7f080007

    invoke-virtual {v1, v2}, Lcom/gamevil/nexus2/NexusGLActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0, v1}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->setVerionView(Landroid/widget/TextView;)V

    .line 72
    sget-object v1, Lcom/gamevil/nexus2/NexusGLActivity;->myActivity:Lcom/gamevil/nexus2/NexusGLActivity;

    invoke-virtual {v1}, Lcom/gamevil/nexus2/NexusGLActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x3

    invoke-static {v1, v2}, Lcom/gamevil/nexus2/ui/NexusSound;->initSounds(Landroid/content/Context;I)V

    .line 73
    sget-object v1, Lcom/gamevil/nom5/lgu/Nom5Launcher;->uiViewControll:Lcom/gamevil/nexus2/ui/NeoUIControllerView;

    invoke-static {v1}, Lcom/gamevil/nexus2/Natives;->setUIListener(Lcom/gamevil/nexus2/Natives$UIListener;)V

    .line 79
    :try_start_0
    invoke-virtual {p0}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v1, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->version:Ljava/lang/String;

    .line 80
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->txtVersion:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 81
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->txtVersion:Landroid/widget/TextView;

    const-string v2, "v%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->version:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->lgUtil:Lcom/gamevil/nom5/lgu/LgUtil;

    const-string v2, "AQ00102631"

    invoke-virtual {v1, v2}, Lcom/gamevil/nom5/lgu/LgUtil;->runArmService(Ljava/lang/String;)Z

    move-result v1

    sput-boolean v1, Lcom/gamevil/nom5/lgu/Nom5Launcher;->armPassed:Z

    .line 96
    sput-boolean v6, Lcom/gamevil/nexus2/Natives;->bCanConn:Z

    .line 97
    iget-object v1, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->lgUtil:Lcom/gamevil/nom5/lgu/LgUtil;

    invoke-virtual {v1}, Lcom/gamevil/nom5/lgu/LgUtil;->bindIAPService()Z

    .line 104
    const/16 v1, 0x190

    sput v1, Lcom/gamevil/nom5/lgu/Nom5Launcher;->gameScreenWidth:I

    .line 105
    const/16 v1, 0xf0

    sput v1, Lcom/gamevil/nom5/lgu/Nom5Launcher;->gameScreenHeight:I

    .line 131
    return-void

    .line 82
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 83
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v1, "v1.0.0"

    iput-object v1, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->version:Ljava/lang/String;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 144
    invoke-super {p0}, Lcom/gamevil/nexus2/NexusGLActivity;->onDestroy()V

    .line 146
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->lgUtil:Lcom/gamevil/nom5/lgu/LgUtil;

    invoke-virtual {v0}, Lcom/gamevil/nom5/lgu/LgUtil;->releaseArmService()V

    .line 147
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->lgUtil:Lcom/gamevil/nom5/lgu/LgUtil;

    invoke-virtual {v0}, Lcom/gamevil/nom5/lgu/LgUtil;->unbindIAPService()V

    .line 148
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->updateChecker:Lcom/gamevil/nexus2/xml/NexusXmlChecker;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->updateChecker:Lcom/gamevil/nexus2/xml/NexusXmlChecker;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/xml/NexusXmlChecker;->releaseAll()V

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gamevil/nom5/lgu/Nom5Launcher;->updateChecker:Lcom/gamevil/nexus2/xml/NexusXmlChecker;

    .line 152
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 6
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v2, 0x3

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 156
    const-string v1, "audio"

    invoke-virtual {p0, v1}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 157
    .local v0, "audio":Landroid/media/AudioManager;
    sparse-switch p1, :sswitch_data_0

    .line 179
    invoke-super {p0, p1, p2}, Lcom/gamevil/nexus2/NexusGLActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    :goto_0
    return v1

    .line 159
    :sswitch_0
    invoke-virtual {v0, v2, v4, v4}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    move v1, v4

    .line 163
    goto :goto_0

    .line 167
    :sswitch_1
    const/4 v1, -0x1

    .line 165
    invoke-virtual {v0, v2, v1, v4}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    move v1, v4

    .line 169
    goto :goto_0

    .line 171
    :sswitch_2
    sget-object v1, Lcom/gamevil/nexus2/NexusGLRenderer;->m_renderer:Lcom/gamevil/nexus2/NexusGLRenderer;

    .line 172
    const/4 v2, 0x2

    .line 173
    const/4 v3, -0x8

    .line 171
    invoke-virtual {v1, v2, v3, v5, v5}, Lcom/gamevil/nexus2/NexusGLRenderer;->setTouchEvent(IIII)V

    move v1, v4

    .line 176
    goto :goto_0

    .line 157
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_2
        0x18 -> :sswitch_0
        0x19 -> :sswitch_1
    .end sparse-switch
.end method
