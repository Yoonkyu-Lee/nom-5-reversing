.class public Lcom/kaf/sys/Property;
.super Ljava/lang/Object;
.source "Property.java"


# static fields
.field public static final MODE_ENC:I = 0x1

.field public static final MODE_NORMAL:I = 0x0

.field public static final MODE_PRIVATE_ENC:I = 0x2


# instance fields
.field private property:Lcom/kaf/sys/IProperty;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    .line 28
    :try_start_0
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/kaf/KafManager;->getProperty()Lcom/kaf/sys/IProperty;

    move-result-object v1

    iput-object v1, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :goto_0
    return-void

    .line 30
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 31
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public getCellID()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 105
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 106
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 107
    const-string v2, "KAF Library is not loaded."

    .line 106
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 110
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 111
    const-string v2, "Object is null"

    .line 110
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getCellID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceType()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 298
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 299
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 300
    const-string v2, "KAF Library is not loaded."

    .line 299
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 302
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 303
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 304
    const-string v2, "Object is null"

    .line 303
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 306
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getDeviceType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFwVersion()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 127
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 128
    const-string v2, "KAF Library is not loaded."

    .line 127
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 131
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 132
    const-string v2, "Object is null"

    .line 131
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getFwVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHwVersion()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 168
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 169
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 170
    const-string v2, "KAF Library is not loaded."

    .line 169
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 173
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 174
    const-string v2, "Object is null"

    .line 173
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 176
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getHwVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKafVersion()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 208
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 209
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 210
    const-string v2, "KAF Library is not loaded."

    .line 209
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 213
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 214
    const-string v2, "Object is null"

    .line 213
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 216
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getKafVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLAC()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 85
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 86
    const-string v2, "KAF Library is not loaded."

    .line 85
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 89
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 90
    const-string v2, "Object is null"

    .line 89
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getLAC()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMCC()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 46
    const-string v2, "KAF Library is not loaded."

    .line 45
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 49
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 50
    const-string v2, "Object is null"

    .line 49
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getMCC()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMNC()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 65
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 66
    const-string v2, "KAF Library is not loaded."

    .line 65
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 69
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 70
    const-string v2, "Object is null"

    .line 69
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getMNC()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getManufacturer()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 253
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 254
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 255
    const-string v2, "KAF Library is not loaded."

    .line 254
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 257
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 258
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 259
    const-string v2, "Object is null"

    .line 258
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 261
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getManufacturer()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModelName()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 273
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 274
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 275
    const-string v2, "KAF Library is not loaded."

    .line 274
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 277
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 278
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 279
    const-string v2, "Object is null"

    .line 278
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 281
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getModelName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOsVersion()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 188
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 189
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 190
    const-string v2, "KAF Library is not loaded."

    .line 189
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 193
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 194
    const-string v2, "Object is null"

    .line 193
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 196
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getOsVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
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
    .line 311
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 312
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 313
    const-string v2, "KAF Library is not loaded."

    .line 312
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 315
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 316
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 317
    const-string v2, "Object is null"

    .line 316
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 319
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0, p1, p2}, Lcom/kaf/sys/IProperty;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSwBuildtimeInfo()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 229
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 230
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 231
    const-string v2, "KAF Library is not loaded."

    .line 230
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 234
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 235
    const-string v2, "Object is null"

    .line 234
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 237
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getSwBuildtimeInfo()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSwVersion()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Lcom/kaf/NotSupportException;
        }
    .end annotation

    .prologue
    .line 147
    invoke-static {}, Lcom/kaf/KafManager;->getInstance()Lcom/kaf/KafManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/kaf/KafManager;->isKafLibraryInit()Z

    move-result v0

    if-nez v0, :cond_0

    .line 148
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000001"

    .line 149
    const-string v2, "KAF Library is not loaded."

    .line 148
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    if-nez v0, :cond_1

    .line 152
    new-instance v0, Lcom/kaf/GeneralException;

    const-string v1, "F00000004"

    .line 153
    const-string v2, "Object is null"

    .line 152
    invoke-direct {v0, v1, v2}, Lcom/kaf/GeneralException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0

    .line 155
    :cond_1
    iget-object v0, p0, Lcom/kaf/sys/Property;->property:Lcom/kaf/sys/IProperty;

    invoke-virtual {v0}, Lcom/kaf/sys/IProperty;->getSwVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
