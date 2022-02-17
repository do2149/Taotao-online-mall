package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;



public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101000656115";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCr6RxkLJjCXyvvyVcippuL7NZLLtt25bTeXZr/tXFkggbk295mQgJAUk+McZoNbEsGlWdy9FPA4kWtDN2goRYu7rf85M+Aknq2ncMq0rH4hc1vEuoFwpXmMVv/QOGdl1DJkmMTKURv8bJxbcZvM4hpcajvVH4xH3PigTNvVxWrVZ6YMrfZ3oTFRF1iA9gzlY1x45+mS91+Z/1UGlqF5xSdEv4j2/VwXskVFIdeLCzTAgn2VxTbUF3XsBGl8axfXiDaTIjciYp1VnVaolH0llzBPeNPVfSOX50BLbw0Sb4Yy1CjzW8NfEg/n5FuY2ZerCQI6/Vcf9OGhfJIvaZe83QBAgMBAAECggEAfbpovE7tjkLCxIWRh9MoMecON0BW3BdV98eoA9p0yxhZ6Glxt4IRWW+ZpFK1Y5nPKUp9tVJCKvCSGuUs9jy6F6sZvwitRhBbVVH+mkQsS2G4hMLliz7sGMYCzaVrHLG9MR8x/KKS3fh8FH8/wLaEzvGEpz05ab3iKEdsEcM0IvCvOYrM5gCMFNSaHizKfiX4BNK7HjK8DWUl3Y5AZUSTU/6uUUX/LE1pOLRjqM3fVcvW8vRk6ZfF+BxfKJFRZxv44CiN1Y9RQ7ziD/4HwSSjNGepedFWkq3Yq21Aa2E6UESaivXkw7/GrrMfX1P1HwHv62d1w3F5wo5/Qeu7z9NprQKBgQDurKnoEI64JQVlc+bLNWFn7RuqxvmAiJHZIzoJedw+FxKonHACyMA31gmw50bSBXNKxI0aXNXmg+zhmR2dXB8fOlXOETDOnxNeKt/ctqQ4oKQ7WQ8YVhJXzZPTXT8RaYf8QoLTHprUFNsnGiuoAxRRGc1QprC9VzpRt2DeNZWFBwKBgQC4Y8Ksf9agmnPh1IkuaXm2W3mcC980Sa25fASvDSikmnJXdnI+FvBg0DfrVgkBVQVO15J2+MMzzSlshBnssGZSVQmsnQM1hVsLy3tLstvGxYaopKKVrP7PGuIogGFduyyE58wQ5dicsownGsdcaL9mt8++vifZC8gbFqBEWQjEtwKBgQCgfs9KVEgEoDB+xm9+WokDv7gJIQAKZMvevgd6880cm5tacsgHt0M6yN1/biZ7eFrM/lr8TU0xU6lpEvONK7Np5mpoxbqSVvpJKn+bBd5sjemiVwMFlGuFS6KKUXvlk5d0FK2wljX7Q4MTSk/tDRUObFFaWJ0k1ZFL/gpPoqzG5QKBgQCzAHXOjFRJmWeCBpgeLFryAx+ts4C9/ADgnlrVrYqVMTJrYhtJ128ILVr75YvcdTMv9OrFAH5P3Y2nQR8BvcW3i8JWhh7FaG6YprNNK5dcAgnV0e3cLBM57zk6ZFchbUGszHI4vUlp5ZNVqxN6zF1zVGIjI+r/NAbQ9Ugk0eJHRQKBgC+kyRPbK20S2k/rBbrOlrGO8UioJdz01NbbHQU0ws2ZdGYaOrOS9PTaF0b9kbdb4mRjEcWsQkHnE3N/z3j3VjTahLkHAwlIhabpMUEhQTa79tmMOJNsocYFuMuq4olRYK2YiW3dv+u2vGAg5dhRMZDS0GN9lQTlryFBba8E96m/";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq+kcZCyYwl8r78lXIqabi+zWSy7bduW03l2a/7VxZIIG5NveZkICQFJPjHGaDWxLBpVncvRTwOJFrQzdoKEWLu63/OTPgJJ6tp3DKtKx+IXNbxLqBcKV5jFb/0DhnZdQyZJjEylEb/GycW3GbzOIaXGo71R+MR9z4oEzb1cVq1WemDK32d6ExURdYgPYM5WNceOfpkvdfmf9VBpahecUnRL+I9v1cF7JFRSHXiws0wIJ9lcU21Bd17ARpfGsX14g2kyI3ImKdVZ1WqJR9JZcwT3jT1X0jl+dAS28NEm+GMtQo81vDXxIP5+RbmNmXqwkCOv1XH/ThoXySL2mXvN0AQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/SnackShop/shop/index";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

