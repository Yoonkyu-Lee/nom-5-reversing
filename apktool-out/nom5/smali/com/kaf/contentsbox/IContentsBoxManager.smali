.class public abstract Lcom/kaf/contentsbox/IContentsBoxManager;
.super Ljava/lang/Object;
.source "IContentsBoxManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/kaf/contentsbox/IContentsBoxManager$ContentsBoxConnection;,
        Lcom/kaf/contentsbox/IContentsBoxManager$ServiceConnectionListener;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/kaf/contentsbox/IContentsBoxManager$ServiceConnectionListener;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sessionKeyListener"    # Lcom/kaf/contentsbox/IContentsBoxManager$ServiceConnectionListener;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method


# virtual methods
.method public closeContentFile(ILjava/io/FileDescriptor;I)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "status"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 70
    return-void
.end method

.method public closeIconFile(ILjava/io/FileDescriptor;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 83
    return-void
.end method

.method public closeThumbnail(ILjava/io/FileDescriptor;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 81
    return-void
.end method

.method public connectService()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    return v0
.end method

.method public createThumbnail(I)Z
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 72
    const/4 v0, 0x0

    return v0
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 189
    const/4 v0, -0x1

    return v0
.end method

.method public deleteAppWidgetInfo(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "selection"    # Ljava/lang/String;
    .param p2, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, -0x1

    return v0
.end method

.method public deleteCategory(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "selection"    # Ljava/lang/String;
    .param p2, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 155
    const/4 v0, -0x1

    return v0
.end method

.method public deleteContentsInfo(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "selection"    # Ljava/lang/String;
    .param p2, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 61
    const/4 v0, -0x1

    return v0
.end method

.method public deleteDownloadUrl(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "selection"    # Ljava/lang/String;
    .param p2, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 164
    const/4 v0, -0x1

    return v0
.end method

.method public deleteMimeType(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "selection"    # Ljava/lang/String;
    .param p2, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 131
    const/4 v0, -0x1

    return v0
.end method

.method public deletePlayListConts(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "selection"    # Ljava/lang/String;
    .param p2, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 134
    const/4 v0, -0x1

    return v0
.end method

.method public deletePlayListInfo(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "selection"    # Ljava/lang/String;
    .param p2, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 128
    const/4 v0, -0x1

    return v0
.end method

.method public disconnectService()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 41
    return-void
.end method

.method public executeCommand(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 192
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAppWidgetInfo([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 94
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAudioMetadata(I)[Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 170
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCategory([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 97
    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentsBoxName(I)[Ljava/lang/String;
    .locals 1
    .param p1, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 46
    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentsInfo([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 49
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDownloadUrl([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 140
    const/4 v0, 0x0

    return-object v0
.end method

.method public getExternalVolumeSerial(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 115
    const/4 v0, 0x0

    return-object v0
.end method

.method public getExternalVolumnSerial(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 121
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMimeType([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 85
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPlayListConts([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 91
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPlayListInfo([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "projection"    # [Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 88
    const/4 v0, 0x0

    return-object v0
.end method

.method public getStorageCapacity(ILjava/lang/String;)Lcom/kaf/contentsbox/IStatContentsBoxFs;
    .locals 1
    .param p1, "type"    # I
    .param p2, "contentsBoxName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 43
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 186
    const/4 v0, -0x1

    return v0
.end method

.method public insertAppWidgetInfo(Landroid/content/ContentValues;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 146
    const/4 v0, -0x1

    return v0
.end method

.method public insertCategory(Landroid/content/ContentValues;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 143
    const/4 v0, -0x1

    return v0
.end method

.method public insertContentsInfo(Landroid/content/ContentValues;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 52
    const/4 v0, -0x1

    return v0
.end method

.method public insertDownloadUrl(Landroid/content/ContentValues;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 158
    const/4 v0, -0x1

    return v0
.end method

.method public insertMimeType(Landroid/content/ContentValues;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 100
    const/4 v0, -0x1

    return v0
.end method

.method public insertPlayListConts(Landroid/content/ContentValues;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 106
    const/4 v0, -0x1

    return v0
.end method

.method public insertPlayListInfo(Landroid/content/ContentValues;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 103
    const/4 v0, -0x1

    return v0
.end method

.method public openContentFile(II)Ljava/io/FileDescriptor;
    .locals 1
    .param p1, "id"    # I
    .param p2, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 64
    const/4 v0, 0x0

    return-object v0
.end method

.method public openIconFile(II)Ljava/io/FileDescriptor;
    .locals 1
    .param p1, "id"    # I
    .param p2, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 67
    const/4 v0, 0x0

    return-object v0
.end method

.method public openThumbnail(I)Ljava/io/FileDescriptor;
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 75
    const/4 v0, 0x0

    return-object v0
.end method

.method public openThumbnail(II)Ljava/io/FileDescriptor;
    .locals 1
    .param p1, "id"    # I
    .param p2, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 78
    const/4 v0, 0x0

    return-object v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 180
    const/4 v0, 0x0

    return-object v0
.end method

.method public reducePlayCount(I)Z
    .locals 1
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 183
    const/4 v0, -0x1

    return v0
.end method

.method public updateAppWidgetInfo(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 152
    const/4 v0, -0x1

    return v0
.end method

.method public updateCategory(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 149
    const/4 v0, -0x1

    return v0
.end method

.method public updateContentsInfo(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 55
    const/4 v0, -0x1

    return v0
.end method

.method public updateDownloadUrl(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 161
    const/4 v0, -0x1

    return v0
.end method

.method public updateMimeType(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 109
    const/4 v0, -0x1

    return v0
.end method

.method public updatePlayListConts(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 125
    const/4 v0, -0x1

    return v0
.end method

.method public updatePlayListInfo(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Lcom/kaf/NotSupportException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 112
    const/4 v0, -0x1

    return v0
.end method

.method public updateRingtone(II)Landroid/database/Cursor;
    .locals 1
    .param p1, "Id"    # I
    .param p2, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/kaf/GeneralException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 167
    const/4 v0, 0x0

    return-object v0
.end method
