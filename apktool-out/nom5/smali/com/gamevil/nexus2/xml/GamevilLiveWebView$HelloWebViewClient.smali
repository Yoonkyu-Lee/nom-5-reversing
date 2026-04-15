.class Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "GamevilLiveWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gamevil/nexus2/xml/GamevilLiveWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HelloWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;


# direct methods
.method private constructor <init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)V
    .locals 0

    .prologue
    .line 72
    iput-object p1, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;)V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;-><init>(Lcom/gamevil/nexus2/xml/GamevilLiveWebView;)V

    return-void
.end method


# virtual methods
.method public onFormResubmission(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V
    .locals 0
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "dontResend"    # Landroid/os/Message;
    .param p3, "resend"    # Landroid/os/Message;

    .prologue
    .line 114
    return-void
.end method

.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->showPrograssBar()V

    .line 108
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    invoke-virtual {v0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->hidePrograssBar()V

    .line 85
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->access$1(Z)V

    .line 86
    invoke-static {}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->access$2()V

    .line 87
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 94
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v0, p0, Lcom/gamevil/nexus2/xml/GamevilLiveWebView$HelloWebViewClient;->this$0:Lcom/gamevil/nexus2/xml/GamevilLiveWebView;

    const-string v1, "file:///android_asset/live.html"

    invoke-virtual {v0, v1}, Lcom/gamevil/nexus2/xml/GamevilLiveWebView;->loadUrl(Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 77
    const/4 v0, 0x1

    return v0
.end method
