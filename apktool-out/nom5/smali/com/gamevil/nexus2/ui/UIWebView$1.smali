.class Lcom/gamevil/nexus2/ui/UIWebView$1;
.super Landroid/webkit/WebViewClient;
.source "UIWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/gamevil/nexus2/ui/UIWebView;->setWebViewClient()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nexus2/ui/UIWebView;


# direct methods
.method constructor <init>(Lcom/gamevil/nexus2/ui/UIWebView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/gamevil/nexus2/ui/UIWebView$1;->this$0:Lcom/gamevil/nexus2/ui/UIWebView;

    .line 24
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 30
    const/4 v0, 0x0

    return v0
.end method
