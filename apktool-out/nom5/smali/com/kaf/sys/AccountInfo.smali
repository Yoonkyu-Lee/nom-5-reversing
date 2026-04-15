.class public Lcom/kaf/sys/AccountInfo;
.super Ljava/lang/Object;
.source "AccountInfo.java"


# instance fields
.field public id:Ljava/lang/String;

.field public password:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const-string v0, ""

    iput-object v0, p0, Lcom/kaf/sys/AccountInfo;->id:Ljava/lang/String;

    .line 5
    const-string v0, ""

    iput-object v0, p0, Lcom/kaf/sys/AccountInfo;->password:Ljava/lang/String;

    .line 3
    return-void
.end method
