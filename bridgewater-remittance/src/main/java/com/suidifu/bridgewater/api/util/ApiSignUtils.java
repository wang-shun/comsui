package com.suidifu.bridgewater.api.util;

import com.zufangbao.gluon.spec.earth.v3.ApiConstant;
import com.zufangbao.gluon.util.IpUtil;
import com.zufangbao.gluon.util.RequestUtil;
import com.zufangbao.gluon.util.SecurityUtil;
import com.zufangbao.sun.utils.StringUtils;
import com.zufangbao.sun.yunxin.entity.api.EncryptionMode;
import com.zufangbao.sun.yunxin.entity.api.TMerConfig;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.*;

/**
 *	接口签名工具类 
 * @author louguanyang
 *
 */
public class ApiSignUtils {
	private static final Log logger = LogFactory.getLog(ApiSignUtils.class);
	/**
	 * 空字符串 “”
	 */
	private static final String BLANK = "";
	/**
	 * MD5withRSA 签名方式
	 */
	private static final String MD5_WITH_RSA = "MD5withRSA";
	/**
	 * RSA
	 */
	private static final String RSA = "RSA";
	/**
	 * 字符 “&”
	 */
	private static final String AND = "&";
	/**
	 * 字符 “=”
	 */
	private static final String EQUAL = "=";

	public static boolean verifySign(HttpServletRequest request, TMerConfig merConfig) throws Exception {
		if(merConfig == null) {
			logger.error("验签失败，未找到到merId所关联商户！");
			return false;
		}
		//根据商户配置的接口加密策略 进行对应的解密
		if (null == merConfig.getEncryptionMode() || EncryptionMode.NONE.equals(merConfig.getEncryptionMode())) {
			return verifySignWithoutEncryption(request, merConfig);
		} else {
			return verifySignWithEncryption(request, merConfig);
		}
	}

	private static boolean verifySignWithoutEncryption(HttpServletRequest request, TMerConfig merConfig) {
		Map<String, String> requestParams = RequestUtil.getRequestParams(request);
		return verifySign(requestParams, request, merConfig.getPubKey());
	}

	private static boolean verifySignWithEncryption(HttpServletRequest request, TMerConfig merConfig) throws Exception {
		String requestBody = RequestUtil.getRequestBody(request);

		EncryptionMode encryptionMode = merConfig.getEncryptionMode();
		switch (encryptionMode) {
			case THREE_DES:
				String decryptString = SecurityUtil.threeDesDecrypt(requestBody, merConfig.getEncryptionKey());
				String sign = request.getHeader(ApiConstant.PARAMS_SIGN);
				logger.info(System.currentTimeMillis() + ", ip［" + IpUtil.getIpAddress(request) + "］, 内容验签: content［" + requestBody + "］" + ",sign［" + sign + "］");
				return rsaCheckContent(decryptString, sign, merConfig.getPubKey());
			default:
				logger.error("验签失败，不支持该加密模式！");
				return false;
		}

	}
	
	private static boolean verifySign(Map<String, String> requestParams, HttpServletRequest request, String publicKey) {
		String content = ApiSignUtils.getSignCheckContent(requestParams);
		String sign = request.getHeader(ApiConstant.PARAMS_SIGN);
		logger.info(System.currentTimeMillis() + ", ip［"+IpUtil.getIpAddress(request)+"］, 内容验签: content［"+content+"］" + ",sign［"+sign+"］");
		return rsaCheckContent(content, sign, publicKey);
	}
	
	public static boolean verifySign(String content, HttpServletRequest request, TMerConfig merConfig) {
		if(merConfig == null) {
			logger.error("验签失败，找不到merId所关联商户！");
			return false;
		}
		return verifySign(content, request, merConfig.getPubKey());
	}
	
	private static boolean verifySign(String content, HttpServletRequest request, String publicKey) {
		String sign = request.getHeader(ApiConstant.PARAMS_SIGN);
		return rsaCheckContent(content, sign, publicKey);
	}
	
	/**
	 * MD5_WITH_RSA数字签名
	 * @param content
	 * @param sign
	 * @param merId
	 * @return
	 */
	public static boolean rsaCheckContent(String content, String sign, String publicKey) {
		try {
			if(StringUtils.isEmpty(sign) || StringUtils.isEmpty(publicKey)) {
				logger.error("验签失败，sign签名为空，或者商户未上传公钥！");
				return false;
			}
			PublicKey pubKey = getPublicKey(publicKey);
			Signature signature = Signature.getInstance(MD5_WITH_RSA);
			signature.initVerify(pubKey);
			signature.update(content.getBytes());
			return signature.verify(Base64.getDecoder().decode(sign.getBytes()));
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 获取公钥
	 * @param merId
	 * @return
	 */
	private static PublicKey getPublicKey(String publicKey) {
		try {
			KeyFactory keyFactory = KeyFactory.getInstance(RSA);
			byte[] encodedKey = Base64.getDecoder().decode(publicKey);
			PublicKey pubKey = keyFactory.generatePublic(new X509EncodedKeySpec(encodedKey));
			return pubKey;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	public static String sign_and_return_result(HttpServletResponse response, String result, String privateKey) {
		String sign = ApiSignUtils.rsaSign(result, privateKey);
		if (!StringUtils.isEmpty(sign)) {
			response.addHeader(ApiConstant.PARAMS_SIGN, sign);
		}
		return result;
	}
	
	/**
	 * RSA 签名
	 * @param content
	 * @param privateKey
	 * @return
	 */
	public static String rsaSign(String content, String privateKey)  {
		try {
			PrivateKey priKey = getPrivateKeyFromPKCS8("RSA", privateKey);

			Signature signature = Signature.getInstance("MD5withRSA");

			signature.initSign(priKey);

			signature.update(content.getBytes());

			byte[] signed = signature.sign();

			return new String(Base64.getEncoder().encode(signed));
		} catch (InvalidKeySpecException e) {
			logger.error("RSA私钥格式不正确，请检查是否正确配置了PKCS8格式的私钥！", e);
		} catch (Exception e) {
			logger.error("签名错误！", e);
		}
		return null;
	}
	
	/**
	 * 获取PKCS8格式私钥
	 * @param algorithm
	 * @param privateKey
	 * @return
	 * @throws Exception
	 */
	public static PrivateKey getPrivateKeyFromPKCS8(String algorithm, String privateKey) throws Exception {
		 PKCS8EncodedKeySpec priPKCS8    = new PKCS8EncodedKeySpec( Base64.getDecoder().decode(privateKey) );
         KeyFactory keyf                 = KeyFactory.getInstance(algorithm);
         PrivateKey priKey               = keyf.generatePrivate(priPKCS8);
         return priKey;
	}
	
	/**
	 * 从请求参数中获取待签名字符串
	 * @param params
	 * @return
	 */
	public static String getSignCheckContent(Map<String, String> params) {
		if (params == null || params.isEmpty()) {
			return null;
		}
		StringBuffer content = new StringBuffer();
		List<String> keys = new ArrayList<String>(params.keySet());
		Collections.sort(keys);
		for (int i = 0; i < keys.size(); i++) {
			String key = keys.get(i);
			String value = params.get(key);
			value = StringUtils.isEmpty(value) ? "" : value;
			content.append((i == 0 ? BLANK : AND) + key + EQUAL + value);
		}
		return content.toString();
	}
}
