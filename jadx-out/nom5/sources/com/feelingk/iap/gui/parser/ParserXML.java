package com.feelingk.iap.gui.parser;

import android.R;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.text.InputFilter;
import android.text.method.PasswordTransformationMethod;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.util.Xml;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.feelingk.iap.gui.data.PurchaseItem;
import com.feelingk.iap.util.CommonF;
import com.feelingk.iap.util.CommonString;
import com.feelingk.iap.util.Defines;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Hashtable;
import java.util.Stack;
import junit.framework.Assert;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

/* JADX INFO: loaded from: classes.dex */
public class ParserXML {
    static final String TAG = "ParserXML";
    private String RES_VERT_FILE_PATH;
    private String XML_FILE_NAME;
    private String XML_FILE_PATH;
    private String XML_FILE_PATH_KTLG;
    View.OnClickListener cancelAuthBtn;
    View.OnClickListener cancelBtn;
    private Context context;
    private int idg;
    private Hashtable<String, Integer> ids;
    private Stack<ViewGroup> layoutStack;
    private String mInfoMessage;
    private PurchaseItem mItemPurchaseItemInfo;
    private boolean mJuminPopupMode;
    private int mKORCarrier;
    private View.OnClickListener mPopupClickListener;
    private TextView m_AccountPriceTextView;
    private EditText m_JuminText1;
    private EditText m_JuminText2;
    View.OnClickListener okAuthBtn;
    View.OnClickListener okBtn;
    View.OnClickListener okMessageBtn;
    private ParserAuthResultCallback onAuthResultCallback;
    private ParserResultCallback onResultCallback;
    private int orientation;

    public interface ParserAuthResultCallback {
        void onAuthDialogCancelButtonClick();

        void onAuthDialogOKButtonClick(String str, String str2);
    }

    public interface ParserResultCallback {
        void onPurchaseButtonClick();

        void onPurchaseCancelButtonClick();

        void onUseTCashCheckChanged(boolean z);
    }

    public ParserXML(Context c) {
        this.layoutStack = null;
        this.ids = null;
        this.context = null;
        this.onResultCallback = null;
        this.onAuthResultCallback = null;
        this.orientation = 0;
        this.RES_VERT_FILE_PATH = "/res/";
        this.XML_FILE_PATH = "/xml";
        this.XML_FILE_PATH_KTLG = "/xml_kt_lg";
        this.XML_FILE_NAME = "purchase";
        this.mInfoMessage = null;
        this.mPopupClickListener = null;
        this.mItemPurchaseItemInfo = null;
        this.mKORCarrier = 0;
        this.mJuminPopupMode = false;
        this.m_AccountPriceTextView = null;
        this.m_JuminText1 = null;
        this.m_JuminText2 = null;
        this.okAuthBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                int num_jumin1 = ParserXML.this.m_JuminText1.getText().length();
                int num_jumin2 = ParserXML.this.m_JuminText2.getText().length();
                if (num_jumin1 != 6 || num_jumin2 != 7) {
                    Toast toast = Toast.makeText(ParserXML.this.context, CommonString.ERROR_JUMIN_NUMBER_LENGTH, 0);
                    toast.show();
                } else {
                    ParserXML.this.onAuthResultCallback.onAuthDialogOKButtonClick(ParserXML.this.m_JuminText1.getText().toString(), ParserXML.this.m_JuminText2.getText().toString());
                }
            }
        };
        this.cancelAuthBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ParserXML.this.onAuthResultCallback.onAuthDialogCancelButtonClick();
            }
        };
        this.okBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ParserXML.this.onResultCallback.onPurchaseButtonClick();
            }
        };
        this.cancelBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ParserXML.this.onResultCallback.onPurchaseCancelButtonClick();
            }
        };
        this.okMessageBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ParserXML.this.mPopupClickListener.onClick(v);
            }
        };
        this.context = c;
        this.layoutStack = new Stack<>();
        this.ids = new Hashtable<>();
    }

    public ParserXML(Context c, ParserAuthResultCallback cb, boolean bJuminPopupMode) {
        this.layoutStack = null;
        this.ids = null;
        this.context = null;
        this.onResultCallback = null;
        this.onAuthResultCallback = null;
        this.orientation = 0;
        this.RES_VERT_FILE_PATH = "/res/";
        this.XML_FILE_PATH = "/xml";
        this.XML_FILE_PATH_KTLG = "/xml_kt_lg";
        this.XML_FILE_NAME = "purchase";
        this.mInfoMessage = null;
        this.mPopupClickListener = null;
        this.mItemPurchaseItemInfo = null;
        this.mKORCarrier = 0;
        this.mJuminPopupMode = false;
        this.m_AccountPriceTextView = null;
        this.m_JuminText1 = null;
        this.m_JuminText2 = null;
        this.okAuthBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                int num_jumin1 = ParserXML.this.m_JuminText1.getText().length();
                int num_jumin2 = ParserXML.this.m_JuminText2.getText().length();
                if (num_jumin1 != 6 || num_jumin2 != 7) {
                    Toast toast = Toast.makeText(ParserXML.this.context, CommonString.ERROR_JUMIN_NUMBER_LENGTH, 0);
                    toast.show();
                } else {
                    ParserXML.this.onAuthResultCallback.onAuthDialogOKButtonClick(ParserXML.this.m_JuminText1.getText().toString(), ParserXML.this.m_JuminText2.getText().toString());
                }
            }
        };
        this.cancelAuthBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ParserXML.this.onAuthResultCallback.onAuthDialogCancelButtonClick();
            }
        };
        this.okBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ParserXML.this.onResultCallback.onPurchaseButtonClick();
            }
        };
        this.cancelBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ParserXML.this.onResultCallback.onPurchaseCancelButtonClick();
            }
        };
        this.okMessageBtn = new View.OnClickListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                ParserXML.this.mPopupClickListener.onClick(v);
            }
        };
        this.context = c;
        this.layoutStack = new Stack<>();
        this.ids = new Hashtable<>();
        this.onAuthResultCallback = cb;
        this.mJuminPopupMode = bJuminPopupMode;
    }

    public ParserXML(Context c, ParserResultCallback callback) {
        this(c);
        this.onResultCallback = callback;
    }

    public ParserXML(Context c, ParserResultCallback callback, int isTelecomCarrier, boolean isDeviceTab) {
        this(c);
        this.onResultCallback = callback;
        this.mKORCarrier = isTelecomCarrier;
    }

    public ParserXML(Context c, ParserResultCallback callback, int isTelecomCarrier, boolean isDeviceTab, boolean bJuminPopupMode) {
        this(c);
        this.onResultCallback = callback;
        this.mKORCarrier = isTelecomCarrier;
        this.mJuminPopupMode = bJuminPopupMode;
    }

    public void ReleaseResource() {
        if (this.layoutStack != null) {
            this.layoutStack.clear();
            this.layoutStack = null;
        }
        if (this.ids != null) {
            this.ids.clear();
            this.ids = null;
        }
        this.context = null;
        this.onResultCallback = null;
    }

    public View Start(int orientation, Object objData) {
        String fileName;
        this.orientation = orientation;
        CommonF.LOGGER.m0e(TAG, "# purchase Start !! GUI-rotate =" + orientation);
        if (this.orientation == 0) {
            fileName = String.valueOf(getResourceXMLPath()) + "/" + this.XML_FILE_NAME + "W.xml";
        } else {
            fileName = String.valueOf(getResourceXMLPath()) + "/" + this.XML_FILE_NAME + "H.xml";
        }
        this.mItemPurchaseItemInfo = (PurchaseItem) objData;
        return Start(fileName);
    }

    public View Start(String xmlFileFname, String message, Object obj) {
        this.mInfoMessage = message;
        this.mPopupClickListener = (View.OnClickListener) obj;
        return Start(xmlFileFname);
    }

    private View Start(String xmlFileFname) {
        View parsingView;
        try {
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            XmlPullParser parse = factory.newPullParser();
            InputStream is = getClass().getResourceAsStream(xmlFileFname);
            parse.setInput(is, "utf-8");
            if (this.mJuminPopupMode) {
                parsingView = inflateAuthPopup(parse);
            } else {
                parsingView = inflate(parse);
            }
            return parsingView;
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        } catch (XmlPullParserException ex2) {
            ex2.printStackTrace();
            return null;
        }
    }

    private View inflate(XmlPullParser parse) throws XmlPullParserException, IOException {
        this.layoutStack.clear();
        this.ids.clear();
        Stack<StringBuffer> data = new Stack<>();
        int evt = parse.getEventType();
        View root = null;
        while (evt != 1) {
            switch (evt) {
                case 0:
                    data.clear();
                    evt = parse.next();
                    break;
                case 1:
                default:
                    evt = parse.next();
                    break;
                case 2:
                    data.push(new StringBuffer());
                    View v = createView(parse);
                    if (v != null) {
                        if (root == null) {
                            root = v;
                        } else {
                            this.layoutStack.peek().addView(v);
                        }
                        if (v instanceof ViewGroup) {
                            this.layoutStack.push((ViewGroup) v);
                        }
                        evt = parse.next();
                    }
                    break;
                case 3:
                    data.pop();
                    if (isLayout(parse.getName())) {
                        this.layoutStack.pop();
                    }
                    evt = parse.next();
                    break;
                case 4:
                    data.peek().append(parse.getText());
                    evt = parse.next();
                    break;
            }
        }
        return root;
    }

    private boolean isLayout(String name) {
        return name.endsWith("Layout");
    }

    private View createView(XmlPullParser parse) {
        String name = parse.getName();
        View result = null;
        AttributeSet atts = Xml.asAttributeSet(parse);
        if (name.equals("LinearLayout")) {
            result = new LinearLayout(this.context);
        } else if (name.equals("TextView")) {
            result = new TextView(this.context);
        } else if (name.equals("ImageView")) {
            result = new ImageView(this.context);
        } else if (name.equals("Button")) {
            result = new Button(this.context);
        } else if (name.equals("CheckBox")) {
            result = new CheckBox(this.context);
        } else {
            Assert.fail("# UnSupported tag:" + name);
        }
        if (result == null) {
            return null;
        }
        if (result instanceof LinearLayout) {
            LinearLayout ll = (LinearLayout) result;
            String orient = findAttribute(atts, "a:orientation");
            if (orient != null) {
                if (orient.equals("horizontal")) {
                    ll.setOrientation(0);
                } else if (orient.equals("vertical")) {
                    ll.setOrientation(1);
                }
            }
            String image = findAttribute(atts, "a:background");
            if (image != null) {
                InputStream is = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + image + ".png");
                ll.setBackgroundDrawable(Drawable.createFromStream(is, image));
            }
            String imageColor = findAttribute(atts, "a:backgroudcolor");
            if (imageColor != null) {
                ll.setBackgroundColor(-65536);
            }
            String gravity = findAttribute(atts, "a:gravity");
            if (gravity != null) {
                if (gravity.equals("center")) {
                    ll.setGravity(17);
                } else {
                    ll.setGravity(5);
                }
            }
            String padding = findAttribute(atts, "a:padding");
            if (padding != null) {
                int size = readDPSize(padding);
                ll.setPadding(size, size, size, size);
            }
            String touchMode = findAttribute(atts, "a:focusableInTouchMode");
            if (touchMode != null) {
                ll.setFocusableInTouchMode(true);
            }
        }
        if (result instanceof TextView) {
            TextView tv = (TextView) result;
            String textID = findAttribute(atts, "a:id");
            String text = findAttribute(atts, "a:text");
            String textSize = findAttribute(atts, "a:textSize");
            String textColor = findAttribute(atts, "a:textColor");
            String textGravity = findAttribute(atts, "a:gravity");
            if (text != null) {
                tv.setText(text.replace("\\n", "\n"));
            }
            if (textSize != null) {
                tv.setTextSize(readFontSize(textSize));
            }
            if (textColor != null) {
                tv.setTextColor(Color.parseColor(textColor));
            }
            if (textID != null) {
                if (textID.equals("ItemName")) {
                    tv.setText(this.mItemPurchaseItemInfo.itemName);
                } else if (textID.equals("ItemUseDate")) {
                    tv.setText(this.mItemPurchaseItemInfo.itemUseDate);
                } else if (textID.equals("ItemPrice")) {
                    tv.setText(String.valueOf(this.mItemPurchaseItemInfo.itemPrice) + "원");
                } else if (textID.equals("ItemCash")) {
                    tv.setText(String.valueOf(this.mItemPurchaseItemInfo.itemTCash) + "P");
                } else if (textID.equals("commonMessage")) {
                    tv.setText(this.mInfoMessage);
                } else if (textID.equals("Version")) {
                    tv.setText(Defines.IAP_LIBRARY_VERSION);
                } else {
                    this.m_AccountPriceTextView = tv;
                    tv.setText(String.valueOf(this.mItemPurchaseItemInfo.itemPurchasePrice) + "원");
                }
            }
            if (textGravity != null) {
                tv.setGravity(17);
            } else {
                tv.setGravity(19);
            }
            tv.setLineSpacing(0.0f, 1.15f);
        }
        if (result instanceof ImageView) {
            ImageView imageview = (ImageView) result;
            String image2 = findAttribute(atts, "a:background");
            if (image2 != null) {
                InputStream is2 = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + image2 + ".png");
                Drawable mDrawable = Drawable.createFromStream(is2, image2);
                imageview.setBackgroundDrawable(mDrawable);
            }
        }
        if (result instanceof Button) {
            String offimage = findAttribute(atts, "a:offImage");
            String onimage = findAttribute(atts, "a:onImage");
            if (offimage != null) {
                Button btn = (Button) result;
                InputStream isStream = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + offimage + ".png");
                Drawable btOn = Drawable.createFromStream(isStream, offimage);
                InputStream isStream2 = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + onimage + ".png");
                Drawable btOver = Drawable.createFromStream(isStream2, onimage);
                StateListDrawable drawables = new StateListDrawable();
                drawables.addState(new int[]{R.attr.state_pressed}, btOver);
                drawables.addState(new int[0], btOn);
                btn.setBackgroundDrawable(drawables);
                if (onimage.equals("btn_buy_sel_h")) {
                    btn.setOnClickListener(this.okBtn);
                } else if (onimage.equals("pop_btn_sel_ok")) {
                    btn.setOnClickListener(this.okMessageBtn);
                } else {
                    btn.setOnClickListener(this.cancelBtn);
                }
            } else {
                CheckBox checkbtn = (CheckBox) result;
                InputStream onStream = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + onimage + ".png");
                Drawable btOn2 = Drawable.createFromStream(onStream, onimage);
                InputStream onStream2 = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + "btn_check_ok_nor.png");
                Drawable btCheck = Drawable.createFromStream(onStream2, "btn_check_ok_nor");
                InputStream onStream3 = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + "btn_check_no_sel.png");
                Drawable btOver2 = Drawable.createFromStream(onStream3, "btn_check_no_sel");
                InputStream onStream4 = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + "btn_check_ok_sel.png");
                Drawable btCheckP = Drawable.createFromStream(onStream4, "btn_check_ok_sel");
                InputStream onStream5 = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + "btn_check_dim.png");
                Drawable btDis = Drawable.createFromStream(onStream5, "btn_check_dim");
                StateListDrawable drawables2 = new StateListDrawable();
                StateListDrawable drawables22 = new StateListDrawable();
                drawables2.addState(new int[]{-16842910, -16842908}, btDis);
                drawables2.addState(new int[]{-16842912, R.attr.state_pressed}, btOver2);
                drawables2.addState(new int[]{R.attr.state_checked, R.attr.state_pressed}, btCheckP);
                drawables2.addState(new int[]{-16842912, -16842908}, btOn2);
                drawables2.addState(new int[]{R.attr.state_checked, -16842908}, btCheck);
                drawables22.addState(new int[]{-16842910, -16842908}, null);
                drawables22.addState(new int[]{-16842912, R.attr.state_pressed}, null);
                drawables22.addState(new int[]{R.attr.state_checked, R.attr.state_pressed}, null);
                drawables22.addState(new int[]{-16842912, -16842908}, null);
                drawables22.addState(new int[]{R.attr.state_checked, -16842908}, null);
                checkbtn.setButtonDrawable(drawables22);
                checkbtn.setBackgroundDrawable(drawables2);
                checkbtn.setChecked(false);
                if (this.mItemPurchaseItemInfo.itemTCash != 0 && this.mItemPurchaseItemInfo.itemTCash - this.mItemPurchaseItemInfo.itemPrice >= 0) {
                    checkbtn.setEnabled(true);
                } else {
                    checkbtn.setEnabled(false);
                }
                checkbtn.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.feelingk.iap.gui.parser.ParserXML.6
                    @Override // android.widget.CompoundButton.OnCheckedChangeListener
                    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                        ParserXML.this.UseTCash(Boolean.valueOf(isChecked));
                        ParserXML.this.onResultCallback.onUseTCashCheckChanged(isChecked);
                    }
                });
            }
        }
        if (this.layoutStack.size() > 0) {
            result.setLayoutParams(loadLayoutParams(atts, this.layoutStack.peek()));
        }
        return result;
    }

    private View inflateAuthPopup(XmlPullParser parse) throws XmlPullParserException, IOException {
        this.layoutStack.clear();
        this.ids.clear();
        Stack<StringBuffer> data = new Stack<>();
        int evt = parse.getEventType();
        View root = null;
        while (evt != 1) {
            switch (evt) {
                case 0:
                    data.clear();
                    evt = parse.next();
                    break;
                case 1:
                default:
                    evt = parse.next();
                    break;
                case 2:
                    data.push(new StringBuffer());
                    View v = createViewAuthPopup(parse);
                    if (v != null) {
                        if (root == null) {
                            root = v;
                        } else {
                            this.layoutStack.peek().addView(v);
                        }
                        if (v instanceof ViewGroup) {
                            this.layoutStack.push((ViewGroup) v);
                        }
                        evt = parse.next();
                    }
                    break;
                case 3:
                    data.pop();
                    if (isLayout(parse.getName())) {
                        this.layoutStack.pop();
                    }
                    evt = parse.next();
                    break;
                case 4:
                    data.peek().append(parse.getText());
                    evt = parse.next();
                    break;
            }
        }
        return root;
    }

    private View createViewAuthPopup(XmlPullParser parse) {
        String name = parse.getName();
        View result = null;
        AttributeSet atts = Xml.asAttributeSet(parse);
        if (name.equals("LinearLayout")) {
            result = new LinearLayout(this.context);
        } else if (name.equals("TextView")) {
            result = new TextView(this.context);
        } else if (name.equals("Button")) {
            result = new Button(this.context);
        } else if (name.equals("EditText")) {
            result = new EditText(this.context);
        } else {
            Assert.fail("# UnSupported tag:" + name);
        }
        if (result == null) {
            return null;
        }
        if (result instanceof LinearLayout) {
            LinearLayout ll = (LinearLayout) result;
            String orient = findAttribute(atts, "a:orientation");
            if (orient != null) {
                if (orient.equals("horizontal")) {
                    ll.setOrientation(0);
                } else if (orient.equals("vertical")) {
                    ll.setOrientation(1);
                }
            }
            String image = findAttribute(atts, "a:background");
            if (image != null) {
                InputStream is = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + image + ".png");
                ll.setBackgroundDrawable(Drawable.createFromStream(is, image));
            }
            String imageColor = findAttribute(atts, "a:backgroudcolor");
            if (imageColor != null) {
                ll.setBackgroundColor(-65536);
            }
            String gravity = findAttribute(atts, "a:gravity");
            if (gravity != null) {
                if (gravity.equals("center")) {
                    ll.setGravity(17);
                } else {
                    ll.setGravity(5);
                }
            }
            String padding = findAttribute(atts, "a:padding");
            if (padding != null) {
                int size = readDPSize(padding);
                ll.setPadding(size, size, size, size);
            }
            String touchMode = findAttribute(atts, "a:focusableInTouchMode");
            if (touchMode != null) {
                ll.setFocusableInTouchMode(true);
            }
        }
        if (result instanceof TextView) {
            TextView tv = (TextView) result;
            String textID = findAttribute(atts, "a:id");
            String text = findAttribute(atts, "a:text");
            String textSize = findAttribute(atts, "a:textSize");
            String textColor = findAttribute(atts, "a:textColor");
            String textGravity = findAttribute(atts, "a:gravity");
            if (text != null) {
                tv.setText(text.replace("\\n", "\n"));
            }
            if (textSize != null) {
                tv.setTextSize(readFontSize(textSize));
            }
            if (textColor != null) {
                tv.setTextColor(Color.parseColor(textColor));
            }
            if (textID != null && textID.equals("Version")) {
                tv.setText(Defines.IAP_LIBRARY_VERSION);
            }
            if (textGravity != null) {
                tv.setGravity(17);
            } else {
                tv.setGravity(19);
            }
            tv.setLineSpacing(0.0f, 1.15f);
        }
        if (result instanceof Button) {
            String offimage = findAttribute(atts, "a:offImage");
            String onimage = findAttribute(atts, "a:onImage");
            Button btn = (Button) result;
            InputStream isStream = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + offimage + ".png");
            Drawable btOn = Drawable.createFromStream(isStream, offimage);
            InputStream isStream2 = getClass().getResourceAsStream(String.valueOf(getResourcePath()) + onimage + ".png");
            Drawable btOver = Drawable.createFromStream(isStream2, onimage);
            StateListDrawable drawables = new StateListDrawable();
            drawables.addState(new int[]{R.attr.state_pressed}, btOver);
            drawables.addState(new int[0], btOn);
            btn.setBackgroundDrawable(drawables);
            if (onimage.equals("btn_con_sel")) {
                btn.setOnClickListener(this.okAuthBtn);
            } else {
                btn.setOnClickListener(this.cancelAuthBtn);
            }
        }
        if (result instanceof EditText) {
            EditText editText = (EditText) result;
            editText.setText("");
            editText.setInputType(2);
            String maxLength = findAttribute(atts, "a:maxLength");
            if (maxLength != null) {
                editText.setSingleLine();
                InputFilter[] filterArray = {new InputFilter.LengthFilter(Integer.parseInt(maxLength))};
                editText.setFilters(filterArray);
            }
            String passwordText = findAttribute(atts, "a:password");
            if (passwordText != null) {
                PasswordTransformationMethod passwdtm = new PasswordTransformationMethod();
                editText.setTransformationMethod(passwdtm);
            }
            String id = findAttribute(atts, "a:id");
            if (id != null) {
                if (id.equals("JuminText1")) {
                    this.m_JuminText1 = editText;
                } else {
                    this.m_JuminText2 = editText;
                }
            }
        }
        if (this.layoutStack.size() > 0) {
            result.setLayoutParams(loadLayoutParams(atts, this.layoutStack.peek()));
        }
        return result;
    }

    private int lookupId(String id) {
        int ix = id.indexOf("/");
        if (ix != -1) {
            String idName = id.substring(ix + 1);
            Integer n = this.ids.get(idName);
            if (n == null && id.startsWith("@+")) {
                int i = this.idg;
                this.idg = i + 1;
                n = new Integer(i);
                this.ids.put(idName, n);
            }
            if (n != null) {
                return n.intValue();
            }
        }
        return -1;
    }

    private String findAttribute(AttributeSet atts, String id) {
        for (int i = 0; i < atts.getAttributeCount(); i++) {
            if (atts.getAttributeName(i).equals(id)) {
                return atts.getAttributeValue(i);
            }
        }
        int ix = id.indexOf(":");
        if (ix != -1) {
            return atts.getAttributeValue("http://schemas.android.com/apk/res/android", id.substring(ix + 1));
        }
        return null;
    }

    private ViewGroup.LayoutParams loadLayoutParams(AttributeSet atts, ViewGroup vg) {
        ViewGroup.LayoutParams lps = null;
        String width = findAttribute(atts, "a:layout_width");
        String height = findAttribute(atts, "a:layout_height");
        int w = readSize(width);
        int h = readSize(height);
        if (vg instanceof LinearLayout) {
            lps = new LinearLayout.LayoutParams(w, h);
        }
        if (lps instanceof LinearLayout.LayoutParams) {
            LinearLayout.LayoutParams l = (LinearLayout.LayoutParams) lps;
            String gravity = findAttribute(atts, "a:layout_gravity");
            if (gravity != null) {
                if (gravity.equals("center")) {
                    l.gravity = 17;
                } else {
                    l.gravity = 5;
                }
            }
            String weight = findAttribute(atts, "a:layout_weight");
            if (weight != null) {
                l.weight = Float.parseFloat(weight);
            }
            String marginTop = findAttribute(atts, "a:layout_marginTop");
            String marginLeft = findAttribute(atts, "a:layout_marginLeft");
            String marginRight = findAttribute(atts, "a:layout_marginRight");
            String marginBottom = findAttribute(atts, "a:layout_marginBottom");
            if (marginTop != null) {
                l.topMargin = readDPSize(marginTop);
            }
            if (marginLeft != null) {
                l.leftMargin = readDPSize(marginLeft);
            }
            if (marginBottom != null) {
                l.bottomMargin = readSize(marginBottom);
            }
            if (marginRight != null) {
                l.rightMargin = readDPSize(marginRight);
            }
            return l;
        }
        return lps;
    }

    private int readSize(String val) {
        int iDipToInt;
        if ("wrap_content".equals(val)) {
            return -2;
        }
        if ("fill_parent".equals(val)) {
            return -1;
        }
        if (val == null) {
            return -2;
        }
        try {
            float size = Float.parseFloat(val.substring(0, val.length() - 2));
            if (val.endsWith("dp")) {
                iDipToInt = dipToInt(size);
            } else if (val.endsWith("pt")) {
                float dpChange = (float) (((double) size) / 1.5d);
                iDipToInt = (int) (dpChange * 1.0f);
            } else {
                iDipToInt = Integer.parseInt(val);
            }
            return iDipToInt;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    private int readFontSize(String val) {
        try {
            float size = Float.parseFloat(val.substring(0, val.length() - 2));
            float dpChange = (float) (((double) size) / 1.5d);
            return (int) dpChange;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    private int readDPSize(String val) {
        int iDipToInt;
        try {
            float size = Float.parseFloat(val.substring(0, val.length() - 2));
            if (val.endsWith("dp")) {
                iDipToInt = dipToInt(size);
            } else {
                iDipToInt = Integer.parseInt(val);
            }
            return iDipToInt;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    private String getResourceXMLPath() {
        if (this.mKORCarrier == 1) {
            String path = String.format("%s", this.XML_FILE_PATH);
            return path;
        }
        String path2 = String.format("%s", this.XML_FILE_PATH_KTLG);
        return path2;
    }

    private String getResourcePath() {
        return this.RES_VERT_FILE_PATH;
    }

    private int dipToInt(float number) {
        if (number == 0.0f) {
            return 0;
        }
        int num = (int) TypedValue.applyDimension(1, number, this.context.getResources().getDisplayMetrics());
        return num;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UseTCash(Boolean flag) {
        if (flag.booleanValue()) {
            int total = this.mItemPurchaseItemInfo.itemPrice - this.mItemPurchaseItemInfo.itemTCash;
            if (total > 0) {
                String dfMoney = new DecimalFormat("###,###,###").format(total);
                this.m_AccountPriceTextView.setText(String.valueOf(dfMoney) + "원");
                return;
            } else {
                DecimalFormat df = new DecimalFormat("###,###,###");
                String dfMoney2 = df.format(this.mItemPurchaseItemInfo.itemPrice);
                String dfPoint = df.format(this.mItemPurchaseItemInfo.itemTCash);
                this.m_AccountPriceTextView.setText(String.valueOf(dfMoney2) + "원-" + dfPoint + "P=0원");
                return;
            }
        }
        String dfMoney3 = new DecimalFormat("###,###,###").format(this.mItemPurchaseItemInfo.itemPrice);
        this.m_AccountPriceTextView.setText(String.valueOf(dfMoney3) + "원");
    }
}
