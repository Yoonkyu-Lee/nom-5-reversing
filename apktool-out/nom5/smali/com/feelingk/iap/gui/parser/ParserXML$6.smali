.class Lcom/feelingk/iap/gui/parser/ParserXML$6;
.super Ljava/lang/Object;
.source "ParserXML.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/feelingk/iap/gui/parser/ParserXML;->createView(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/feelingk/iap/gui/parser/ParserXML;


# direct methods
.method constructor <init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/feelingk/iap/gui/parser/ParserXML$6;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    .line 513
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 516
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML$6;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/feelingk/iap/gui/parser/ParserXML;->access$6(Lcom/feelingk/iap/gui/parser/ParserXML;Ljava/lang/Boolean;)V

    .line 517
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML$6;->this$0:Lcom/feelingk/iap/gui/parser/ParserXML;

    invoke-static {v0}, Lcom/feelingk/iap/gui/parser/ParserXML;->access$4(Lcom/feelingk/iap/gui/parser/ParserXML;)Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    move-result-object v0

    invoke-interface {v0, p2}, Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;->onUseTCashCheckChanged(Z)V

    .line 518
    return-void
.end method
