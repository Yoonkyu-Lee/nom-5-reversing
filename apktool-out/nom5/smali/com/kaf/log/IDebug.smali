.class public abstract Lcom/kaf/log/IDebug;
.super Ljava/lang/Object;
.source "IDebug.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p1, "func"    # Ljava/lang/String;
    .param p2, "stat"    # Ljava/lang/String;
    .param p3, "arg1"    # Ljava/lang/String;

    .prologue
    .line 5
    const/4 v0, -0x1

    return v0
.end method
