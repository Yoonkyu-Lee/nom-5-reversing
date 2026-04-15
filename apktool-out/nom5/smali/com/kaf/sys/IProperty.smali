.class public abstract Lcom/kaf/sys/IProperty;
.super Ljava/lang/Object;
.source "IProperty.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCellID()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 17
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDeviceType()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 44
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFwVersion()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 20
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHwVersion()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 26
    const/4 v0, 0x0

    return-object v0
.end method

.method public getKafVersion()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 32
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLAC()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 14
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMCC()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 8
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMNC()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 11
    const/4 v0, 0x0

    return-object v0
.end method

.method public getManufacturer()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    return-object v0
.end method

.method public getModelName()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 41
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOsVersion()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 29
    const/4 v0, 0x0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "tag0"    # Ljava/lang/String;
    .param p2, "tag1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalArgumentException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 47
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSwBuildtimeInfo()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 35
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSwVersion()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 23
    const/4 v0, 0x0

    return-object v0
.end method
