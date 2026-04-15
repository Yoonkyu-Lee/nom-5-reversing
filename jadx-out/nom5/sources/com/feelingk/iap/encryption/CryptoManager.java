package com.feelingk.iap.encryption;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: loaded from: classes.dex */
public class CryptoManager {
    private static final String HEX = "0123456789ABCDEF";
    private static final String innerKey = "ahqkdlfdhvltm000";

    public static String encrypt(String cleartext) throws Exception {
        return encrypt(innerKey, cleartext);
    }

    public static String decrypt(String encrypted) throws Exception {
        return decrypt(innerKey, encrypted);
    }

    public static String encrypt(String key, String cleartext) throws Exception {
        byte[] rawKey = key.getBytes();
        byte[] result = encrypt(rawKey, cleartext.getBytes());
        return toHex(result);
    }

    public static String decrypt(String key, String encrypted) throws Exception {
        byte[] rawKey = key.getBytes();
        byte[] enc = toByte(encrypted);
        byte[] result = decrypt(rawKey, enc);
        return new String(result);
    }

    private static byte[] encrypt(byte[] raw, byte[] clear) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(1, skeySpec);
        byte[] encrypted = cipher.doFinal(clear);
        return encrypted;
    }

    private static byte[] decrypt(byte[] raw, byte[] encrypted) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(2, skeySpec);
        byte[] decrypted = cipher.doFinal(encrypted);
        return decrypted;
    }

    public static String toHex(String txt) {
        return toHex(txt.getBytes());
    }

    public static String fromHex(String hex) {
        return new String(toByte(hex));
    }

    public static byte[] toByte(String hexString) {
        int len = hexString.length() / 2;
        byte[] result = new byte[len];
        for (int i = 0; i < len; i++) {
            result[i] = Integer.valueOf(hexString.substring(i * 2, (i * 2) + 2), 16).byteValue();
        }
        return result;
    }

    public static String toHex(byte[] buf) {
        if (buf == null) {
            return "";
        }
        StringBuffer result = new StringBuffer(buf.length * 2);
        for (byte b : buf) {
            appendHex(result, b);
        }
        return result.toString();
    }

    private static void appendHex(StringBuffer sb, byte b) {
        sb.append(HEX.charAt((b >> 4) & 15)).append(HEX.charAt(b & 15));
    }

    public String md5(String cleartext) {
        try {
            MessageDigest digest = MessageDigest.getInstance("MD5");
            digest.update(cleartext.getBytes());
            byte[] messageDigest = digest.digest();
            StringBuffer hexString = new StringBuffer();
            for (byte b : messageDigest) {
                hexString.append(Integer.toHexString(b & 255));
            }
            return hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static byte[] getInitialVector(byte[] keyBytes) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.reset();
        md5.update(keyBytes);
        byte[] initialVector = md5.digest();
        return initialVector;
    }

    public static byte[] getKey(byte[] initialVector) throws NoSuchAlgorithmException {
        MessageDigest md5 = MessageDigest.getInstance("MD5");
        md5.reset();
        md5.update(initialVector);
        byte[] key = md5.digest();
        return key;
    }

    public static byte[] encript(byte[] value, byte[] key, byte[] initialVetor) {
        byte[] encryptedText = (byte[]) null;
        try {
            Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
            SecretKeySpec sks = new SecretKeySpec(key, "AES");
            IvParameterSpec ips = new IvParameterSpec(initialVetor);
            c.init(1, sks, ips);
            byte[] encryptedText2 = c.doFinal(value);
            return encryptedText2;
        } catch (Exception e) {
            e.printStackTrace();
            return encryptedText;
        }
    }

    public static byte[] decript(byte[] value, byte[] key, byte[] initialVecor) {
        byte[] encryptedText = (byte[]) null;
        try {
            Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
            SecretKeySpec sks = new SecretKeySpec(key, "AES");
            IvParameterSpec ips = new IvParameterSpec(initialVecor);
            c.init(2, sks, ips);
            byte[] encryptedText2 = c.doFinal(value);
            return encryptedText2;
        } catch (Exception e) {
            e.printStackTrace();
            return encryptedText;
        }
    }
}
