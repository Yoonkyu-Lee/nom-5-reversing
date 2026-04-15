package com.p002kt.olleh.manager.purchase;

import java.lang.reflect.Method;
import java.security.MessageDigest;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: loaded from: classes.dex */
public class AES {
    private Cipher mCipher;
    private IvParameterSpec mIv;
    private SecretKeySpec mKey;

    public AES(String key, String iv) throws Exception {
        if (key == null || "".equals(key)) {
            throw new NullPointerException("The key can not be null or an empty string..");
        }
        if (iv == null || "".equals(iv)) {
            throw new NullPointerException("The initial vector can not be null or an empty string..");
        }
        this.mCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        this.mKey = new SecretKeySpec(md5.digest(key.getBytes("UTF-8")), "AES");
        this.mIv = new IvParameterSpec(md5.digest(iv.getBytes("UTF-8")));
    }

    public String encrypt(String value) throws Exception {
        if (value == null || "".equals(value)) {
            throw new NullPointerException("The cipher string can not be null or an empty string..");
        }
        if (this.mIv == null || "".equals(this.mIv)) {
            this.mCipher.init(1, this.mKey);
        } else {
            this.mCipher.init(1, this.mKey, this.mIv);
        }
        byte[] utf8Value = value.getBytes("UTF-8");
        byte[] encryptedValue = this.mCipher.doFinal(utf8Value);
        return new String(encodeBase64(encryptedValue));
    }

    public String decrypt(String value) throws Exception {
        if (value == null || "".equals(value)) {
            throw new NullPointerException("The cipher string can not be null or an empty string.");
        }
        if (this.mIv == null || "".equals(this.mIv)) {
            this.mCipher.init(2, this.mKey);
        } else {
            this.mCipher.init(2, this.mKey, this.mIv);
        }
        byte[] encryptedValue = decodeBase64(value.getBytes());
        byte[] decryptedValue = this.mCipher.doFinal(encryptedValue);
        return new String(decryptedValue, "UTF-8");
    }

    public static byte[] encodeBase64(byte[] binaryData) {
        byte[] buf = (byte[]) null;
        try {
            Class<?> Base64 = Class.forName("org.apache.commons.codec.binary.Base64");
            Method encodeBase64 = Base64.getMethod("encodeBase64", byte[].class);
            byte[] buf2 = (byte[]) encodeBase64.invoke(Base64, binaryData);
            return buf2;
        } catch (Exception e) {
            e.printStackTrace();
            return buf;
        }
    }

    public static byte[] decodeBase64(byte[] base64Data) {
        byte[] buf = (byte[]) null;
        try {
            Class<?> Base64 = Class.forName("org.apache.commons.codec.binary.Base64");
            Method decodeBase64 = Base64.getMethod("decodeBase64", byte[].class);
            byte[] buf2 = (byte[]) decodeBase64.invoke(Base64, base64Data);
            return buf2;
        } catch (Exception e) {
            e.printStackTrace();
            return buf;
        }
    }
}
