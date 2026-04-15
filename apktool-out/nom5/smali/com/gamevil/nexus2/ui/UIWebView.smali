.class public Lcom/gamevil/nexus2/ui/UIWebView;
.super Landroid/webkit/WebView;
.source "UIWebView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 13
    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/UIWebView;->setWebViewClient()Z

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    invoke-virtual {p0}, Lcom/gamevil/nexus2/ui/UIWebView;->setWebViewClient()Z

    .line 19
    return-void
.end method


# virtual methods
.method setWebViewClient()Z
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lcom/gamevil/nexus2/ui/UIWebView$1;

    invoke-direct {v0, p0}, Lcom/gamevil/nexus2/ui/UIWebView$1;-><init>(Lcom/gamevil/nexus2/ui/UIWebView;)V

    invoke-virtual {p0, v0}, Lcom/gamevil/nexus2/ui/UIWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 33
    const/4 v0, 0x1

    return v0
.end method
