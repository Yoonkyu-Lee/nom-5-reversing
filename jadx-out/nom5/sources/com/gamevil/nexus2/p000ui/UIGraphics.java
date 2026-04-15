package com.gamevil.nexus2.p000ui;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.DashPathEffect;
import android.graphics.MaskFilter;
import android.graphics.Paint;
import android.graphics.PathEffect;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.Typeface;
import com.gamevil.nexus2.NexusGLActivity;
import java.io.InputStream;

/* JADX INFO: loaded from: classes.dex */
public class UIGraphics {
    public static final int BOTTOM = 32;
    public static final int DASHED = 2;
    public static final int DOTTED = 1;
    public static final int HCENTER = 1;
    public static final int LEFT = 4;
    public static final int RIGHT = 8;
    public static final int SOLID = 0;
    public static final int TOP = 16;
    public static final int VCENTER = 2;
    private static Canvas canvas;
    private static UIGraphics graphics;
    public static int lcdCx;
    public static int lcdCy;
    public static int lcdHeight;
    public static int lcdWidth;
    private static Paint paint;
    private static PathEffect path_effect;
    private static Rect rect;
    private static RectF rectF;
    private static int strokeStyle;
    private static Paint textPaint = new Paint();
    private static Typeface typeface = Typeface.DEFAULT;

    private UIGraphics() {
        graphics = this;
        paint = new Paint();
        rect = new Rect();
        rectF = new RectF();
    }

    public static void initialize(int _lcdWidth, int _lcdHeight) {
        lcdWidth = _lcdWidth;
        lcdHeight = _lcdHeight;
        lcdCx = lcdWidth / 2;
        lcdCy = lcdHeight / 2;
    }

    public static UIGraphics getInstance() {
        return graphics;
    }

    public static void setCanvas(Canvas _canvas) {
        canvas = _canvas;
    }

    public static void drawImage(Bitmap img, int x, int y, int anchor) {
        if (anchor == 0) {
            anchor = 20;
        }
        int width = img.getWidth();
        int height = img.getHeight();
        if ((anchor & 1) != 0) {
            x -= width / 2;
        } else if ((anchor & 8) != 0) {
            x -= width;
        }
        if ((anchor & 2) != 0) {
            y -= height / 2;
        } else if ((anchor & 32) != 0) {
            y -= height;
        }
        canvas.drawBitmap(img, x, y, paint);
    }

    public static void drawFilteredImage(Bitmap img, int x, int y, int anchor, ColorFilter filter, MaskFilter mask, int _alpha) {
        paint.setColorFilter(filter);
        paint.setMaskFilter(mask);
        paint.setAntiAlias(true);
        drawImage(img, x, y, anchor, _alpha);
        paint.reset();
    }

    public static void drawImage(Bitmap img, int x, int y, int anchor, int _alpha) {
        if (anchor == 0) {
            anchor = 20;
        }
        int width = img.getWidth();
        int height = img.getHeight();
        if ((anchor & 1) != 0) {
            x -= width / 2;
        } else if ((anchor & 8) != 0) {
            x -= width;
        }
        if ((anchor & 2) != 0) {
            y -= height / 2;
        } else if ((anchor & 32) != 0) {
            y -= height;
        }
        paint.setAlpha(_alpha);
        canvas.drawBitmap(img, x, y, paint);
        paint.reset();
    }

    public static int getClipX() {
        Rect rect2 = canvas.getClipBounds();
        return rect2.left;
    }

    public static int getClipY() {
        Rect rect2 = canvas.getClipBounds();
        return rect2.top;
    }

    public static int getClipWidth() {
        Rect rect2 = canvas.getClipBounds();
        return rect2.right - rect2.left;
    }

    public static int getClipHeight() {
        Rect rect2 = canvas.getClipBounds();
        return rect2.bottom - rect2.top;
    }

    public static void clipRect(int x, int y, int width, int height) {
        canvas.clipRect(x, y, x + width, y + height, Region.Op.INTERSECT);
    }

    public static void setClip(int x, int y, int width, int height) {
        canvas.clipRect(x, y, x + width, y + height, Region.Op.REPLACE);
    }

    public static void drawRect(int x, int y, int width, int height, int color) {
        paint.setStyle(Paint.Style.STROKE);
        paint.setColor(color);
        rect.set(x, y, x + width, y + height);
        canvas.drawRect(rect, paint);
        paint.reset();
    }

    public static void fillRect(int x, int y, int width, int height, int color) {
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(color);
        rect.set(x, y, x + width, y + height);
        canvas.drawRect(rect, paint);
        paint.reset();
    }

    public static void drawLine(int x1, int y1, int x2, int y2, int color) {
        paint.setPathEffect(path_effect);
        paint.setColor(color);
        paint.setStyle(Paint.Style.STROKE);
        canvas.drawLine(x1, y1, x2, y2, paint);
        paint.reset();
    }

    public static void fillArc(int x, int y, int width, int height, int startAngle, int arcAngle, int color) {
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(color);
        rectF.set(x, y, x + width, y + height);
        canvas.drawArc(rectF, startAngle, arcAngle, true, paint);
        paint.reset();
    }

    public static void drawArc(int x, int y, int width, int height, int startAngle, int arcAngle, int color) {
        paint.setStyle(Paint.Style.STROKE);
        paint.setColor(color);
        rectF.set(x, y, x + width, y + height);
        canvas.drawArc(rectF, startAngle, arcAngle, true, paint);
        paint.reset();
    }

    public static void drawRoundRect(int x, int y, int width, int height, int rx, int ry, int color) {
        paint.setStyle(Paint.Style.STROKE);
        paint.setColor(color);
        rectF.set(x, y, x + width, y + height);
        canvas.drawRoundRect(rectF, rx, ry, paint);
        paint.reset();
    }

    public static void fillRoundRect(int x, int y, int width, int height, int rx, int ry, int color) {
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(color);
        rectF.set(x, y, x + width, y + height);
        canvas.drawRoundRect(rectF, rx, ry, paint);
        paint.reset();
    }

    public static void fillRoundRect(int x, int y, int width, int height, int rx, int ry, int color, Paint p) {
        p.setStyle(Paint.Style.FILL);
        p.setColor(color);
        rectF.set(x, y, x + width, y + height);
        canvas.drawRoundRect(rectF, rx, ry, p);
    }

    public static void translate(int x, int y) {
        canvas.translate(x, y);
    }

    public static void setStrokeStyle(int style) {
        if (style == 0) {
            setStrokeStyleSolid();
        } else if (style == 1) {
            setStrokeStyleDotted(5, 0);
        } else if (style == 2) {
            setStrokeStyleDashed(new float[]{10.0f, 5.0f, 5.0f, 5.0f}, 0);
        }
    }

    public static int getStrokeStyle() {
        return strokeStyle;
    }

    public static void setStrokeStyleSolid() {
        strokeStyle = 0;
        path_effect = null;
    }

    public static void setStrokeStyleDotted(int interval, int phase) {
        strokeStyle = 1;
        float[] intervals = {interval, interval};
        path_effect = new DashPathEffect(intervals, phase);
    }

    public static void setStrokeStyleDashed(float[] intervals, int phase) {
        strokeStyle = 2;
        path_effect = new DashPathEffect(intervals, phase);
    }

    public static void setStrokeWidth(int width) {
        paint.setStrokeWidth(width);
    }

    public static int getStrokeWidth() {
        return (int) paint.getStrokeWidth();
    }

    public static void setAlpha(int alpha) {
        paint.setAlpha(alpha);
    }

    public static void save() {
        canvas.save();
    }

    public static void restore() {
        canvas.restore();
    }

    public static void drawImageRotate(Bitmap img, int x, int y, int degrees) {
        canvas.save();
        canvas.rotate(degrees, (img.getWidth() / 2) + x, (img.getHeight() / 2) + y);
        canvas.drawBitmap(img, x, y, paint);
        canvas.restore();
    }

    public static void drawEnlargedImage(Bitmap img, int x, int y, float ratioX, float ratioY, int anchor) {
        if (anchor == 0) {
            anchor = 20;
        }
        int width = img.getWidth();
        int height = img.getHeight();
        if ((anchor & 1) != 0) {
            x = (int) (x - ((width * ratioX) / 2.0f));
        } else if ((anchor & 8) != 0) {
            x -= width;
        }
        if ((anchor & 2) != 0) {
            y = (int) (y - ((height * ratioY) / 2.0f));
        } else if ((anchor & 32) != 0) {
            y -= height;
        }
        canvas.save();
        canvas.scale(ratioX, ratioY, x, y);
        canvas.drawBitmap(img, x, y, (Paint) null);
        canvas.restore();
    }

    public static void setTypeface(Typeface _typeface) {
        typeface = _typeface;
    }

    public static void drawString(String s, int x, int y, int size, int color, int anchor) {
        textPaint.setColor(color);
        if ((anchor & 1) != 0) {
            textPaint.setTextAlign(Paint.Align.CENTER);
        } else if ((anchor & 4) != 0) {
            textPaint.setTextAlign(Paint.Align.LEFT);
        } else if ((anchor & 8) != 0) {
            textPaint.setTextAlign(Paint.Align.RIGHT);
        }
        if ((anchor & 2) != 0) {
            y += size / 2;
        }
        textPaint.setTypeface(typeface);
        textPaint.setTextSize(size);
        canvas.drawText(s, x, y, textPaint);
    }

    public static void drawChar(char[] text, int x, int y, int index, int count, int size, int color, int anchor) {
        textPaint.setColor(color);
        if ((anchor & 1) != 0) {
            textPaint.setTextAlign(Paint.Align.CENTER);
        } else if ((anchor & 4) != 0) {
            textPaint.setTextAlign(Paint.Align.LEFT);
        } else if ((anchor & 8) != 0) {
            textPaint.setTextAlign(Paint.Align.RIGHT);
        }
        if ((anchor & 2) != 0) {
            y += size / 2;
        }
        textPaint.setTypeface(typeface);
        textPaint.setTextSize(size);
        canvas.drawText(text, index, count, x, y, textPaint);
    }

    public static Bitmap createImage(String _path) {
        Bitmap img = null;
        try {
            String path = deletSlash(_path);
            InputStream is = NexusGLActivity.myActivity.getAssets().open(deletSlash(path));
            img = BitmapFactory.decodeStream(is);
            is.close();
            return img;
        } catch (Exception e) {
            return img;
        }
    }

    public static String deletSlash(String strName) {
        if (strName.substring(0, 1).equals("/")) {
            return strName.substring(1, strName.length());
        }
        return strName;
    }
}
