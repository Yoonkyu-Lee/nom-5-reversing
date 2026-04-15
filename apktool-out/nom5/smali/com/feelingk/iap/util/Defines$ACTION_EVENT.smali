.class public final Lcom/feelingk/iap/util/Defines$ACTION_EVENT;
.super Ljava/lang/Object;
.source "Defines.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/feelingk/iap/util/Defines;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ACTION_EVENT"
.end annotation


# static fields
.field public static final HND_AUTH_JUMINNUMBER:I = 0x456

.field public static final HND_ITEMAUTH_FINISH:I = 0x455

.field public static final HND_ITEMINFO_FINISH:I = 0x450

.field public static final HND_ITEMQUERY_FINISH:I = 0x451

.field public static final HND_ITEMUSE_FINISH:I = 0x454

.field public static final HND_PERMISSON_ERROR:I = 0x45b

.field public static final HND_PURCHASE_CANCEL:I = 0x44e

.field public static final HND_PURCHASE_CONFIRM:I = 0x44c

.field public static final HND_PURCHASE_CONFIRM_DANAL:I = 0x44d

.field public static final HND_PURCHASE_FINISH:I = 0x452

.field public static final HND_PURCHASE_FINISH_OK:I = 0x44f

.field public static final HND_USIM_ACTIVATE_ERROR:I = 0x45c

.field public static final HND_WHOLEQUERY_FINISH:I = 0x453


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
