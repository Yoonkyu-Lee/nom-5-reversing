package com.gamevil.nexus2;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import java.nio.Buffer;
import java.nio.IntBuffer;
import java.nio.ShortBuffer;
import java.text.BreakIterator;

/* JADX INFO: loaded from: classes.dex */
public class NexusFont {
    public static final int MAX_FONT_OBJECT_COUNT = 5;
    public static Canvas g_gfaCanvas = null;
    public static Bitmap g_gfaBitmap = null;
    public static Paint g_gfaPaint = null;
    public static BreakIterator g_wordBreaker = null;
    public static Typeface g_gfaFont1 = null;
    public static Typeface g_gfaFont2 = null;
    public static Typeface g_gfaFont3 = null;
    public static Typeface g_gfaFont4 = null;
    public static Typeface g_gfaFont5 = null;
    public static int g_gfaCurFont = -1;
    public static Buffer g_gfaBuffer = null;
    public static int[] g_gfaIntBuf = null;
    public static short[] g_gfaShortBuf = null;
    public static int g_gfaBPP = 32;
    public static int g_gfaBufCount = 0;
    public static int g_gfaColorkey = -65281;
    public static float[] g_gfaMeasureRect = null;
    public static float[] g_gfaMeasureSize = null;
    public static Paint.FontMetrics g_gfaFontMetrics = null;

    public static boolean GFA_Init(int width, int height, int bpp, int colorkey) {
        if (GFA_IsInitialized()) {
            return true;
        }
        g_gfaBufCount = width * height;
        switch (bpp) {
            case 16:
                g_gfaBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.RGB_565);
                g_gfaShortBuf = new short[g_gfaBufCount];
                g_gfaBuffer = ShortBuffer.wrap(g_gfaShortBuf);
                break;
            default:
                g_gfaBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
                g_gfaIntBuf = new int[g_gfaBufCount];
                g_gfaBuffer = IntBuffer.wrap(g_gfaIntBuf);
                break;
        }
        g_gfaBPP = bpp;
        g_gfaColorkey = colorkey;
        g_gfaCanvas = new Canvas(g_gfaBitmap);
        g_gfaPaint = new Paint();
        g_gfaPaint.setTextSize(12.0f);
        g_gfaPaint.setColor(-16777216);
        g_gfaPaint.setTextAlign(Paint.Align.LEFT);
        g_gfaPaint.setAntiAlias(true);
        g_gfaPaint.setStyle(Paint.Style.FILL);
        g_gfaFontMetrics = g_gfaPaint.getFontMetrics();
        g_gfaCurFont = -1;
        g_wordBreaker = BreakIterator.getWordInstance();
        g_gfaMeasureRect = new float[4];
        g_gfaMeasureSize = new float[2];
        return true;
    }

    public static boolean GFA_IsInitialized() {
        return (g_gfaPaint == null || g_gfaBitmap == null || g_gfaCanvas == null) ? false : true;
    }

    public static void GFA_Release() {
        g_gfaCanvas = null;
        g_gfaPaint = null;
        g_gfaBitmap = null;
        g_gfaFont1 = null;
        g_gfaFont2 = null;
        g_gfaFont3 = null;
        g_gfaFont4 = null;
        g_gfaFont5 = null;
        g_gfaCurFont = -1;
        g_wordBreaker = null;
        g_gfaBuffer = null;
        g_gfaShortBuf = null;
        g_gfaIntBuf = null;
        g_gfaMeasureRect = null;
        g_gfaMeasureSize = null;
        g_gfaFontMetrics = null;
    }

    public static int GFA_CreateFont(String fontFamily, int fontStyle) {
        if (g_gfaFont1 == null) {
            g_gfaFont1 = Typeface.create(fontFamily, fontStyle);
            return 0;
        }
        if (g_gfaFont2 == null) {
            g_gfaFont2 = Typeface.create(fontFamily, fontStyle);
            return 0;
        }
        if (g_gfaFont3 == null) {
            g_gfaFont3 = Typeface.create(fontFamily, fontStyle);
            return 0;
        }
        if (g_gfaFont4 == null) {
            g_gfaFont4 = Typeface.create(fontFamily, fontStyle);
            return 0;
        }
        if (g_gfaFont5 == null) {
            g_gfaFont5 = Typeface.create(fontFamily, fontStyle);
            return 0;
        }
        return -1;
    }

    public static int GFA_SetFont(int fontId) {
        int oldFontId = g_gfaCurFont;
        if (fontId == g_gfaCurFont) {
            return fontId;
        }
        switch (fontId) {
            case 0:
                if (g_gfaFont1 != null) {
                    g_gfaPaint.setTypeface(g_gfaFont1);
                    g_gfaCurFont = 0;
                }
                break;
            case 1:
                if (g_gfaFont2 != null) {
                    g_gfaPaint.setTypeface(g_gfaFont2);
                    g_gfaCurFont = 1;
                }
                break;
            case 2:
                if (g_gfaFont3 != null) {
                    g_gfaPaint.setTypeface(g_gfaFont3);
                    g_gfaCurFont = 2;
                }
                break;
            case 3:
                if (g_gfaFont4 != null) {
                    g_gfaPaint.setTypeface(g_gfaFont4);
                    g_gfaCurFont = 3;
                }
                break;
            case 4:
                if (g_gfaFont5 != null) {
                    g_gfaPaint.setTypeface(g_gfaFont5);
                    g_gfaCurFont = 4;
                }
                break;
        }
        g_gfaFontMetrics = g_gfaPaint.getFontMetrics();
        return oldFontId;
    }

    public static void GFA_ReleaseFont(int fontId) {
        switch (fontId) {
            case 0:
                if (g_gfaFont1 != null) {
                    g_gfaFont1 = null;
                }
                break;
            case 1:
                if (g_gfaFont2 != null) {
                    g_gfaFont2 = null;
                }
                break;
            case 2:
                if (g_gfaFont3 != null) {
                    g_gfaFont3 = null;
                }
                break;
            case 3:
                if (g_gfaFont4 != null) {
                    g_gfaFont4 = null;
                }
                break;
            case 4:
                if (g_gfaFont5 != null) {
                    g_gfaFont5 = null;
                }
                break;
        }
        if (g_gfaCurFont == fontId) {
            g_gfaCurFont = -1;
        }
        g_gfaPaint.setTypeface(null);
        g_gfaFontMetrics = g_gfaPaint.getFontMetrics();
    }

    public static int GFA_GetAscent() {
        return (int) (-Math.ceil(g_gfaPaint.ascent()));
    }

    public static int GFA_GetDescent() {
        return (int) Math.ceil(g_gfaPaint.descent());
    }

    public static int GFA_CharWidth() {
        int len = "뷁".length();
        float[] widths = new float[len];
        int actualCount = g_gfaPaint.getTextWidths("뷁", widths);
        float result = 0.0f;
        for (int i = 0; i < actualCount; i++) {
            result += widths[i];
        }
        return (int) result;
    }

    public static int GFA_CharHeight() {
        return (int) (g_gfaFontMetrics.ascent + g_gfaFontMetrics.descent);
    }

    public static int GFA_GetCurrentFont() {
        return g_gfaCurFont;
    }

    public static float GFA_GetTextWidth(String text, int nChars) {
        float[] widths = new float[nChars];
        int actualCount = g_gfaPaint.getTextWidths(text, 0, nChars, widths);
        float result = 0.0f;
        for (int i = 0; i < actualCount; i++) {
            result += widths[i];
        }
        return result;
    }

    public static void GFA_SetColor(int color) {
        g_gfaPaint.setColor(color);
    }

    public static int GFA_GetColor() {
        return g_gfaPaint.getColor();
    }

    public static void GFA_SetTextAlign(int align) {
        Paint.Align _align;
        Paint.Align align2 = Paint.Align.LEFT;
        switch (align) {
            case 0:
                _align = Paint.Align.CENTER;
                break;
            case 1:
            default:
                _align = Paint.Align.LEFT;
                break;
            case 2:
                _align = Paint.Align.RIGHT;
                break;
        }
        g_gfaPaint.setTextAlign(_align);
    }

    public static void GFA_SetTextSize(float size) {
        g_gfaPaint.setTextSize(size);
    }

    /* JADX WARN: Incorrect condition in loop: B:6:0x000d */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static float[] GFA_DrawText(String string, float x, float y, int nChars, float maxWidth) {
        float yy;
        String subStr;
        String strText = string.substring(0, nChars);
        switch (g_gfaBPP) {
            case 16:
                Canvas canvas = g_gfaCanvas;
                int nChars2 = g_gfaColorkey;
                canvas.drawColor(nChars2);
                break;
            default:
                for (int i = 0; i < nChars; i++) {
                    g_gfaIntBuf[i] = 0;
                    break;
                }
                g_gfaBitmap.copyPixelsFromBuffer(g_gfaBuffer);
                break;
        }
        g_gfaMeasureRect[0] = x;
        g_gfaMeasureRect[1] = y;
        g_gfaMeasureRect[2] = 0.0f;
        g_gfaMeasureRect[3] = 0.0f;
        float fH = g_gfaFontMetrics.descent + (-g_gfaFontMetrics.ascent);
        int wbCnt = 0;
        float yy2 = y + fH;
        String subStr2 = strText;
        while (true) {
            int subLen = subStr2.length();
            int charCnt = g_gfaPaint.breakText(subStr2, true, maxWidth, null);
            if (charCnt >= subLen) {
                g_gfaCanvas.drawText(subStr2, x, yy2, g_gfaPaint);
                float size = g_gfaPaint.measureText(subStr2);
                if (g_gfaMeasureRect[2] < size) {
                    g_gfaMeasureRect[2] = size;
                    yy = yy2;
                } else {
                    yy = yy2;
                }
            } else {
                int breakLength = 0;
                g_wordBreaker.setText(subStr2);
                int start = g_wordBreaker.first();
                for (int end = g_wordBreaker.next(); end != -1 && (end - start) + breakLength <= charCnt; end = g_wordBreaker.next()) {
                    breakLength += end - start;
                    start = end;
                }
                String showStr = subStr2;
                if (breakLength > 0) {
                    showStr = subStr2.substring(0, breakLength);
                    subStr = subStr2.substring(breakLength);
                } else {
                    subStr = "";
                }
                g_gfaCanvas.drawText(showStr, x, yy2, g_gfaPaint);
                float yy3 = yy2 + fH;
                float size2 = g_gfaPaint.measureText(showStr);
                if (g_gfaMeasureRect[2] < size2) {
                    g_gfaMeasureRect[2] = size2;
                }
                if (breakLength <= 0) {
                    yy = yy3;
                } else {
                    int breakLength2 = wbCnt + 1;
                    subStr2 = subStr;
                    wbCnt = breakLength2;
                    yy2 = yy3;
                }
            }
        }
        g_gfaMeasureRect[3] = (yy - g_gfaMeasureRect[1]) + g_gfaFontMetrics.descent;
        return g_gfaMeasureRect;
    }

    public static short[] GFA_GetPixels16() {
        g_gfaBitmap.copyPixelsToBuffer(g_gfaBuffer);
        g_gfaBuffer.rewind();
        return g_gfaShortBuf;
    }

    public static int[] GFA_GetPixels32() {
        g_gfaBitmap.copyPixelsToBuffer(g_gfaBuffer);
        g_gfaBuffer.rewind();
        return g_gfaIntBuf;
    }

    public static float[] GFA_MeasureText(String string, int nChars, float maxWidth) {
        float maxWidth2;
        String subStr;
        String strText = string.substring(0, nChars);
        g_gfaMeasureSize[0] = 0.0f;
        g_gfaMeasureSize[1] = 0.0f;
        float fH = (-g_gfaFontMetrics.ascent) + g_gfaFontMetrics.descent;
        String subStr2 = strText;
        int wbCnt = 0;
        float yy = fH;
        while (true) {
            int subLen = subStr2.length();
            int charCnt = g_gfaPaint.breakText(subStr2, true, maxWidth, null);
            if (charCnt < subLen) {
                int breakLength = 0;
                g_wordBreaker.setText(subStr2);
                int start = g_wordBreaker.first();
                for (int end = g_wordBreaker.next(); end != -1 && (end - start) + breakLength <= charCnt; end = g_wordBreaker.next()) {
                    breakLength += end - start;
                    start = end;
                }
                String showStr = subStr2;
                if (breakLength > 0) {
                    showStr = subStr2.substring(0, breakLength);
                    subStr = subStr2.substring(breakLength);
                } else {
                    subStr = "";
                }
                float yy2 = yy + fH;
                float size = g_gfaPaint.measureText(showStr);
                if (g_gfaMeasureSize[0] < size) {
                    g_gfaMeasureSize[0] = size;
                }
                if (breakLength <= 0) {
                    maxWidth2 = yy2;
                    break;
                }
                int breakLength2 = wbCnt + 1;
                subStr2 = subStr;
                wbCnt = breakLength2;
                yy = yy2;
            } else {
                float size2 = g_gfaPaint.measureText(subStr2);
                if (g_gfaMeasureSize[0] < size2) {
                    g_gfaMeasureSize[0] = size2;
                    maxWidth2 = yy;
                } else {
                    maxWidth2 = yy;
                }
            }
        }
        float[] fArr = g_gfaMeasureSize;
        float yy3 = maxWidth2 + g_gfaFontMetrics.descent;
        fArr[1] = yy3;
        return g_gfaMeasureSize;
    }
}
