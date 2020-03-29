package org.csu.mypetstore;

import org.csu.mypetstore.domain.Account;
import org.csu.mypetstore.domain.Category;
import org.csu.mypetstore.domain.Item;
import org.csu.mypetstore.domain.Product;
import org.csu.mypetstore.service.AccountService;
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
        System.out.println(p.getProductId()+","+p.getName()+p.getDescription());
    }

    @Test
    void testProductList(){
        List<Product> productlist = catalogService.getProductListByCategory("BIRDS");
        System.out.println(productlist.size());
    }


    @Test
    void testItem(){
        Item i = catalogService.getItem("EST-1");
        System.out.println(i.getItemId()+","+i.getProductId()+","+i.getListPrice()+i.getAttribute1()+","+i.getStatus());
    }

    @Test
    void testAccout(){
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
}
