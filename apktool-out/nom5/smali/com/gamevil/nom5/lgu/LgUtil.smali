.class public Lcom/gamevil/nom5/lgu/LgUtil;
.super Ljava/lang/Object;
.source "LgUtil.java"


# instance fields
.field private activity:Lcom/gamevil/nexus2/NexusGLActivity;

.field private armServiceConnection:Landroid/content/ServiceConnection;

.field private handler:Landroid/os/Handler;

.field private iapServiceConnection:Landroid/content/ServiceConnection;

.field private isArmServiceBinding:Z

.field private isIapServiceBinding:Z

.field private strArmId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/gamevil/nexus2/NexusGLActivity;)V
    .locals 1
    .param p1, "_activity"    # Lcom/gamevil/nexus2/NexusGLActivity;

    .prologue
    const/4 v0, 0x0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-boolean v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->isArmServiceBinding:Z

    .line 41
    iput-boolean v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->isIapServiceBinding:Z

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->strArmId:Ljava/lang/String;

    .line 43
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->handler:Landroid/os/Handler;

    .line 44
    new-instance v0, Lcom/gamevil/nom5/lgu/LgUtil$1;

    invoke-direct {v0, p0}, Lcom/gamevil/nom5/lgu/LgUtil$1;-><init>(Lcom/gamevil/nom5/lgu/LgUtil;)V

    iput-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->iapServiceConnection:Landroid/content/ServiceConnection;

    .line 61
    new-instance v0, Lcom/gamevil/nom5/lgu/LgUtil$2;

    invoke-direct {v0, p0}, Lcom/gamevil/nom5/lgu/LgUtil$2;-><init>(Lcom/gamevil/nom5/lgu/LgUtil;)V

    iput-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->armServiceConnection:Landroid/content/ServiceConnection;

    .line 94
    iput-object p1, p0, Lcom/gamevil/nom5/lgu/LgUtil;->activity:Lcom/gamevil/nexus2/NexusGLActivity;

    .line 95
    return-void
.end method

.method static synthetic access$0(Lcom/gamevil/nom5/lgu/LgUtil;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->strArmId:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1(Lcom/gamevil/nom5/lgu/LgUtil;)Lcom/gamevil/nexus2/NexusGLActivity;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->activity:Lcom/gamevil/nexus2/NexusGLActivity;

    return-object v0
.end method


# virtual methods
.method public bindIAPService()Z
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 136
    iput-boolean v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->isIapServiceBinding:Z

    .line 137
    return v0
.end method

.method public releaseArmService()V
    .locals 2

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->isArmServiceBinding:Z

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->armServiceConnection:Landroid/content/ServiceConnection;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->activity:Lcom/gamevil/nexus2/NexusGLActivity;

    iget-object v1, p0, Lcom/gamevil/nom5/lgu/LgUtil;->armServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/NexusGLActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 124
    :cond_0
    return-void
.end method

.method public runArmService(Ljava/lang/String;)Z
    .locals 1
    .param p1, "armId"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/gamevil/nom5/lgu/LgUtil;->strArmId:Ljava/lang/String;

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->isArmServiceBinding:Z

    return v0
.end method

.method public showAlertNShutdown(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "errorCode"    # Ljava/lang/Integer;
    .param p3, "elseCode"    # Ljava/lang/Integer;

    .prologue
    return-void
.end method

.method public unbindIAPService()V
    .locals 2

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->isIapServiceBinding:Z

    if-eqz v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->iapServiceConnection:Landroid/content/ServiceConnection;

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/gamevil/nom5/lgu/LgUtil;->activity:Lcom/gamevil/nexus2/NexusGLActivity;

    iget-object v1, p0, Lcom/gamevil/nom5/lgu/LgUtil;->iapServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/NexusGLActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 169
    :cond_0
    return-void
.end method
