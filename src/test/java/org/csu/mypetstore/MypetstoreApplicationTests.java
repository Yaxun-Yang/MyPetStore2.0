package org.csu.mypetstore;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import org.csu.mypetstore.domain.*;
import org.csu.mypetstore.service.AccountService;
import org.csu.mypetstore.service.CartService;
import org.csu.mypetstore.service.CatalogService;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@MapperScan("org.csu.mypetstore.persistence")
@SpringBootTest
class MypetstoreApplicationTests {
    @Autowired
    CatalogService catalogService;
    @Autowired
    AccountService accountService;
    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
    }

    @Test
    void testCategory(){
        Category c = catalogService.getCategory("BIRD");
        System.out.println(c);
    }

    @Test
    void testProduct(){
        Product p = catalogService.getProduct("AV-CB-01");
        System.out.println(p.getProductId()+","+p.getName()+p.getImage()+p.getText());
    }

    @Test
    void testProductList(){
        List<Product> productList = catalogService.getProductListByCategory("BIRDS");
        System.out.println(productList.size());
    }


    @Test
    void testItem(){
        Item i = catalogService.getItem("EST-1");
        System.out.println(i.getItemId()+","+i.getProductId()+","+i.getUnitCost()+i.getAttribute1()+","+i.getStatus());
    }

    @Test
    void testAccount(){
        Account a = accountService.getAccount("a");
        System.out.println(a.getEmail()+","+a.getPassword()+","+a.getAddress1());
        Account temp = a;
        temp.setUsername("xyz");
        temp.setPassword("zyx");
        accountService.insertAccount(temp);

        temp.setPassword("xyz");
        temp.setEmail("xyz@csu.edu.cn");
        accountService.updateAccount(temp);
    }

    @Test
    void testCartItem()
    {
         cartService.addItem("1000","EST-1");
         CartItem cartItem = cartService.getCartItem("1000","EST-1");
         System.out.println(cartItem.getCartId()+", "+cartItem.getCategoryId()+","+cartItem.getItem().getProductId()+","+cartItem.getItemId()+", "+cartItem.getQuantity());
    }

    @Test
    void sendVerificationCode()
    {
        String code =String.valueOf((int)(Math.random()*1000));

       DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "********", "***********");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", "18307331878");
        request.putQueryParameter("SignName", "MyPetStore");
        request.putQueryParameter("TemplateCode", "SMS_186968418");
        request.putQueryParameter("TemplateParam", "{\"code\":\""+code+"\"}");
//        try {
//            CommonResponse response = client.getCommonResponse(request);
//            System.out.println(response.getData());
//        } catch (ServerException e) {
//            e.printStackTrace();
//        } catch (ClientException e) {
//            e.printStackTrace();
//        }

    }
}
