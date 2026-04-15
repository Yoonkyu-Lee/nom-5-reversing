.class public abstract Lcom/kaf/contentsbox/IStatContentsBoxFs;
.super Ljava/lang/Object;
.source "IStatContentsBoxFs.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    return-void
.end method

.method public constructor <init>(III)V
    .locals 0
    .param p1, "blockSize"    # I
    .param p2, "blockCount"    # I
    .param p3, "freeBlocks"    # I

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 11
    const/4 v0, -0x1

    return v0
.end method

.method public getBlockCount()I
    .locals 1

    .prologue
    .line 20
    const/4 v0, -0x1

    return v0
.end method

.method public getBlockSize()I
    .locals 1

    .prologue
    .line 14
    const/4 v0, -0x1

    return v0
.end method

.method public getFreeBlocks()I
    .locals 1

    .prologue
    .line 26
    const/4 v0, -0x1

    return v0
.end method

.method public getUsedBlocks()I
    .locals 1

    .prologue
    .line 32
    const/4 v0, -0x1

    return v0
.end method

.method public getUsedContentsBox()I
    .locals 1

    .prologue
    .line 38
    const/4 v0, -0x1

    return v0
.end method

.method public setBlockCount(I)V
    .locals 0
    .param p1, "blockCount"    # I

    .prologue
    .line 24
    return-void
.end method

.method public setBlockSize(I)V
    .locals 0
    .param p1, "blockSize"    # I

    .prologue
    .line 18
    return-void
.end method

.method public setFreeBlocks(I)V
    .locals 0
    .param p1, "freeBlocks"    # I

    .prologue
    .line 30
    return-void
.end method

.method public setUsedBlocks(I)V
    .locals 0
    .param p1, "usedBlocks"    # I

    .prologue
    .line 36
    return-void
.end method

.method public setUsedContentsBox(I)V
    .locals 0
    .param p1, "usedContentsBox"    # I

    .prologue
    .line 41
    return-void
.end method
