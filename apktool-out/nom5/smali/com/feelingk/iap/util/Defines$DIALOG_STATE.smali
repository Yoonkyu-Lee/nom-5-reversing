.class public final Lcom/feelingk/iap/util/Defines$DIALOG_STATE;
.super Ljava/lang/Object;
.source "Defines.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/util/Defines;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DIALOG_STATE"
.end annotation


# static fields
.field public static final DLG_AUTH_DIALOG:I = 0x6a

.field public static final DLG_ERROR:I = 0x65

.field public static final DLG_LOADING_PROGRESS:I = 0x66

.field public static final DLG_NONE:I = 0x64

.field public static final DLG_PURCHASE:I = 0x67

.field public static final DLG_PURCHASE_CONFIRM:I = 0x69

.field public static final DLG_PURCHASE_PROGRESS:I = 0x68


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
