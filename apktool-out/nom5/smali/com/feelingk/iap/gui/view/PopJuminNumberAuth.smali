.class public Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;
.super Landroid/app/Dialog;
.source "PopJuminNumberAuth.java"


# instance fields
.field private mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

.field private onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;Z)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "themeSytle"    # I
    .param p3, "cb"    # Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;
    .param p4, "isDeviceTab"    # Z

    .prologue
    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 11
    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 12
    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    .line 16
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p3, v1}, Lcom/feelingk/iap/gui/parser/ParserXML;-><init>(Landroid/content/Context;Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;Z)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 17
    iput-object p3, p0, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    .line 18
    return-void
.end method

.method static synthetic access$0(Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;)Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    return-object v0
.end method


# virtual methods
.method public ClosePopupAuthDialog()V
    .locals 0

    .prologue
    .line 37
    invoke-virtual {p0}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->dismiss()V

    .line 38
    return-void
.end method

.method public InflateView()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 21
    iget-object v0, p0, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->mGUIParser:Lcom/feelingk/iap/gui/parser/ParserXML;

    const-string v1, "/xml_kt_lg/pop_Juminnumber.xml"

    invoke-virtual {v0, v1, v2, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->Start(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->setContentView(Landroid/view/View;)V

    .line 22
    new-instance v0, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth$1;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth$1;-><init>(Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;)V

    invoke-virtual {p0, v0}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 29
    return-void
.end method

.method public ShowPopupAuthDialog()V
    .locals 0

    .prologue
    .line 32
    invoke-virtual {p0}, Lcom/feelingk/iap/gui/view/PopJuminNumberAuth;->show()V

    .line 33
    return-void
.end method
