.class public Lcom/kaf/log/Debug;
.super Ljava/lang/Object;
.source "Debug.java"


# instance fields
.field private debug:Lcom/kaf/log/IDebug;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/kaf/log/Debug;->debug:Lcom/kaf/log/IDebug;

    .line 15
    :try_start_0
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/kaf/KafManager;->getDebug()Lcom/kaf/log/IDebug;

    move-result-object v1

    iput-object v1, p0, Lcom/kaf/log/Debug;->debug:Lcom/kaf/log/IDebug;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    :goto_0
    return-void

    .line 17
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 18
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p1, "func"    # Ljava/lang/String;
    .param p2, "stat"    # Ljava/lang/String;
    .param p3, "arg1"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    .line 42
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/kaf/log/Debug;->debug:Lcom/kaf/log/IDebug;

    invoke-virtual {v0, p1, p2, p3}, Lcom/kaf/log/IDebug;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method
