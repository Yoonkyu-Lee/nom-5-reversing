.class public Lcom/feelingk/iap/gui/data/PurchaseItem;
.super Ljava/lang/Object;
.source "PurchaseItem.java"


# instance fields
.field public bUseTCash:Z

.field public itemName:Ljava/lang/String;

.field public itemPrice:I

.field public itemPurchasePrice:I

.field public itemTCash:I

.field public itemUseDate:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIIZ)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "date"    # Ljava/lang/String;
    .param p3, "price"    # I
    .param p4, "cash"    # I
    .param p5, "purchasePrice"    # I
    .param p6, "useTCash"    # Z

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemName:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemUseDate:Ljava/lang/String;

    .line 16
    iput p3, p0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemPrice:I

    .line 17
    iput p4, p0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemTCash:I

    .line 18
    iput p5, p0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemPurchasePrice:I

    .line 19
    iput-boolean p6, p0, Lcom/feelingk/iap/gui/data/PurchaseItem;->bUseTCash:Z

    .line 20
    return-void
.end method
