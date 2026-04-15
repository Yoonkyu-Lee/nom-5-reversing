.class public abstract Lcom/kaf/app/IPackageManager;
.super Ljava/lang/Object;
.source "IPackageManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method


# virtual methods
.method public installPackage(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)I
    .locals 1
    .param p1, "packagePath"    # Ljava/lang/String;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "installFlag"    # I
    .param p4, "nPackage"    # Ljava/lang/String;
    .param p5, "nClass"    # Ljava/lang/String;
    .param p6, "nExtras"    # Ljava/lang/String;
    .param p7, "mode"    # Z
    .param p8, "appName"    # Ljava/lang/String;

    .prologue
    .line 24
    const/4 v0, 0x0

    return v0
.end method

.method public installPackage(Ljava/lang/String;Ljava/lang/String;Z)I
    .locals 1
    .param p1, "packagePath"    # Ljava/lang/String;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "mode"    # Z

    .prologue
    .line 17
    const/4 v0, 0x0

    return v0
.end method

.method public installPackage(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)I
    .locals 1
    .param p1, "packagePath"    # Ljava/lang/String;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "mode"    # Z
    .param p4, "appName"    # Ljava/lang/String;

    .prologue
    .line 11
    const/4 v0, 0x0

    return v0
.end method

.method public uninstallPackage(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)I
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "installFlag"    # I
    .param p3, "nPackage"    # Ljava/lang/String;
    .param p4, "nClass"    # Ljava/lang/String;
    .param p5, "nExtras"    # Ljava/lang/String;
    .param p6, "mode"    # Z
    .param p7, "appName"    # Ljava/lang/String;

    .prologue
    .line 28
    const/4 v0, 0x0

    return v0
.end method

.method public uninstallPackage(Ljava/lang/String;Z)I
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "mode"    # Z

    .prologue
    .line 20
    const/4 v0, 0x0

    return v0
.end method

.method public uninstallPackage(Ljava/lang/String;ZLjava/lang/String;)I
    .locals 1
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "mode"    # Z
    .param p3, "appName"    # Ljava/lang/String;

    .prologue
    .line 14
    const/4 v0, 0x0

    return v0
.end method
