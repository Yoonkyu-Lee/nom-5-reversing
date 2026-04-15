.class Lcom/gamevil/nom5/lgu/LgUtil$2;
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
    iput-object p1, p0, Lcom/gamevil/nom5/lgu/LgUtil$2;->this$0:Lcom/gamevil/nom5/lgu/LgUtil;

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 8
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "ARM ServiceConnection.onServiceConnected()"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    invoke-static {p2}, Lcom/lgt/arm/ArmInterface$Stub;->asInterface(Landroid/os/IBinder;)Lcom/lgt/arm/ArmInterface;

    move-result-object v0

    .line 67
    .local v0, "armInterface":Lcom/lgt/arm/ArmInterface;
    :try_start_0
    iget-object v3, p0, Lcom/gamevil/nom5/lgu/LgUtil$2;->this$0:Lcom/gamevil/nom5/lgu/LgUtil;

    invoke-static {v3}, Lcom/gamevil/nom5/lgu/LgUtil;->access$0(Lcom/gamevil/nom5/lgu/LgUtil;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/lgt/arm/ArmInterface;->executeArm(Ljava/lang/String;)I

    move-result v2

    .line 68
    .local v2, "result":I
    if-ne v2, v5, :cond_0

    .line 69
    const/4 v3, 0x1

    invoke-static {v3}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->setArmPassed(Z)V

    .line 80
    .end local v2    # "result":I
    :goto_0
    return-void

    .line 71
    .restart local v2    # "result":I
    :cond_0
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->setArmPassed(Z)V

    .line 72
    iget-object v3, p0, Lcom/gamevil/nom5/lgu/LgUtil$2;->this$0:Lcom/gamevil/nom5/lgu/LgUtil;

    const-string v4, "ARM ALERT"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v6, Lcom/gamevil/nom5/lgu/Constants;->LGU:Lcom/gamevil/nom5/lgu/Constants;

    iget-object v6, v6, Lcom/gamevil/nom5/lgu/Constants;->INT_LGU_IAP_GENERAL_ERROR:Ljava/lang/Integer;

    invoke-virtual {v3, v4, v5, v6}, Lcom/gamevil/nom5/lgu/LgUtil;->showAlertNShutdown(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 74
    .end local v2    # "result":I
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 75
    .local v1, "e":Landroid/os/RemoteException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ARM ServiceConnection.onServiceConnected () : "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    .line 77
    invoke-static {v7}, Lcom/gamevil/nom5/lgu/Nom5Launcher;->setArmPassed(Z)V

    .line 78
    iget-object v3, p0, Lcom/gamevil/nom5/lgu/LgUtil$2;->this$0:Lcom/gamevil/nom5/lgu/LgUtil;

    const-string v4, "ARM ALERT"

    sget-object v5, Lcom/gamevil/nom5/lgu/Constants;->LGU:Lcom/gamevil/nom5/lgu/Constants;

    iget-object v5, v5, Lcom/gamevil/nom5/lgu/Constants;->INT_LGU_IAP_GENERAL_ERROR:Ljava/lang/Integer;

    sget-object v6, Lcom/gamevil/nom5/lgu/Constants;->LGU:Lcom/gamevil/nom5/lgu/Constants;

    iget-object v6, v6, Lcom/gamevil/nom5/lgu/Constants;->INT_LGU_IAP_GENERAL_ERROR:Ljava/lang/Integer;

    invoke-virtual {v3, v4, v5, v6}, Lcom/gamevil/nom5/lgu/LgUtil;->showAlertNShutdown(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 84
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ARM ServiceConnection.onServiceDisconnected ()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    return-void
.end method
