.class Lcom/gamevil/nom5/lgu/LgUtil$1;
.super Ljava/lang/Object;
.source "LgUtil.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nom5/lgu/LgUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nom5/lgu/LgUtil;


# direct methods
.method constructor <init>(Lcom/gamevil/nom5/lgu/LgUtil;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nom5/lgu/LgUtil$1;->this$0:Lcom/gamevil/nom5/lgu/LgUtil;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IAP ServiceConnection.onServiceConnected()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    sget-object v0, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    if-eqz v0, :cond_0

    .line 49
    const/4 v0, 0x0

    sput-object v0, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    .line 50
    :cond_0
    invoke-static {p2}, Lcom/lguplus/common/bill/IBillSocket$Stub;->asInterface(Landroid/os/IBinder;)Lcom/lguplus/common/bill/IBillSocket;

    move-result-object v0

    sput-object v0, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    .line 51
    const/4 v0, 0x1

    sput-boolean v0, Lcom/gamevil/nexus2/Natives;->bCanConn:Z

    .line 52
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "p_name"    # Landroid/content/ComponentName;

    .prologue
    .line 56
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "IAP ServiceConnection.onServiceDisconnected ()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    const/4 v0, 0x0

    sput-object v0, Lcom/gamevil/nexus2/Natives;->billSock:Lcom/lguplus/common/bill/IBillSocket;

    .line 58
    const/4 v0, 0x0

    sput-boolean v0, Lcom/gamevil/nexus2/Natives;->bCanConn:Z

    .line 59
    return-void
.end method
