package com.android.vending.licensing;

import com.android.vending.licensing.util.Base64;
import com.android.vending.licensing.util.Base64DecoderException;
import com.feelingk.iap.util.Defines;
import com.gamevil.nexus2.net.NexusConstants;
import com.kaf.net.Network;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.spec.KeySpec;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: loaded from: classes.dex */
public class AESObfuscator implements Obfuscator {
    private static final String CIPHER_ALGORITHM = "AES/CBC/PKCS5Padding";

    /* JADX INFO: renamed from: IV */
    private static final byte[] f0IV = {16, 74, 71, -80, 32, 101, -47, 72, 117, -14, 0, -29, 70, 65, Defines.IAP_GATEWAY_RESPONSE.IAP_ERR_SEND_TIMEOUT_FAIL, 74};
    private static final String KEYGEN_ALGORITHM = "PBEWITHSHAAND256BITAES-CBC-BC";
    private static final String UTF8 = "UTF-8";
    private static final String header = "com.android.vending.licensing.AESObfuscator-1|";
    private Cipher mDecryptor;
    private Cipher mEncryptor;

    public AESObfuscator(byte[] salt, String applicationId, String deviceId) {
        try {
            SecretKeyFactory factory = SecretKeyFactory.getInstance(KEYGEN_ALGORITHM);
            KeySpec keySpec = new PBEKeySpec((String.valueOf(applicationId) + deviceId).toCharArray(), salt, NexusConstants.BUFFER_SIZE, Network.NETSTATUS_WIFI_PRIVATE_CONNECTING);
            SecretKey tmp = factory.generateSecret(keySpec);
            SecretKey secret = new SecretKeySpec(tmp.getEncoded(), "AES");
            this.mEncryptor = Cipher.getInstance(CIPHER_ALGORITHM);
            this.mEncryptor.init(1, secret, new IvParameterSpec(f0IV));
            this.mDecryptor = Cipher.getInstance(CIPHER_ALGORITHM);
            this.mDecryptor.init(2, secret, new IvParameterSpec(f0IV));
        } catch (GeneralSecurityException e) {
            throw new RuntimeException("Invalid environment", e);
        }
    }

    @Override // com.android.vending.licensing.Obfuscator
    public String obfuscate(String original) {
        if (original == null) {
            return null;
        }
        try {
            return Base64.encode(this.mEncryptor.doFinal((header + original).getBytes(UTF8)));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("Invalid environment", e);
        } catch (GeneralSecurityException e2) {
            throw new RuntimeException("Invalid environment", e2);
        }
    }

    @Override // com.android.vending.licensing.Obfuscator
    public String unobfuscate(String obfuscated) throws ValidationException {
        if (obfuscated == null) {
            return null;
        }
        try {
            String result = new String(this.mDecryptor.doFinal(Base64.decode(obfuscated)), UTF8);
            int headerIndex = result.indexOf(header);
            if (headerIndex != 0) {
                throw new ValidationException("Header not found (invalid data or key):" + obfuscated);
            }
            return result.substring(header.length(), result.length());
        } catch (Base64DecoderException e) {
            throw new ValidationException(String.valueOf(e.getMessage()) + ":" + obfuscated);
        } catch (UnsupportedEncodingException e2) {
            throw new RuntimeException("Invalid environment", e2);
        } catch (BadPaddingException e3) {
            throw new ValidationException(String.valueOf(e3.getMessage()) + ":" + obfuscated);
        } catch (IllegalBlockSizeException e4) {
            throw new ValidationException(String.valueOf(e4.getMessage()) + ":" + obfuscated);
        }
    }
}
