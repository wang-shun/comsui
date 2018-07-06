package com.zufangbao.earth.api.test.post;

import com.zufangbao.sun.utils.StringUtils;
import com.zufangbao.wellsfargo.api.util.ApiSignUtils;

import java.util.*;
import java.util.Map.Entry;


//public class BaseApiTestPost extends AbstractTransactionalJUnit4SpringContextTests{
public class BaseApiTestPost {
//    /** 本地测试用 **/
//    public static final String QUERY_URL_TEST = "http://127.0.0.1:9090/api/query";
//    public static final String MODIFY_URL_TEST = "http://127.0.0.1:9090/api/modify";
//    public static final String COMMAND_URL_TEST = "http://127.0.0.1:9090/api/command";
//    //public static final String DEDUCT_QUERY_TEST = "http://127.0.0.1:9090:29084/api/query";
//    public static final String REMITTANCECOMMAND_URL_TEST = "http://192.168.0.204:27082/api/command";
//    //public static final String DEDUCT_QUERY_TEST = "http://127.0.0.1:9090/api/query";

//    public static final String QUERY_URL_TEST = "http://127.0.0.1:9090/api/query";
//    public static final String MODIFY_URL_TEST = "http://127.0.0.1:9090/api/modify";git
//    public static final String COMMAND_URL_TEST = "http://127.0.0.1:9090/api/command";
//    public static final String REMITTANCECOMMAND_URL_TEST = "http://192.168.0.204:27082/api/command";
    /** 测试发布用 **/
    public static final String QUERY_URL_TEST = "http://yunxin.5veda.net/api/query";
  //  public static final String MODIFY_URL_TEST = "http://contra.5veda.net/api/v3/importAssetPackage";
    public static final String MODIFY_URL_TEST = "http://yunxin.5veda.net/api/modify";
    public static final String COMMAND_URL_TEST = "http://deduct.5veda.net/api/command";
    public static final String DEDUCT_QUERY_TEST = "http://121.40.230.133:29084/api/query";
    public static final String REMITTANCECOMMAND_URL_TEST = "http://remittance.5veda.net/api/command";
	  public static final String PAYMENT_ORDER="http://contra.5veda.net/api/v2/paymentOrder";
	  public static final String REPAYMENT_ORDER="http://contra.5veda.net/api/v2/repaymentOrder";

//    /**内网测试**/
//    public static final String QUERY_URL_TEST=    "http://192.168.0.128/api/query";
////    public static final String MODIFY_URL_TEST = "http://192.168.0.128:80/api/modify";
//    public static final String MODIFY_URL_TEST ="http://192.168.0.212:7778/api/v3/importAssetPackage";
//    
//    public static final String COMMAND_URL_TEST = "http://192.168.0.212:8083/api/command";
////    /*remittance*/
//    public static final String REMITTANCECOMMAND_URL_TEST = "http://192.168.0.212:18085/api/command";
//    public static final String MODIFY_REMITTANCE_APPLICATION = "http://192.168.0.128:27082/api/v2/modify-remittanceApplication";
//    public static final String DEDUCT_QUERY_TEST=    "http://192.168.0.128:83/api/query";
//    public static final String PAYMENT_ORDER="http://192.168.0.212:7778/api/v2/paymentOrder";
//    public static final String REPAYMENT_ORDER="http://192.168.0.212:7778/api/v2/repaymentOrder";



     
     
    public static final String TEST_MERID = "t_test_zfb";
    public static final String TEST_SECRET = "123456";
    
    /** t_merchant的私钥 **/
    public  String privateKey = "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAOXUGOKdEkssOI1zqNw4pb6emH1o1JYxooyTQ7FN1IBNqTJLuvA3GsswXIkuQj0imce6ywG/XOCwc9R1l5FwcORtwx2FihGCl7eBkhUwnT0EwGOEARPh96ey+TfvsvRaHOn672v1TEhajAftgm4l7fJDtHdGBjHOs+5Mlir9Z65RAgMBAAECgYEArtAiUZR5yrYLGgTEhyWLZK+Le7CWKtv8MQL+tUlm/mST8s7JlVfEyJKzgCCwf4HnCJXbPiwJgFqW8B61uAmXw6cEoPftEnzvKBTyISt/iEf7DTWKGkDBnlYM9sFU6pU61jw17XEDQRtSBG6cfrlGSelqf25+c8onxu4YwTeLH/ECQQD/H69tPy0FYRvCJ5yXdXEVCKshNN01P+UdDzGtyysE/gmpalbewT+uznApa0qFntcYb8eSpUJzrUlItSCBGUpdAkEA5p4r3qF+4g5V7MBHm3+v1l9JKxYK76990AQJa122rfkY2EEVuvU+8KIAQpVflu/HpDe8QH4mQZTsZj24Skt8hQJAL5j2vrgRqzZB2ohPY8aKcXUrkEdvmdaw5SoHh7gm74iBvvTS/j4ppnBnZqLYxXMsCCgaoNZqPnCvAnygctWIFQJAHm2KLkKyohLwJV+tUwgC5E8IMWYkJUHLYNHXiFICE2xFaesUeel313oYfLCGvzx9493yubOrSoXitw63rR3OnQJBALwGSnGYodmJB5k7un0X6LlO4nSu/+SX9lweloZ1AUg15IuCIYxHAFKwOtOJmx/eMcITaLq8l1qzZ907UXY+Mfs=";

    
    public Map<String, String> getIdentityInfoMap(Map<String, String> requestParams) {
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("merId", TEST_MERID);
        headers.put("secret", TEST_SECRET);
        String signContent = ApiSignUtils.getSignCheckContent(requestParams);
        String sign = ApiSignUtils.rsaSign(signContent, privateKey);
        headers.put("sign", sign);
        return headers;
    }
    
    public String buildParams(Map<String, String> params) {
        StringBuffer buffer = new StringBuffer();
        List<String> keys = new ArrayList<String>(params.keySet());
        Collections.sort(keys);
        for (Entry<String, String> entry : params.entrySet()) {
            String value = entry.getValue();
            value = StringUtils.isEmpty(value) ? "" : value;
            buffer.append(entry.getKey() + "=" + value + "&");
        }
        return buffer.toString();
    }
    
}

