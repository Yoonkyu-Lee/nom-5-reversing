.class public Lcom/feelingk/iap/net/ItemAuthInfo;
.super Ljava/lang/Object;
.source "ItemAuthInfo.java"


# instance fields
.field public pCount:I

.field public pExpireDate:[B

.field public pToken:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object v0, p0, Lcom/feelingk/iap/net/ItemAuthInfo;->pExpireDate:[B

    .line 13
    iput-object v0, p0, Lcom/feelingk/iap/net/ItemAuthInfo;->pToken:[B

    .line 8
    return-void
.end method
