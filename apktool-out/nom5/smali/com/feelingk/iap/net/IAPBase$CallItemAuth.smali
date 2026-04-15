.class Lcom/feelingk/iap/net/IAPBase$CallItemAuth;
.super Ljava/lang/Object;
.source "IAPBase.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/net/IAPBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallItemAuth"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private pID:Ljava/lang/String;

.field private pTelecom:I

.field final synthetic this$0:Lcom/feelingk/iap/net/IAPBase;


# direct methods
.method public constructor <init>(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/String;)V
    .locals 1
    .param p2, "telecom"    # I
    .param p3, "productID"    # Ljava/lang/String;

    .prologue
    .line 628
    iput-object p1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->this$0:Lcom/feelingk/iap/net/IAPBase;

    .line 625
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 618
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->pID:Ljava/lang/String;

    .line 619
    const/4 v0, 0x0

    iput v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->pTelecom:I

    .line 626
    iput p2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->pTelecom:I

    .line 627
    iput-object p3, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->pID:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Boolean;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 631
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->pID:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 632
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 640
    :goto_0
    return-object v0

    .line 634
    :cond_0
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->this$0:Lcom/feelingk/iap/net/IAPBase;

    iget v1, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->pTelecom:I

    iget-object v2, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->pID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v4}, Lcom/feelingk/iap/net/IAPBase;->connect(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 635
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 638
    :cond_1
    iget-object v0, p0, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->this$0:Lcom/feelingk/iap/net/IAPBase;

    const/16 v1, 0x455

    invoke-static {v0, v1, v4}, Lcom/feelingk/iap/net/IAPBase;->access$3(Lcom/feelingk/iap/net/IAPBase;ILjava/lang/Object;)V

    .line 640
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/feelingk/iap/net/IAPBase$CallItemAuth;->call()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
