.class public Lcom/feelingk/iap/gui/parser/ParserXML;
.super Ljava/lang/Object;
.source "ParserXML.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;,
        Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;
    }
.end annotation


# static fields
.field static final TAG:Ljava/lang/String; = "ParserXML"


# instance fields
.field private RES_VERT_FILE_PATH:Ljava/lang/String;

.field private XML_FILE_NAME:Ljava/lang/String;

.field private XML_FILE_PATH:Ljava/lang/String;

.field private XML_FILE_PATH_KTLG:Ljava/lang/String;

.field cancelAuthBtn:Landroid/view/View$OnClickListener;

.field cancelBtn:Landroid/view/View$OnClickListener;

.field private context:Landroid/content/Context;

.field private idg:I

.field private ids:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private layoutStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field private mInfoMessage:Ljava/lang/String;

.field private mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

.field private mJuminPopupMode:Z

.field private mKORCarrier:I

.field private mPopupClickListener:Landroid/view/View$OnClickListener;

.field private m_AccountPriceTextView:Landroid/widget/TextView;

.field private m_JuminText1:Landroid/widget/EditText;

.field private m_JuminText2:Landroid/widget/EditText;

.field okAuthBtn:Landroid/view/View$OnClickListener;

.field okBtn:Landroid/view/View$OnClickListener;

.field okMessageBtn:Landroid/view/View$OnClickListener;

.field private onAuthResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

.field private onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

.field private orientation:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    .line 50
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    .line 53
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    .line 54
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 55
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onAuthResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    .line 57
    iput v2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->orientation:I

    .line 59
    const-string v0, "/res/"

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->RES_VERT_FILE_PATH:Ljava/lang/String;

    .line 60
    const-string v0, "/xml"

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_PATH:Ljava/lang/String;

    .line 61
    const-string v0, "/xml_kt_lg"

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_PATH_KTLG:Ljava/lang/String;

    .line 63
    const-string v0, "purchase"

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_NAME:Ljava/lang/String;

    .line 64
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mInfoMessage:Ljava/lang/String;

    .line 65
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mPopupClickListener:Landroid/view/View$OnClickListener;

    .line 67
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    .line 69
    iput v2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mKORCarrier:I

    .line 70
    iput-boolean v2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mJuminPopupMode:Z

    .line 74
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_AccountPriceTextView:Landroid/widget/TextView;

    .line 75
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_JuminText1:Landroid/widget/EditText;

    .line 76
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_JuminText2:Landroid/widget/EditText;

    .line 1053
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$1;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$1;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->okAuthBtn:Landroid/view/View$OnClickListener;

    .line 1069
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$2;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$2;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->cancelAuthBtn:Landroid/view/View$OnClickListener;

    .line 1085
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$3;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$3;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->okBtn:Landroid/view/View$OnClickListener;

    .line 1107
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$4;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$4;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->cancelBtn:Landroid/view/View$OnClickListener;

    .line 1115
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$5;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$5;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->okMessageBtn:Landroid/view/View$OnClickListener;

    .line 81
    iput-object p1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    .line 82
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    .line 83
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    .line 84
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;Z)V
    .locals 3
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "cb"    # Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;
    .param p3, "bJuminPopupMode"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    .line 50
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    .line 53
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    .line 54
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 55
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onAuthResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    .line 57
    iput v2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->orientation:I

    .line 59
    const-string v0, "/res/"

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->RES_VERT_FILE_PATH:Ljava/lang/String;

    .line 60
    const-string v0, "/xml"

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_PATH:Ljava/lang/String;

    .line 61
    const-string v0, "/xml_kt_lg"

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_PATH_KTLG:Ljava/lang/String;

    .line 63
    const-string v0, "purchase"

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_NAME:Ljava/lang/String;

    .line 64
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mInfoMessage:Ljava/lang/String;

    .line 65
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mPopupClickListener:Landroid/view/View$OnClickListener;

    .line 67
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    .line 69
    iput v2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mKORCarrier:I

    .line 70
    iput-boolean v2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mJuminPopupMode:Z

    .line 74
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_AccountPriceTextView:Landroid/widget/TextView;

    .line 75
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_JuminText1:Landroid/widget/EditText;

    .line 76
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_JuminText2:Landroid/widget/EditText;

    .line 1053
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$1;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$1;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->okAuthBtn:Landroid/view/View$OnClickListener;

    .line 1069
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$2;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$2;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->cancelAuthBtn:Landroid/view/View$OnClickListener;

    .line 1085
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$3;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$3;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->okBtn:Landroid/view/View$OnClickListener;

    .line 1107
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$4;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$4;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->cancelBtn:Landroid/view/View$OnClickListener;

    .line 1115
    new-instance v0, Lcom/feelingk/iap/gui/parser/ParserXML$5;

    invoke-direct {v0, p0}, Lcom/feelingk/iap/gui/parser/ParserXML$5;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->okMessageBtn:Landroid/view/View$OnClickListener;

    .line 87
    iput-object p1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    .line 88
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    .line 89
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    .line 90
    iput-object p2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onAuthResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    .line 91
    iput-boolean p3, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mJuminPopupMode:Z

    .line 92
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .prologue
    .line 97
    invoke-direct {p0, p1}, Lcom/feelingk/iap/gui/parser/ParserXML;-><init>(Landroid/content/Context;)V

    .line 98
    iput-object p2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 99
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;IZ)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;
    .param p3, "isTelecomCarrier"    # I
    .param p4, "isDeviceTab"    # Z

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lcom/feelingk/iap/gui/parser/ParserXML;-><init>(Landroid/content/Context;)V

    .line 103
    iput-object p2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 105
    iput p3, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mKORCarrier:I

    .line 106
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;IZZ)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "callback"    # Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;
    .param p3, "isTelecomCarrier"    # I
    .param p4, "isDeviceTab"    # Z
    .param p5, "bJuminPopupMode"    # Z

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/feelingk/iap/gui/parser/ParserXML;-><init>(Landroid/content/Context;)V

    .line 110
    iput-object p2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 112
    iput p3, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mKORCarrier:I

    .line 113
    iput-boolean p5, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mJuminPopupMode:Z

    .line 114
    return-void
.end method

.method private Start(Ljava/lang/String;)Landroid/view/View;
    .locals 6
    .param p1, "xmlFileFname"    # Ljava/lang/String;

    .prologue
    .line 160
    const/4 v3, 0x0

    .line 163
    .local v3, "parse":Lorg/xmlpull/v1/XmlPullParser;
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    .line 164
    .local v1, "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v3

    .line 166
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 167
    .local v2, "is":Ljava/io/InputStream;
    const-string v5, "utf-8"

    invoke-interface {v3, v2, v5}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 169
    const/4 v4, 0x0

    .line 171
    .local v4, "parsingView":Landroid/view/View;
    iget-boolean v5, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mJuminPopupMode:Z

    if-eqz v5, :cond_0

    .line 172
    invoke-direct {p0, v3}, Lcom/feelingk/iap/gui/parser/ParserXML;->inflateAuthPopup(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;

    move-result-object v4

    :goto_0
    move-object v5, v4

    .line 184
    .end local v1    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v4    # "parsingView":Landroid/view/View;
    :goto_1
    return-object v5

    .line 174
    .restart local v1    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .restart local v2    # "is":Ljava/io/InputStream;
    .restart local v4    # "parsingView":Landroid/view/View;
    :cond_0
    invoke-direct {p0, v3}, Lcom/feelingk/iap/gui/parser/ParserXML;->inflate(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    goto :goto_0

    .line 178
    .end local v1    # "factory":Lorg/xmlpull/v1/XmlPullParserFactory;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v4    # "parsingView":Landroid/view/View;
    :catch_0
    move-exception v5

    move-object v0, v5

    .line 179
    .local v0, "ex":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    .line 184
    .end local v0    # "ex":Lorg/xmlpull/v1/XmlPullParserException;
    :goto_2
    const/4 v5, 0x0

    goto :goto_1

    .line 181
    :catch_1
    move-exception v5

    move-object v0, v5

    .line 182
    .local v0, "ex":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method private UseTCash(Ljava/lang/Boolean;)V
    .locals 7
    .param p1, "flag"    # Ljava/lang/Boolean;

    .prologue
    .line 1126
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1128
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    iget v4, v4, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemPrice:I

    iget-object v5, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    iget v5, v5, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemTCash:I

    sub-int v3, v4, v5

    .line 1130
    .local v3, "total":I
    if-lez v3, :cond_0

    .line 1131
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v4, "###,###,###"

    invoke-direct {v0, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 1132
    .local v0, "df":Ljava/text/DecimalFormat;
    int-to-long v4, v3

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    .line 1134
    .local v1, "dfMoney":Ljava/lang/String;
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_AccountPriceTextView:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "\uc6d0"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1149
    .end local v3    # "total":I
    :goto_0
    return-void

    .line 1137
    .end local v0    # "df":Ljava/text/DecimalFormat;
    .end local v1    # "dfMoney":Ljava/lang/String;
    .restart local v3    # "total":I
    :cond_0
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v4, "###,###,###"

    invoke-direct {v0, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 1138
    .restart local v0    # "df":Ljava/text/DecimalFormat;
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    iget v4, v4, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemPrice:I

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    .line 1139
    .restart local v1    # "dfMoney":Ljava/lang/String;
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    iget v4, v4, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemTCash:I

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    .line 1141
    .local v2, "dfPoint":Ljava/lang/String;
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_AccountPriceTextView:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "\uc6d0-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "P=0\uc6d0"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1145
    .end local v0    # "df":Ljava/text/DecimalFormat;
    .end local v1    # "dfMoney":Ljava/lang/String;
    .end local v2    # "dfPoint":Ljava/lang/String;
    .end local v3    # "total":I
    :cond_1
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v4, "###,###,###"

    invoke-direct {v0, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 1146
    .restart local v0    # "df":Ljava/text/DecimalFormat;
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    iget v4, v4, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemPrice:I

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Ljava/text/DecimalFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    .line 1147
    .restart local v1    # "dfMoney":Ljava/lang/String;
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_AccountPriceTextView:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "\uc6d0"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/feelingk/iap/gui/parser/ParserXML;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_JuminText1:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$1(Lcom/feelingk/iap/gui/parser/ParserXML;)Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->m_JuminText2:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$2(Lcom/feelingk/iap/gui/parser/ParserXML;)Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onAuthResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserAuthResultCallback;

    return-object v0
.end method

.method static synthetic access$3(Lcom/feelingk/iap/gui/parser/ParserXML;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$4(Lcom/feelingk/iap/gui/parser/ParserXML;)Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    return-object v0
.end method

.method static synthetic access$5(Lcom/feelingk/iap/gui/parser/ParserXML;)Landroid/view/View$OnClickListener;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mPopupClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method static synthetic access$6(Lcom/feelingk/iap/gui/parser/ParserXML;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 1124
    invoke-direct {p0, p1}, Lcom/feelingk/iap/gui/parser/ParserXML;->UseTCash(Ljava/lang/Boolean;)V

    return-void
.end method

.method private createView(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;
    .locals 46
    .param p1, "parse"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 244
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v26

    .line 245
    .local v26, "name":Ljava/lang/String;
    const/16 v33, 0x0

    .line 246
    .local v33, "result":Landroid/view/View;
    invoke-static/range {p1 .. p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v5

    .line 248
    .local v5, "atts":Landroid/util/AttributeSet;
    const-string v43, "LinearLayout"

    move-object/from16 v0, v26

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_0

    .line 249
    new-instance v33, Landroid/widget/LinearLayout;

    .end local v33    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    move-object/from16 v43, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v43

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 275
    .restart local v33    # "result":Landroid/view/View;
    :goto_0
    if-nez v33, :cond_5

    .line 276
    const/16 v43, 0x0

    .line 573
    .end local p1    # "parse":Lorg/xmlpull/v1/XmlPullParser;
    :goto_1
    return-object v43

    .line 256
    .restart local p1    # "parse":Lorg/xmlpull/v1/XmlPullParser;
    :cond_0
    const-string v43, "TextView"

    move-object/from16 v0, v26

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_1

    .line 257
    new-instance v33, Landroid/widget/TextView;

    .end local v33    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    move-object/from16 v43, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v43

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .restart local v33    # "result":Landroid/view/View;
    goto :goto_0

    .line 259
    :cond_1
    const-string v43, "ImageView"

    move-object/from16 v0, v26

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_2

    .line 260
    new-instance v33, Landroid/widget/ImageView;

    .end local v33    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    move-object/from16 v43, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v43

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .restart local v33    # "result":Landroid/view/View;
    goto :goto_0

    .line 262
    :cond_2
    const-string v43, "Button"

    move-object/from16 v0, v26

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_3

    .line 263
    new-instance v33, Landroid/widget/Button;

    .end local v33    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    move-object/from16 v43, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v43

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .restart local v33    # "result":Landroid/view/View;
    goto :goto_0

    .line 265
    :cond_3
    const-string v43, "CheckBox"

    move-object/from16 v0, v26

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_4

    .line 266
    new-instance v33, Landroid/widget/CheckBox;

    .end local v33    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    move-object/from16 v43, v0

    move-object/from16 v0, v33

    move-object/from16 v1, v43

    invoke-direct {v0, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .restart local v33    # "result":Landroid/view/View;
    goto :goto_0

    .line 272
    :cond_4
    new-instance v43, Ljava/lang/StringBuilder;

    const-string v44, "# UnSupported tag:"

    invoke-direct/range {v43 .. v44}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v43

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v43

    invoke-virtual/range {v43 .. v43}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v43

    invoke-static/range {v43 .. v43}, Ljunit/framework/Assert;->fail(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 288
    :cond_5
    move-object/from16 v0, v33

    instance-of v0, v0, Landroid/widget/LinearLayout;

    move/from16 v43, v0

    if-eqz v43, :cond_b

    .line 289
    move-object/from16 v0, v33

    check-cast v0, Landroid/widget/LinearLayout;

    move-object/from16 v24, v0

    .line 290
    .local v24, "ll":Landroid/widget/LinearLayout;
    const-string v43, "a:orientation"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 292
    .local v30, "orient":Ljava/lang/String;
    if-eqz v30, :cond_6

    .line 293
    const-string v43, "horizontal"

    move-object/from16 v0, v30

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_14

    .line 294
    const/16 v43, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 300
    :cond_6
    :goto_2
    const-string v43, "a:background"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 301
    .local v19, "image":Ljava/lang/String;
    if-eqz v19, :cond_7

    .line 302
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v43

    new-instance v44, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v45

    invoke-static/range {v45 .. v45}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v44

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    const-string v45, ".png"

    invoke-virtual/range {v44 .. v45}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v44

    invoke-virtual/range {v43 .. v44}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v22

    .line 303
    .local v22, "is":Ljava/io/InputStream;
    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v43

    move-object/from16 v0, v24

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 307
    .end local v22    # "is":Ljava/io/InputStream;
    :cond_7
    const-string v43, "a:backgroudcolor"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 308
    .local v20, "imageColor":Ljava/lang/String;
    if-eqz v20, :cond_8

    .line 311
    const/high16 v43, -0x10000

    move-object/from16 v0, v24

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 315
    :cond_8
    const-string v43, "a:gravity"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 316
    .local v18, "gravity":Ljava/lang/String;
    if-eqz v18, :cond_9

    .line 317
    const-string v43, "center"

    move-object/from16 v0, v18

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_15

    .line 318
    const/16 v43, 0x11

    move-object/from16 v0, v24

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 324
    :cond_9
    :goto_3
    const-string v43, "a:padding"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 325
    .local v32, "padding":Ljava/lang/String;
    if-eqz v32, :cond_a

    .line 326
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lcom/feelingk/iap/gui/parser/ParserXML;->readDPSize(Ljava/lang/String;)I

    move-result v34

    .line 327
    .local v34, "size":I
    move-object/from16 v0, v24

    move/from16 v1, v34

    move/from16 v2, v34

    move/from16 v3, v34

    move/from16 v4, v34

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 331
    .end local v34    # "size":I
    :cond_a
    const-string v43, "a:focusableInTouchMode"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    .line 332
    .local v41, "touchMode":Ljava/lang/String;
    if-eqz v41, :cond_b

    .line 333
    const/16 v43, 0x1

    move-object/from16 v0, v24

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setFocusableInTouchMode(Z)V

    .line 358
    .end local v18    # "gravity":Ljava/lang/String;
    .end local v19    # "image":Ljava/lang/String;
    .end local v20    # "imageColor":Ljava/lang/String;
    .end local v24    # "ll":Landroid/widget/LinearLayout;
    .end local v30    # "orient":Ljava/lang/String;
    .end local v32    # "padding":Ljava/lang/String;
    .end local v41    # "touchMode":Ljava/lang/String;
    :cond_b
    move-object/from16 v0, v33

    instance-of v0, v0, Landroid/widget/TextView;

    move/from16 v43, v0

    if-eqz v43, :cond_10

    .line 359
    move-object/from16 v0, v33

    check-cast v0, Landroid/widget/TextView;

    move-object/from16 v42, v0

    .line 361
    .local v42, "tv":Landroid/widget/TextView;
    const-string v43, "a:id"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    .line 362
    .local v39, "textID":Ljava/lang/String;
    const-string v43, "a:text"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    .line 363
    .local v36, "text":Ljava/lang/String;
    const-string v43, "a:textSize"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    .line 364
    .local v40, "textSize":Ljava/lang/String;
    const-string v43, "a:textColor"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    .line 365
    .local v37, "textColor":Ljava/lang/String;
    const-string v43, "a:gravity"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v38

    .line 367
    .local v38, "textGravity":Ljava/lang/String;
    if-eqz v36, :cond_c

    .line 368
    const-string v43, "\\n"

    const-string v44, "\n"

    move-object/from16 v0, v36

    move-object/from16 v1, v43

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v36

    .line 369
    move-object/from16 v0, v42

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 371
    :cond_c
    if-eqz v40, :cond_d

    .line 372
    move-object/from16 v0, p0

    move-object/from16 v1, v40

    invoke-direct {v0, v1}, Lcom/feelingk/iap/gui/parser/ParserXML;->readFontSize(Ljava/lang/String;)I

    move-result v43

    move/from16 v0, v43

    int-to-float v0, v0

    move/from16 v43, v0

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setTextSize(F)V

    .line 373
    :cond_d
    if-eqz v37, :cond_e

    .line 374
    invoke-static/range {v37 .. v37}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v43

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setTextColor(I)V

    .line 375
    :cond_e
    if-eqz v39, :cond_f

    .line 377
    const-string v43, "ItemName"

    move-object/from16 v0, v39

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_16

    .line 378
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    move-object/from16 v43, v0

    move-object/from16 v0, v43

    iget-object v0, v0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemName:Ljava/lang/String;

    move-object/from16 v43, v0

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 396
    :cond_f
    :goto_4
    if-eqz v38, :cond_1c

    .line 397
    const/16 v43, 0x11

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setGravity(I)V

    .line 400
    :goto_5
    const/16 v43, 0x0

    const v44, 0x3f933333    # 1.15f

    invoke-virtual/range {v42 .. v44}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 404
    .end local v36    # "text":Ljava/lang/String;
    .end local v37    # "textColor":Ljava/lang/String;
    .end local v38    # "textGravity":Ljava/lang/String;
    .end local v39    # "textID":Ljava/lang/String;
    .end local v40    # "textSize":Ljava/lang/String;
    .end local v42    # "tv":Landroid/widget/TextView;
    :cond_10
    move-object/from16 v0, v33

    instance-of v0, v0, Landroid/widget/ImageView;

    move/from16 v43, v0

    if-eqz v43, :cond_11

    .line 406
    move-object/from16 v0, v33

    check-cast v0, Landroid/widget/ImageView;

    move-object/from16 v21, v0

    .line 407
    .local v21, "imageview":Landroid/widget/ImageView;
    const-string v43, "a:background"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 408
    .restart local v19    # "image":Ljava/lang/String;
    if-eqz v19, :cond_11

    .line 409
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v43

    new-instance v44, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v45

    invoke-static/range {v45 .. v45}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v44

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    const-string v45, ".png"

    invoke-virtual/range {v44 .. v45}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v44

    invoke-virtual/range {v43 .. v44}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v22

    .line 410
    .restart local v22    # "is":Ljava/io/InputStream;
    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v25

    .line 411
    .local v25, "mDrawable":Landroid/graphics/drawable/Drawable;
    move-object/from16 v0, v21

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 416
    .end local v19    # "image":Ljava/lang/String;
    .end local v21    # "imageview":Landroid/widget/ImageView;
    .end local v22    # "is":Ljava/io/InputStream;
    .end local v25    # "mDrawable":Landroid/graphics/drawable/Drawable;
    :cond_11
    move-object/from16 v0, v33

    instance-of v0, v0, Landroid/widget/Button;

    move/from16 v43, v0

    if-eqz v43, :cond_12

    .line 419
    const-string v43, "a:offImage"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 420
    .local v27, "offimage":Ljava/lang/String;
    const-string v43, "a:onImage"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    .line 422
    .local v29, "onimage":Ljava/lang/String;
    if-eqz v27, :cond_1f

    .line 423
    move-object/from16 v0, v33

    check-cast v0, Landroid/widget/Button;

    move-object v11, v0

    .line 426
    .local v11, "btn":Landroid/widget/Button;
    const/4 v9, 0x0

    .local v9, "btOn":Landroid/graphics/drawable/Drawable;
    const/4 v10, 0x0

    .line 428
    .local v10, "btOver":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v43

    new-instance v44, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v45

    invoke-static/range {v45 .. v45}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v44

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    const-string v45, ".png"

    invoke-virtual/range {v44 .. v45}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v44

    invoke-virtual/range {v43 .. v44}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v23

    .line 429
    .local v23, "isStream":Ljava/io/InputStream;
    move-object/from16 v0, v23

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 431
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v43

    new-instance v44, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v45

    invoke-static/range {v45 .. v45}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v44

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    const-string v45, ".png"

    invoke-virtual/range {v44 .. v45}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v44

    invoke-virtual/range {v43 .. v44}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v23

    .line 432
    move-object/from16 v0, v23

    move-object/from16 v1, v29

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    .line 434
    new-instance v16, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 435
    .local v16, "drawables":Landroid/graphics/drawable/StateListDrawable;
    const v35, 0x10100a7

    .line 436
    .local v35, "statePressed":I
    const/16 v43, 0x1

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    const/16 v44, 0x0

    aput v35, v43, v44

    move-object/from16 v0, v16

    move-object/from16 v1, v43

    move-object v2, v10

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 437
    const/16 v43, 0x0

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v43

    move-object v2, v9

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 438
    move-object v0, v11

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 441
    const-string v43, "btn_buy_sel_h"

    move-object/from16 v0, v29

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_1d

    .line 442
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->okBtn:Landroid/view/View$OnClickListener;

    move-object/from16 v43, v0

    move-object v0, v11

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 570
    .end local v9    # "btOn":Landroid/graphics/drawable/Drawable;
    .end local v10    # "btOver":Landroid/graphics/drawable/Drawable;
    .end local v11    # "btn":Landroid/widget/Button;
    .end local v16    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    .end local v23    # "isStream":Ljava/io/InputStream;
    .end local v27    # "offimage":Ljava/lang/String;
    .end local v29    # "onimage":Ljava/lang/String;
    .end local v35    # "statePressed":I
    :cond_12
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    move-object/from16 v43, v0

    invoke-virtual/range {v43 .. v43}, Ljava/util/Stack;->size()I

    move-result v43

    if-lez v43, :cond_13

    .line 571
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    move-object/from16 v43, v0

    invoke-virtual/range {v43 .. v43}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "parse":Lorg/xmlpull/v1/XmlPullParser;
    check-cast p1, Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->loadLayoutParams(Landroid/util/AttributeSet;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v43

    move-object/from16 v0, v33

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_13
    move-object/from16 v43, v33

    .line 573
    goto/16 :goto_1

    .line 295
    .restart local v24    # "ll":Landroid/widget/LinearLayout;
    .restart local v30    # "orient":Ljava/lang/String;
    .restart local p1    # "parse":Lorg/xmlpull/v1/XmlPullParser;
    :cond_14
    const-string v43, "vertical"

    move-object/from16 v0, v30

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_6

    .line 296
    const/16 v43, 0x1

    move-object/from16 v0, v24

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    goto/16 :goto_2

    .line 320
    .restart local v18    # "gravity":Ljava/lang/String;
    .restart local v19    # "image":Ljava/lang/String;
    .restart local v20    # "imageColor":Ljava/lang/String;
    :cond_15
    const/16 v43, 0x5

    move-object/from16 v0, v24

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto/16 :goto_3

    .line 379
    .end local v18    # "gravity":Ljava/lang/String;
    .end local v19    # "image":Ljava/lang/String;
    .end local v20    # "imageColor":Ljava/lang/String;
    .end local v24    # "ll":Landroid/widget/LinearLayout;
    .end local v30    # "orient":Ljava/lang/String;
    .restart local v36    # "text":Ljava/lang/String;
    .restart local v37    # "textColor":Ljava/lang/String;
    .restart local v38    # "textGravity":Ljava/lang/String;
    .restart local v39    # "textID":Ljava/lang/String;
    .restart local v40    # "textSize":Ljava/lang/String;
    .restart local v42    # "tv":Landroid/widget/TextView;
    :cond_16
    const-string v43, "ItemUseDate"

    move-object/from16 v0, v39

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_17

    .line 380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    move-object/from16 v43, v0

    move-object/from16 v0, v43

    iget-object v0, v0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemUseDate:Ljava/lang/String;

    move-object/from16 v43, v0

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 381
    :cond_17
    const-string v43, "ItemPrice"

    move-object/from16 v0, v39

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_18

    .line 382
    new-instance v43, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    move-object/from16 v44, v0

    move-object/from16 v0, v44

    iget v0, v0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemPrice:I

    move/from16 v44, v0

    invoke-static/range {v44 .. v44}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v44

    invoke-direct/range {v43 .. v44}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v44, "\uc6d0"

    invoke-virtual/range {v43 .. v44}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v43

    invoke-virtual/range {v43 .. v43}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v43

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 383
    :cond_18
    const-string v43, "ItemCash"

    move-object/from16 v0, v39

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_19

    .line 384
    new-instance v43, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    move-object/from16 v44, v0

    move-object/from16 v0, v44

    iget v0, v0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemTCash:I

    move/from16 v44, v0

    invoke-static/range {v44 .. v44}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v44

    invoke-direct/range {v43 .. v44}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v44, "P"

    invoke-virtual/range {v43 .. v44}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v43

    invoke-virtual/range {v43 .. v43}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v43

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 385
    :cond_19
    const-string v43, "commonMessage"

    move-object/from16 v0, v39

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_1a

    .line 386
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->mInfoMessage:Ljava/lang/String;

    move-object/from16 v43, v0

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 387
    :cond_1a
    const-string v43, "Version"

    move-object/from16 v0, v39

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_1b

    .line 388
    const-string v43, "V 11.03.22"

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 390
    :cond_1b
    move-object/from16 v0, v42

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/feelingk/iap/gui/parser/ParserXML;->m_AccountPriceTextView:Landroid/widget/TextView;

    .line 391
    new-instance v43, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    move-object/from16 v44, v0

    move-object/from16 v0, v44

    iget v0, v0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemPurchasePrice:I

    move/from16 v44, v0

    invoke-static/range {v44 .. v44}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v44

    invoke-direct/range {v43 .. v44}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v44, "\uc6d0"

    invoke-virtual/range {v43 .. v44}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v43

    invoke-virtual/range {v43 .. v43}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v43

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 399
    :cond_1c
    const/16 v43, 0x13

    invoke-virtual/range {v42 .. v43}, Landroid/widget/TextView;->setGravity(I)V

    goto/16 :goto_5

    .line 443
    .end local v36    # "text":Ljava/lang/String;
    .end local v37    # "textColor":Ljava/lang/String;
    .end local v38    # "textGravity":Ljava/lang/String;
    .end local v39    # "textID":Ljava/lang/String;
    .end local v40    # "textSize":Ljava/lang/String;
    .end local v42    # "tv":Landroid/widget/TextView;
    .restart local v9    # "btOn":Landroid/graphics/drawable/Drawable;
    .restart local v10    # "btOver":Landroid/graphics/drawable/Drawable;
    .restart local v11    # "btn":Landroid/widget/Button;
    .restart local v16    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    .restart local v23    # "isStream":Ljava/io/InputStream;
    .restart local v27    # "offimage":Ljava/lang/String;
    .restart local v29    # "onimage":Ljava/lang/String;
    .restart local v35    # "statePressed":I
    :cond_1d
    const-string v43, "pop_btn_sel_ok"

    move-object/from16 v0, v29

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-eqz v43, :cond_1e

    .line 444
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->okMessageBtn:Landroid/view/View$OnClickListener;

    move-object/from16 v43, v0

    move-object v0, v11

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_6

    .line 446
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->cancelBtn:Landroid/view/View$OnClickListener;

    move-object/from16 v43, v0

    move-object v0, v11

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_6

    .line 449
    .end local v9    # "btOn":Landroid/graphics/drawable/Drawable;
    .end local v10    # "btOver":Landroid/graphics/drawable/Drawable;
    .end local v11    # "btn":Landroid/widget/Button;
    .end local v16    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    .end local v23    # "isStream":Ljava/io/InputStream;
    .end local v35    # "statePressed":I
    :cond_1f
    move-object/from16 v0, v33

    check-cast v0, Landroid/widget/CheckBox;

    move-object v14, v0

    .line 460
    .local v14, "checkbtn":Landroid/widget/CheckBox;
    const-string v12, "btn_check_ok_nor"

    .line 461
    .local v12, "checkImage":Ljava/lang/String;
    const-string v13, "btn_check_ok_sel"

    .line 462
    .local v13, "checkPImage":Ljava/lang/String;
    const-string v31, "btn_check_no_sel"

    .line 463
    .local v31, "overImage":Ljava/lang/String;
    const-string v15, "btn_check_dim"

    .line 466
    .local v15, "dimImage":Ljava/lang/String;
    const/4 v9, 0x0

    .restart local v9    # "btOn":Landroid/graphics/drawable/Drawable;
    const/4 v10, 0x0

    .restart local v10    # "btOver":Landroid/graphics/drawable/Drawable;
    const/4 v6, 0x0

    .local v6, "btCheck":Landroid/graphics/drawable/Drawable;
    const/4 v7, 0x0

    .local v7, "btCheckP":Landroid/graphics/drawable/Drawable;
    const/4 v8, 0x0

    .line 468
    .local v8, "btDis":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v43

    new-instance v44, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v45

    invoke-static/range {v45 .. v45}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v44

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    const-string v45, ".png"

    invoke-virtual/range {v44 .. v45}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v44

    invoke-virtual/range {v43 .. v44}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v28

    .line 469
    .local v28, "onStream":Ljava/io/InputStream;
    invoke-static/range {v28 .. v29}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    .line 472
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v43

    new-instance v44, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v45

    invoke-static/range {v45 .. v45}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v44

    move-object v1, v12

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    const-string v45, ".png"

    invoke-virtual/range {v44 .. v45}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v44

    invoke-virtual/range {v43 .. v44}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v28

    .line 473
    move-object/from16 v0, v28

    move-object v1, v12

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 476
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v43

    new-instance v44, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v45

    invoke-static/range {v45 .. v45}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v44

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    const-string v45, ".png"

    invoke-virtual/range {v44 .. v45}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v44

    invoke-virtual/range {v43 .. v44}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v28

    .line 477
    move-object/from16 v0, v28

    move-object/from16 v1, v31

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    .line 480
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v43

    new-instance v44, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v45

    invoke-static/range {v45 .. v45}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v44

    move-object v1, v13

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    const-string v45, ".png"

    invoke-virtual/range {v44 .. v45}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v44

    invoke-virtual/range {v43 .. v44}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v28

    .line 481
    move-object/from16 v0, v28

    move-object v1, v13

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 484
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v43

    new-instance v44, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v45

    invoke-static/range {v45 .. v45}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v45

    invoke-direct/range {v44 .. v45}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v44

    move-object v1, v15

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    const-string v45, ".png"

    invoke-virtual/range {v44 .. v45}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v44

    invoke-virtual/range {v44 .. v44}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v44

    invoke-virtual/range {v43 .. v44}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v28

    .line 485
    move-object/from16 v0, v28

    move-object v1, v15

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 487
    new-instance v16, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct/range {v16 .. v16}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 488
    .restart local v16    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    new-instance v17, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct/range {v17 .. v17}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 490
    .local v17, "drawables2":Landroid/graphics/drawable/StateListDrawable;
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_0

    move-object/from16 v0, v16

    move-object/from16 v1, v43

    move-object v2, v8

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 491
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_1

    move-object/from16 v0, v16

    move-object/from16 v1, v43

    move-object v2, v10

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 492
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_2

    move-object/from16 v0, v16

    move-object/from16 v1, v43

    move-object v2, v7

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 493
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_3

    move-object/from16 v0, v16

    move-object/from16 v1, v43

    move-object v2, v9

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 494
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_4

    move-object/from16 v0, v16

    move-object/from16 v1, v43

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 496
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_5

    const/16 v44, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v43

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 497
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_6

    const/16 v44, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v43

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 498
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_7

    const/16 v44, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v43

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 499
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_8

    const/16 v44, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v43

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 500
    const/16 v43, 0x2

    move/from16 v0, v43

    new-array v0, v0, [I

    move-object/from16 v43, v0

    fill-array-data v43, :array_9

    const/16 v44, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v43

    move-object/from16 v2, v44

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 502
    move-object v0, v14

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 503
    move-object v0, v14

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 505
    const/16 v43, 0x0

    move-object v0, v14

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 508
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    move-object/from16 v43, v0

    move-object/from16 v0, v43

    iget v0, v0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemTCash:I

    move/from16 v43, v0

    if-eqz v43, :cond_20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    move-object/from16 v43, v0

    move-object/from16 v0, v43

    iget v0, v0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemTCash:I

    move/from16 v43, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    move-object/from16 v44, v0

    move-object/from16 v0, v44

    iget v0, v0, Lcom/feelingk/iap/gui/data/PurchaseItem;->itemPrice:I

    move/from16 v44, v0

    sub-int v43, v43, v44

    if-ltz v43, :cond_20

    .line 509
    const/16 v43, 0x1

    move-object v0, v14

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 513
    :goto_7
    new-instance v43, Lcom/feelingk/iap/gui/parser/ParserXML$6;

    move-object/from16 v0, v43

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/feelingk/iap/gui/parser/ParserXML$6;-><init>(Lcom/feelingk/iap/gui/parser/ParserXML;)V

    move-object v0, v14

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto/16 :goto_6

    .line 511
    :cond_20
    const/16 v43, 0x0

    move-object v0, v14

    move/from16 v1, v43

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setEnabled(Z)V

    goto :goto_7

    .line 490
    :array_0
    .array-data 4
        -0x101009e
        -0x101009c
    .end array-data

    .line 491
    :array_1
    .array-data 4
        -0x10100a0
        0x10100a7
    .end array-data

    .line 492
    :array_2
    .array-data 4
        0x10100a0
        0x10100a7
    .end array-data

    .line 493
    :array_3
    .array-data 4
        -0x10100a0
        -0x101009c
    .end array-data

    .line 494
    :array_4
    .array-data 4
        0x10100a0
        -0x101009c
    .end array-data

    .line 496
    :array_5
    .array-data 4
        -0x101009e
        -0x101009c
    .end array-data

    .line 497
    :array_6
    .array-data 4
        -0x10100a0
        0x10100a7
    .end array-data

    .line 498
    :array_7
    .array-data 4
        0x10100a0
        0x10100a7
    .end array-data

    .line 499
    :array_8
    .array-data 4
        -0x10100a0
        -0x101009c
    .end array-data

    .line 500
    :array_9
    .array-data 4
        0x10100a0
        -0x101009c
    .end array-data
.end method

.method private createViewAuthPopup(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;
    .locals 40
    .param p1, "parse"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 629
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v20

    .line 630
    .local v20, "name":Ljava/lang/String;
    const/16 v27, 0x0

    .line 631
    .local v27, "result":Landroid/view/View;
    invoke-static/range {p1 .. p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v5

    .line 633
    .local v5, "atts":Landroid/util/AttributeSet;
    const-string v37, "LinearLayout"

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_0

    .line 634
    new-instance v27, Landroid/widget/LinearLayout;

    .end local v27    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    move-object/from16 v37, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v37

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 649
    .restart local v27    # "result":Landroid/view/View;
    :goto_0
    if-nez v27, :cond_4

    .line 650
    const/16 v37, 0x0

    .line 799
    .end local p1    # "parse":Lorg/xmlpull/v1/XmlPullParser;
    :goto_1
    return-object v37

    .line 636
    .restart local p1    # "parse":Lorg/xmlpull/v1/XmlPullParser;
    :cond_0
    const-string v37, "TextView"

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_1

    .line 637
    new-instance v27, Landroid/widget/TextView;

    .end local v27    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    move-object/from16 v37, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v37

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .restart local v27    # "result":Landroid/view/View;
    goto :goto_0

    .line 639
    :cond_1
    const-string v37, "Button"

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_2

    .line 640
    new-instance v27, Landroid/widget/Button;

    .end local v27    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    move-object/from16 v37, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v37

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .restart local v27    # "result":Landroid/view/View;
    goto :goto_0

    .line 642
    :cond_2
    const-string v37, "EditText"

    move-object/from16 v0, v20

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_3

    .line 643
    new-instance v27, Landroid/widget/EditText;

    .end local v27    # "result":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    move-object/from16 v37, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v37

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .restart local v27    # "result":Landroid/view/View;
    goto :goto_0

    .line 646
    :cond_3
    new-instance v37, Ljava/lang/StringBuilder;

    const-string v38, "# UnSupported tag:"

    invoke-direct/range {v37 .. v38}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v37

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-static/range {v37 .. v37}, Ljunit/framework/Assert;->fail(Ljava/lang/String;)V

    goto :goto_0

    .line 652
    :cond_4
    move-object/from16 v0, v27

    instance-of v0, v0, Landroid/widget/LinearLayout;

    move/from16 v37, v0

    if-eqz v37, :cond_a

    .line 653
    move-object/from16 v0, v27

    check-cast v0, Landroid/widget/LinearLayout;

    move-object/from16 v18, v0

    .line 654
    .local v18, "ll":Landroid/widget/LinearLayout;
    const-string v37, "a:orientation"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    .line 656
    .local v23, "orient":Ljava/lang/String;
    if-eqz v23, :cond_5

    .line 657
    const-string v37, "horizontal"

    move-object/from16 v0, v23

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_15

    .line 658
    const/16 v37, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 664
    :cond_5
    :goto_2
    const-string v37, "a:background"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 665
    .local v14, "image":Ljava/lang/String;
    if-eqz v14, :cond_6

    .line 666
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v37

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v39

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v38

    move-object v1, v14

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    const-string v39, ".png"

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v16

    .line 667
    .local v16, "is":Ljava/io/InputStream;
    move-object/from16 v0, v16

    move-object v1, v14

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v37

    move-object/from16 v0, v18

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 671
    .end local v16    # "is":Ljava/io/InputStream;
    :cond_6
    const-string v37, "a:backgroudcolor"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 672
    .local v15, "imageColor":Ljava/lang/String;
    if-eqz v15, :cond_7

    .line 675
    const/high16 v37, -0x10000

    move-object/from16 v0, v18

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 679
    :cond_7
    const-string v37, "a:gravity"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 680
    .local v12, "gravity":Ljava/lang/String;
    if-eqz v12, :cond_8

    .line 681
    const-string v37, "center"

    move-object v0, v12

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_16

    .line 682
    const/16 v37, 0x11

    move-object/from16 v0, v18

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 688
    :cond_8
    :goto_3
    const-string v37, "a:padding"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 689
    .local v24, "padding":Ljava/lang/String;
    if-eqz v24, :cond_9

    .line 690
    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lcom/feelingk/iap/gui/parser/ParserXML;->readDPSize(Ljava/lang/String;)I

    move-result v28

    .line 691
    .local v28, "size":I
    move-object/from16 v0, v18

    move/from16 v1, v28

    move/from16 v2, v28

    move/from16 v3, v28

    move/from16 v4, v28

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 695
    .end local v28    # "size":I
    :cond_9
    const-string v37, "a:focusableInTouchMode"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    .line 696
    .local v35, "touchMode":Ljava/lang/String;
    if-eqz v35, :cond_a

    .line 697
    const/16 v37, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setFocusableInTouchMode(Z)V

    .line 703
    .end local v12    # "gravity":Ljava/lang/String;
    .end local v14    # "image":Ljava/lang/String;
    .end local v15    # "imageColor":Ljava/lang/String;
    .end local v18    # "ll":Landroid/widget/LinearLayout;
    .end local v23    # "orient":Ljava/lang/String;
    .end local v24    # "padding":Ljava/lang/String;
    .end local v35    # "touchMode":Ljava/lang/String;
    :cond_a
    move-object/from16 v0, v27

    instance-of v0, v0, Landroid/widget/TextView;

    move/from16 v37, v0

    if-eqz v37, :cond_f

    .line 704
    move-object/from16 v0, v27

    check-cast v0, Landroid/widget/TextView;

    move-object/from16 v36, v0

    .line 706
    .local v36, "tv":Landroid/widget/TextView;
    const-string v37, "a:id"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    .line 707
    .local v33, "textID":Ljava/lang/String;
    const-string v37, "a:text"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 708
    .local v30, "text":Ljava/lang/String;
    const-string v37, "a:textSize"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 709
    .local v34, "textSize":Ljava/lang/String;
    const-string v37, "a:textColor"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 710
    .local v31, "textColor":Ljava/lang/String;
    const-string v37, "a:gravity"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 712
    .local v32, "textGravity":Ljava/lang/String;
    if-eqz v30, :cond_b

    .line 713
    const-string v37, "\\n"

    const-string v38, "\n"

    move-object/from16 v0, v30

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v30

    .line 714
    move-object/from16 v0, v36

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 716
    :cond_b
    if-eqz v34, :cond_c

    .line 717
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-direct {v0, v1}, Lcom/feelingk/iap/gui/parser/ParserXML;->readFontSize(Ljava/lang/String;)I

    move-result v37

    move/from16 v0, v37

    int-to-float v0, v0

    move/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Landroid/widget/TextView;->setTextSize(F)V

    .line 718
    :cond_c
    if-eqz v31, :cond_d

    .line 719
    invoke-static/range {v31 .. v31}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v37

    invoke-virtual/range {v36 .. v37}, Landroid/widget/TextView;->setTextColor(I)V

    .line 720
    :cond_d
    if-eqz v33, :cond_e

    .line 721
    const-string v37, "Version"

    move-object/from16 v0, v33

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_e

    .line 722
    const-string v37, "V 11.03.22"

    invoke-virtual/range {v36 .. v37}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 726
    :cond_e
    if-eqz v32, :cond_17

    .line 727
    const/16 v37, 0x11

    invoke-virtual/range {v36 .. v37}, Landroid/widget/TextView;->setGravity(I)V

    .line 730
    :goto_4
    const/16 v37, 0x0

    const v38, 0x3f933333    # 1.15f

    invoke-virtual/range {v36 .. v38}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 734
    .end local v30    # "text":Ljava/lang/String;
    .end local v31    # "textColor":Ljava/lang/String;
    .end local v32    # "textGravity":Ljava/lang/String;
    .end local v33    # "textID":Ljava/lang/String;
    .end local v34    # "textSize":Ljava/lang/String;
    .end local v36    # "tv":Landroid/widget/TextView;
    :cond_f
    move-object/from16 v0, v27

    instance-of v0, v0, Landroid/widget/Button;

    move/from16 v37, v0

    if-eqz v37, :cond_10

    .line 737
    const-string v37, "a:offImage"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 738
    .local v21, "offimage":Ljava/lang/String;
    const-string v37, "a:onImage"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 740
    .local v22, "onimage":Ljava/lang/String;
    move-object/from16 v0, v27

    check-cast v0, Landroid/widget/Button;

    move-object v8, v0

    .line 743
    .local v8, "btn":Landroid/widget/Button;
    const/4 v6, 0x0

    .local v6, "btOn":Landroid/graphics/drawable/Drawable;
    const/4 v7, 0x0

    .line 745
    .local v7, "btOver":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v37

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v39

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v38

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    const-string v39, ".png"

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v17

    .line 746
    .local v17, "isStream":Ljava/io/InputStream;
    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 748
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v37

    new-instance v38, Ljava/lang/StringBuilder;

    invoke-direct/range {p0 .. p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourcePath()Ljava/lang/String;

    move-result-object v39

    invoke-static/range {v39 .. v39}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v39

    invoke-direct/range {v38 .. v39}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v38

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    const-string v39, ".png"

    invoke-virtual/range {v38 .. v39}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v38

    invoke-virtual/range {v38 .. v38}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    invoke-virtual/range {v37 .. v38}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v17

    .line 749
    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-static {v0, v1}, Landroid/graphics/drawable/Drawable;->createFromStream(Ljava/io/InputStream;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 751
    new-instance v9, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v9}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 752
    .local v9, "drawables":Landroid/graphics/drawable/StateListDrawable;
    const v29, 0x10100a7

    .line 753
    .local v29, "statePressed":I
    const/16 v37, 0x1

    move/from16 v0, v37

    new-array v0, v0, [I

    move-object/from16 v37, v0

    const/16 v38, 0x0

    aput v29, v37, v38

    move-object v0, v9

    move-object/from16 v1, v37

    move-object v2, v7

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 754
    const/16 v37, 0x0

    move/from16 v0, v37

    new-array v0, v0, [I

    move-object/from16 v37, v0

    move-object v0, v9

    move-object/from16 v1, v37

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 755
    invoke-virtual {v8, v9}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 758
    const-string v37, "btn_con_sel"

    move-object/from16 v0, v22

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_18

    .line 759
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->okAuthBtn:Landroid/view/View$OnClickListener;

    move-object/from16 v37, v0

    move-object v0, v8

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 767
    .end local v6    # "btOn":Landroid/graphics/drawable/Drawable;
    .end local v7    # "btOver":Landroid/graphics/drawable/Drawable;
    .end local v8    # "btn":Landroid/widget/Button;
    .end local v9    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    .end local v17    # "isStream":Ljava/io/InputStream;
    .end local v21    # "offimage":Ljava/lang/String;
    .end local v22    # "onimage":Ljava/lang/String;
    .end local v29    # "statePressed":I
    :cond_10
    :goto_5
    move-object/from16 v0, v27

    instance-of v0, v0, Landroid/widget/EditText;

    move/from16 v37, v0

    if-eqz v37, :cond_13

    .line 769
    move-object/from16 v0, v27

    check-cast v0, Landroid/widget/EditText;

    move-object v10, v0

    .line 770
    .local v10, "editText":Landroid/widget/EditText;
    const-string v37, ""

    move-object v0, v10

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 771
    const/16 v37, 0x2

    move-object v0, v10

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 773
    const-string v37, "a:maxLength"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 774
    .local v19, "maxLength":Ljava/lang/String;
    if-eqz v19, :cond_11

    .line 775
    invoke-virtual {v10}, Landroid/widget/EditText;->setSingleLine()V

    .line 776
    const/16 v37, 0x1

    move/from16 v0, v37

    new-array v0, v0, [Landroid/text/InputFilter;

    move-object v11, v0

    .line 777
    .local v11, "filterArray":[Landroid/text/InputFilter;
    const/16 v37, 0x0

    new-instance v38, Landroid/text/InputFilter$LengthFilter;

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v39

    invoke-direct/range {v38 .. v39}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v38, v11, v37

    .line 778
    invoke-virtual {v10, v11}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 780
    .end local v11    # "filterArray":[Landroid/text/InputFilter;
    :cond_11
    const-string v37, "a:password"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    .line 781
    .local v26, "passwordText":Ljava/lang/String;
    if-eqz v26, :cond_12

    .line 782
    new-instance v25, Landroid/text/method/PasswordTransformationMethod;

    invoke-direct/range {v25 .. v25}, Landroid/text/method/PasswordTransformationMethod;-><init>()V

    .line 783
    .local v25, "passwdtm":Landroid/text/method/PasswordTransformationMethod;
    move-object v0, v10

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    .line 786
    .end local v25    # "passwdtm":Landroid/text/method/PasswordTransformationMethod;
    :cond_12
    const-string v37, "a:id"

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 788
    .local v13, "id":Ljava/lang/String;
    if-eqz v13, :cond_13

    .line 789
    const-string v37, "JuminText1"

    move-object v0, v13

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_19

    .line 790
    move-object v0, v10

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/feelingk/iap/gui/parser/ParserXML;->m_JuminText1:Landroid/widget/EditText;

    .line 796
    .end local v10    # "editText":Landroid/widget/EditText;
    .end local v13    # "id":Ljava/lang/String;
    .end local v19    # "maxLength":Ljava/lang/String;
    .end local v26    # "passwordText":Ljava/lang/String;
    :cond_13
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Ljava/util/Stack;->size()I

    move-result v37

    if-lez v37, :cond_14

    .line 797
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    move-object/from16 v37, v0

    invoke-virtual/range {v37 .. v37}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "parse":Lorg/xmlpull/v1/XmlPullParser;
    check-cast p1, Landroid/view/ViewGroup;

    move-object/from16 v0, p0

    move-object v1, v5

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/feelingk/iap/gui/parser/ParserXML;->loadLayoutParams(Landroid/util/AttributeSet;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;

    move-result-object v37

    move-object/from16 v0, v27

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_14
    move-object/from16 v37, v27

    .line 799
    goto/16 :goto_1

    .line 659
    .restart local v18    # "ll":Landroid/widget/LinearLayout;
    .restart local v23    # "orient":Ljava/lang/String;
    .restart local p1    # "parse":Lorg/xmlpull/v1/XmlPullParser;
    :cond_15
    const-string v37, "vertical"

    move-object/from16 v0, v23

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v37

    if-eqz v37, :cond_5

    .line 660
    const/16 v37, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    goto/16 :goto_2

    .line 684
    .restart local v12    # "gravity":Ljava/lang/String;
    .restart local v14    # "image":Ljava/lang/String;
    .restart local v15    # "imageColor":Ljava/lang/String;
    :cond_16
    const/16 v37, 0x5

    move-object/from16 v0, v18

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    goto/16 :goto_3

    .line 729
    .end local v12    # "gravity":Ljava/lang/String;
    .end local v14    # "image":Ljava/lang/String;
    .end local v15    # "imageColor":Ljava/lang/String;
    .end local v18    # "ll":Landroid/widget/LinearLayout;
    .end local v23    # "orient":Ljava/lang/String;
    .restart local v30    # "text":Ljava/lang/String;
    .restart local v31    # "textColor":Ljava/lang/String;
    .restart local v32    # "textGravity":Ljava/lang/String;
    .restart local v33    # "textID":Ljava/lang/String;
    .restart local v34    # "textSize":Ljava/lang/String;
    .restart local v36    # "tv":Landroid/widget/TextView;
    :cond_17
    const/16 v37, 0x13

    invoke-virtual/range {v36 .. v37}, Landroid/widget/TextView;->setGravity(I)V

    goto/16 :goto_4

    .line 761
    .end local v30    # "text":Ljava/lang/String;
    .end local v31    # "textColor":Ljava/lang/String;
    .end local v32    # "textGravity":Ljava/lang/String;
    .end local v33    # "textID":Ljava/lang/String;
    .end local v34    # "textSize":Ljava/lang/String;
    .end local v36    # "tv":Landroid/widget/TextView;
    .restart local v6    # "btOn":Landroid/graphics/drawable/Drawable;
    .restart local v7    # "btOver":Landroid/graphics/drawable/Drawable;
    .restart local v8    # "btn":Landroid/widget/Button;
    .restart local v9    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    .restart local v17    # "isStream":Ljava/io/InputStream;
    .restart local v21    # "offimage":Ljava/lang/String;
    .restart local v22    # "onimage":Ljava/lang/String;
    .restart local v29    # "statePressed":I
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/feelingk/iap/gui/parser/ParserXML;->cancelAuthBtn:Landroid/view/View$OnClickListener;

    move-object/from16 v37, v0

    move-object v0, v8

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_5

    .line 792
    .end local v6    # "btOn":Landroid/graphics/drawable/Drawable;
    .end local v7    # "btOver":Landroid/graphics/drawable/Drawable;
    .end local v8    # "btn":Landroid/widget/Button;
    .end local v9    # "drawables":Landroid/graphics/drawable/StateListDrawable;
    .end local v17    # "isStream":Ljava/io/InputStream;
    .end local v21    # "offimage":Ljava/lang/String;
    .end local v22    # "onimage":Ljava/lang/String;
    .end local v29    # "statePressed":I
    .restart local v10    # "editText":Landroid/widget/EditText;
    .restart local v13    # "id":Ljava/lang/String;
    .restart local v19    # "maxLength":Ljava/lang/String;
    .restart local v26    # "passwordText":Ljava/lang/String;
    :cond_19
    move-object v0, v10

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/feelingk/iap/gui/parser/ParserXML;->m_JuminText2:Landroid/widget/EditText;

    goto :goto_6
.end method

.method private dipToInt(F)I
    .locals 3
    .param p1, "number"    # F

    .prologue
    .line 1041
    const/4 v1, 0x0

    cmpl-float v1, p1, v1

    if-nez v1, :cond_0

    .line 1042
    const/4 v1, 0x0

    .line 1046
    :goto_0
    return v1

    .line 1045
    :cond_0
    const/4 v1, 0x1

    iget-object v2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v1, p1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v0, v1

    .local v0, "num":I
    move v1, v0

    .line 1046
    goto :goto_0
.end method

.method private findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "atts"    # Landroid/util/AttributeSet;
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    .line 852
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Landroid/util/AttributeSet;->getAttributeCount()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 858
    const-string v2, ":"

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 859
    .local v1, "ix":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 860
    const-string v2, "http://schemas.android.com/apk/res/android"

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 863
    .end local v1    # "ix":I
    :goto_1
    return-object v2

    .line 853
    :cond_0
    invoke-interface {p1, v0}, Landroid/util/AttributeSet;->getAttributeName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 855
    invoke-interface {p1, v0}, Landroid/util/AttributeSet;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 852
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 863
    .restart local v1    # "ix":I
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private getResourcePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1036
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->RES_VERT_FILE_PATH:Ljava/lang/String;

    return-object v0
.end method

.method private getResourceXMLPath()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x1

    .line 1021
    const/4 v0, 0x0

    .line 1023
    .local v0, "path":Ljava/lang/String;
    iget v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mKORCarrier:I

    if-ne v1, v2, :cond_0

    .line 1024
    const-string v1, "%s"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_PATH:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1032
    :goto_0
    return-object v0

    .line 1026
    :cond_0
    const-string v1, "%s"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_PATH_KTLG:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private inflate(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;
    .locals 6
    .param p1, "parse"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->clear()V

    .line 192
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->clear()V

    .line 194
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 195
    .local v0, "data":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/StringBuffer;>;"
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    .line 196
    .local v1, "evt":I
    const/4 v2, 0x0

    .line 198
    .local v2, "root":Landroid/view/View;
    :cond_0
    :goto_0
    const/4 v4, 0x1

    if-ne v1, v4, :cond_1

    .line 235
    return-object v2

    .line 199
    :cond_1
    packed-switch v1, :pswitch_data_0

    .line 233
    :cond_2
    :goto_1
    :pswitch_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    goto :goto_0

    .line 202
    :pswitch_1
    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    goto :goto_1

    .line 205
    :pswitch_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    invoke-direct {p0, p1}, Lcom/feelingk/iap/gui/parser/ParserXML;->createView(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;

    move-result-object v3

    .line 209
    .local v3, "v":Landroid/view/View;
    if-eqz v3, :cond_0

    .line 212
    if-nez v2, :cond_3

    .line 213
    move-object v2, v3

    .line 219
    :goto_2
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_2

    .line 220
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    check-cast v3, Landroid/view/ViewGroup;

    .end local v3    # "v":Landroid/view/View;
    invoke-virtual {v4, v3}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 216
    .restart local v3    # "v":Landroid/view/View;
    :cond_3
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_2

    .line 224
    .end local v3    # "v":Landroid/view/View;
    :pswitch_3
    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/StringBuffer;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 227
    :pswitch_4
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 229
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/feelingk/iap/gui/parser/ParserXML;->isLayout(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 230
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_1

    .line 199
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method private inflateAuthPopup(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;
    .locals 6
    .param p1, "parse"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 582
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->clear()V

    .line 583
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->clear()V

    .line 585
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 586
    .local v0, "data":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/StringBuffer;>;"
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v1

    .line 587
    .local v1, "evt":I
    const/4 v2, 0x0

    .line 589
    .local v2, "root":Landroid/view/View;
    :cond_0
    :goto_0
    const/4 v4, 0x1

    if-ne v1, v4, :cond_1

    .line 625
    return-object v2

    .line 590
    :cond_1
    packed-switch v1, :pswitch_data_0

    .line 623
    :cond_2
    :goto_1
    :pswitch_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    goto :goto_0

    .line 593
    :pswitch_1
    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    goto :goto_1

    .line 596
    :pswitch_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 598
    invoke-direct {p0, p1}, Lcom/feelingk/iap/gui/parser/ParserXML;->createViewAuthPopup(Lorg/xmlpull/v1/XmlPullParser;)Landroid/view/View;

    move-result-object v3

    .line 599
    .local v3, "v":Landroid/view/View;
    if-eqz v3, :cond_0

    .line 602
    if-nez v2, :cond_3

    .line 603
    move-object v2, v3

    .line 609
    :goto_2
    instance-of v4, v3, Landroid/view/ViewGroup;

    if-eqz v4, :cond_2

    .line 610
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    check-cast v3, Landroid/view/ViewGroup;

    .end local v3    # "v":Landroid/view/View;
    invoke-virtual {v4, v3}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 606
    .restart local v3    # "v":Landroid/view/View;
    :cond_3
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_2

    .line 614
    .end local v3    # "v":Landroid/view/View;
    :pswitch_3
    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/StringBuffer;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 617
    :pswitch_4
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 619
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/feelingk/iap/gui/parser/ParserXML;->isLayout(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 620
    iget-object v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_1

    .line 590
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method private isLayout(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 239
    const-string v0, "Layout"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private loadLayoutParams(Landroid/util/AttributeSet;Landroid/view/ViewGroup;)Landroid/view/ViewGroup$LayoutParams;
    .locals 14
    .param p1, "atts"    # Landroid/util/AttributeSet;
    .param p2, "vg"    # Landroid/view/ViewGroup;

    .prologue
    .line 885
    const/4 v5, 0x0

    .line 887
    .local v5, "lps":Landroid/view/ViewGroup$LayoutParams;
    const-string v13, "a:layout_width"

    invoke-direct {p0, p1, v13}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 888
    .local v12, "width":Ljava/lang/String;
    const-string v13, "a:layout_height"

    invoke-direct {p0, p1, v13}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 890
    .local v3, "height":Ljava/lang/String;
    invoke-direct {p0, v12}, Lcom/feelingk/iap/gui/parser/ParserXML;->readSize(Ljava/lang/String;)I

    move-result v10

    .line 891
    .local v10, "w":I
    invoke-direct {p0, v3}, Lcom/feelingk/iap/gui/parser/ParserXML;->readSize(Ljava/lang/String;)I

    move-result v2

    .line 893
    .local v2, "h":I
    move-object/from16 v0, p2

    instance-of v0, v0, Landroid/widget/LinearLayout;

    move v13, v0

    if-eqz v13, :cond_0

    .line 894
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .end local v5    # "lps":Landroid/view/ViewGroup$LayoutParams;
    invoke-direct {v5, v10, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 902
    .restart local v5    # "lps":Landroid/view/ViewGroup$LayoutParams;
    :cond_0
    instance-of v13, v5, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v13, :cond_7

    .line 903
    move-object v0, v5

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    move-object v4, v0

    .line 904
    .local v4, "l":Landroid/widget/LinearLayout$LayoutParams;
    const-string v13, "a:layout_gravity"

    invoke-direct {p0, p1, v13}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 905
    .local v1, "gravity":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 906
    const-string v13, "center"

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_8

    .line 907
    const/16 v13, 0x11

    iput v13, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 912
    :cond_1
    :goto_0
    const-string v13, "a:layout_weight"

    invoke-direct {p0, p1, v13}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 913
    .local v11, "weight":Ljava/lang/String;
    if-eqz v11, :cond_2

    .line 914
    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v13

    iput v13, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 917
    :cond_2
    const-string v13, "a:layout_marginTop"

    invoke-direct {p0, p1, v13}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 918
    .local v9, "marginTop":Ljava/lang/String;
    const-string v13, "a:layout_marginLeft"

    invoke-direct {p0, p1, v13}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 919
    .local v7, "marginLeft":Ljava/lang/String;
    const-string v13, "a:layout_marginRight"

    invoke-direct {p0, p1, v13}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 920
    .local v8, "marginRight":Ljava/lang/String;
    const-string v13, "a:layout_marginBottom"

    invoke-direct {p0, p1, v13}, Lcom/feelingk/iap/gui/parser/ParserXML;->findAttribute(Landroid/util/AttributeSet;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 922
    .local v6, "marginBottom":Ljava/lang/String;
    if-eqz v9, :cond_3

    .line 923
    invoke-direct {p0, v9}, Lcom/feelingk/iap/gui/parser/ParserXML;->readDPSize(Ljava/lang/String;)I

    move-result v13

    iput v13, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 924
    :cond_3
    if-eqz v7, :cond_4

    .line 925
    invoke-direct {p0, v7}, Lcom/feelingk/iap/gui/parser/ParserXML;->readDPSize(Ljava/lang/String;)I

    move-result v13

    iput v13, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 926
    :cond_4
    if-eqz v6, :cond_5

    .line 927
    invoke-direct {p0, v6}, Lcom/feelingk/iap/gui/parser/ParserXML;->readSize(Ljava/lang/String;)I

    move-result v13

    iput v13, v4, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 928
    :cond_5
    if-eqz v8, :cond_6

    .line 929
    invoke-direct {p0, v8}, Lcom/feelingk/iap/gui/parser/ParserXML;->readDPSize(Ljava/lang/String;)I

    move-result v13

    iput v13, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 931
    :cond_6
    move-object v5, v4

    .line 934
    .end local v1    # "gravity":Ljava/lang/String;
    .end local v4    # "l":Landroid/widget/LinearLayout$LayoutParams;
    .end local v6    # "marginBottom":Ljava/lang/String;
    .end local v7    # "marginLeft":Ljava/lang/String;
    .end local v8    # "marginRight":Ljava/lang/String;
    .end local v9    # "marginTop":Ljava/lang/String;
    .end local v11    # "weight":Ljava/lang/String;
    :cond_7
    return-object v5

    .line 909
    .restart local v1    # "gravity":Ljava/lang/String;
    .restart local v4    # "l":Landroid/widget/LinearLayout$LayoutParams;
    :cond_8
    const/4 v13, 0x5

    iput v13, v4, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    goto :goto_0
.end method

.method private lookupId(Ljava/lang/String;)I
    .locals 6
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/4 v5, -0x1

    .line 837
    const-string v3, "/"

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 838
    .local v1, "ix":I
    if-eq v1, v5, :cond_1

    .line 839
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 840
    .local v0, "idName":Ljava/lang/String;
    iget-object v3, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    invoke-virtual {v3, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 841
    .local v2, "n":Ljava/lang/Integer;
    if-nez v2, :cond_0

    const-string v3, "@+"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 842
    new-instance v2, Ljava/lang/Integer;

    .end local v2    # "n":Ljava/lang/Integer;
    iget v3, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->idg:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->idg:I

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    .line 843
    .restart local v2    # "n":Ljava/lang/Integer;
    iget-object v3, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    invoke-virtual {v3, v0, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 845
    :cond_0
    if-eqz v2, :cond_1

    .line 846
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 848
    .end local v0    # "idName":Ljava/lang/String;
    .end local v2    # "n":Ljava/lang/Integer;
    :goto_0
    return v3

    :cond_1
    move v3, v5

    goto :goto_0
.end method

.method private readDPSize(Ljava/lang/String;)I
    .locals 5
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 1003
    const/4 v1, 0x0

    .line 1006
    .local v1, "size":F
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x2

    sub-int/2addr v3, v4

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    .line 1008
    const-string v2, "dp"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1009
    invoke-direct {p0, v1}, Lcom/feelingk/iap/gui/parser/ParserXML;->dipToInt(F)I

    move-result v2

    .line 1015
    :goto_0
    return v2

    .line 1012
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    goto :goto_0

    .line 1014
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1015
    .local v0, "ex":Ljava/lang/NumberFormatException;
    const/4 v2, -0x1

    goto :goto_0
.end method

.method private readFontSize(Ljava/lang/String;)I
    .locals 7
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 983
    const/4 v2, 0x0

    .line 986
    .local v2, "size":F
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    sub-int/2addr v4, v5

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 993
    float-to-double v3, v2

    const-wide/high16 v5, 0x3ff8000000000000L    # 1.5

    div-double/2addr v3, v5

    double-to-float v0, v3

    .line 994
    .local v0, "dpChange":F
    float-to-int v3, v0

    .line 997
    .end local v0    # "dpChange":F
    :goto_0
    return v3

    .line 996
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 997
    .local v1, "ex":Ljava/lang/NumberFormatException;
    const/4 v3, -0x1

    goto :goto_0
.end method

.method private readSize(Ljava/lang/String;)I
    .locals 8
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    const/4 v7, -0x1

    const/4 v5, -0x2

    .line 938
    const/high16 v0, 0x3f800000    # 1.0f

    .line 940
    .local v0, "density":F
    const-string v4, "wrap_content"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v5

    .line 975
    :goto_0
    return v4

    .line 943
    :cond_0
    const-string v4, "fill_parent"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v7

    .line 944
    goto :goto_0

    .line 946
    :cond_1
    if-eqz p1, :cond_4

    .line 948
    const/4 v3, 0x0

    .line 950
    .local v3, "size":F
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x2

    sub-int/2addr v5, v6

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    .line 956
    const-string v4, "dp"

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 957
    invoke-direct {p0, v3}, Lcom/feelingk/iap/gui/parser/ParserXML;->dipToInt(F)I

    move-result v4

    goto :goto_0

    .line 963
    :cond_2
    const-string v4, "pt"

    invoke-virtual {p1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 964
    float-to-double v4, v3

    const-wide/high16 v6, 0x3ff8000000000000L    # 1.5

    div-double/2addr v4, v6

    double-to-float v1, v4

    .line 965
    .local v1, "dpChange":F
    mul-float v4, v1, v0

    float-to-int v4, v4

    goto :goto_0

    .line 968
    .end local v1    # "dpChange":F
    :cond_3
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    goto :goto_0

    .line 970
    :catch_0
    move-exception v4

    move-object v2, v4

    .local v2, "ex":Ljava/lang/NumberFormatException;
    move v4, v7

    .line 971
    goto :goto_0

    .end local v2    # "ex":Ljava/lang/NumberFormatException;
    .end local v3    # "size":F
    :cond_4
    move v4, v5

    .line 975
    goto :goto_0
.end method


# virtual methods
.method public ReleaseResource()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 119
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->clear()V

    .line 121
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->layoutStack:Ljava/util/Stack;

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    if-eqz v0, :cond_1

    .line 125
    iget-object v0, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 126
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->ids:Ljava/util/Hashtable;

    .line 129
    :cond_1
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->context:Landroid/content/Context;

    .line 130
    iput-object v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->onResultCallback:Lcom/feelingk/iap/gui/parser/ParserXML$ParserResultCallback;

    .line 131
    return-void
.end method

.method public Start(ILjava/lang/Object;)Landroid/view/View;
    .locals 4
    .param p1, "orientation"    # I
    .param p2, "objData"    # Ljava/lang/Object;

    .prologue
    .line 136
    const/4 v0, 0x0

    .line 137
    .local v0, "fileName":Ljava/lang/String;
    iput p1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->orientation:I

    .line 139
    const-string v1, "ParserXML"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "# purchase Start !! GUI-rotate ="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/feelingk/iap/util/CommonF$LOGGER;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    iget v1, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->orientation:I

    if-nez v1, :cond_0

    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourceXMLPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_NAME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "W.xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 146
    :goto_0
    check-cast p2, Lcom/feelingk/iap/gui/data/PurchaseItem;

    .end local p2    # "objData":Ljava/lang/Object;
    iput-object p2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mItemPurchaseItemInfo:Lcom/feelingk/iap/gui/data/PurchaseItem;

    .line 147
    invoke-direct {p0, v0}, Lcom/feelingk/iap/gui/parser/ParserXML;->Start(Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    return-object v1

    .line 144
    .restart local p2    # "objData":Ljava/lang/Object;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/feelingk/iap/gui/parser/ParserXML;->getResourceXMLPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->XML_FILE_NAME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "H.xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public Start(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Landroid/view/View;
    .locals 1
    .param p1, "xmlFileFname"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 151
    iput-object p2, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mInfoMessage:Ljava/lang/String;

    .line 152
    check-cast p3, Landroid/view/View$OnClickListener;

    .end local p3    # "obj":Ljava/lang/Object;
    iput-object p3, p0, Lcom/feelingk/iap/gui/parser/ParserXML;->mPopupClickListener:Landroid/view/View$OnClickListener;

    .line 154
    invoke-direct {p0, p1}, Lcom/feelingk/iap/gui/parser/ParserXML;->Start(Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method
