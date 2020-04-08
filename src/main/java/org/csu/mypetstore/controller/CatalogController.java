package org.csu.mypetstore.controller;

import org.csu.mypetstore.domain.Account;
import org.csu.mypetstore.domain.Category;
import org.csu.mypetstore.domain.Item;
import org.csu.mypetstore.domain.Product;
import org.csu.mypetstore.service.CatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/catalog")
public class CatalogController {
    @Autowired
    private CatalogService catalogService;

    @GetMapping("/viewMain")
    public String viewMain(Model model,HttpServletRequest httpServletRequest,String msg)
    {
        model.addAttribute("msg",msg);
        Account account =(Account) httpServletRequest.getSession().getAttribute("account");
       if(account != null)
       {
           model.addAttribute("account",account);
           model.addAttribute("msg2","Hello, "+account.getUsername()+"!");
       }
       else
       {
           model.addAttribute("msg2","Welcome to MyPetStore, look for whatever you want!");
       }

        return"/catalog/main";
    }

    @GetMapping("/viewCategory")
    public String viewCategory(String categoryId, Model model,HttpServletRequest httpServletRequest)
    {
        Account account= (Account)httpServletRequest.getSession().getAttribute("account");
        model.addAttribute("account",account);
        //原解决方案未考虑用不合法的参数请求访问，此时也应该返回原页，通过重定向实现
        Category category = catalogService.getCategory(categoryId);
        if (categoryId != null) {
            List<Product> productList = catalogService.getProductListByCategory(categoryId);
            model.addAttribute("productList", productList);
            model.addAttribute("category", category);
            return "/catalog/category";
        }
        return "redirect:/catalog/viewMain";
    }

    @GetMapping("/viewProduct")
    public String viewProduct(String productId, Model model,HttpServletRequest httpServletRequest)
    {
        Account account= (Account)httpServletRequest.getSession().getAttribute("account");
        model.addAttribute("account",account);
        Product product = catalogService.getProduct(productId);
        if(product != null)
        {
            System.out.println(product.getName());
            List<Item> itemList = catalogService.getItemListByProduct(productId);
            model.addAttribute("itemList",itemList);
            model.addAttribute("product",product);
            return "/catalog/product";
        }
        return "redirect:/catalog/viewCategory?categoryId="+((Category)model.getAttribute("category")).getCategoryId();
    }

    @GetMapping("/viewItem")
    public  String viewItem(String itemId, Model model,HttpServletRequest httpServletRequest)
    {
        Account account= (Account)httpServletRequest.getSession().getAttribute("account");
        model.addAttribute("account",account);
        Item item = catalogService.getItem(itemId);
        if(item != null)
        {
            Product product = catalogService.getProduct(item.getProductId());
            model.addAttribute("product",product);
            model.addAttribute("item",item);
            int itemInventoryQuantity = catalogService.getItemInventoryQuantity(itemId);
            model.addAttribute("itemQuantity",itemInventoryQuantity);

            return "catalog/item";
        }
        return "redirect:/catalog/viewProduct?productId="+((Product)model.getAttribute("product")).getProductId();
    }

    @PostMapping("/viewSearchProducts")
    public String viewSearchProducts(String keyword,Model model,HttpServletRequest httpServletRequest)
    {
        Account account= (Account)httpServletRequest.getSession().getAttribute("account");
        model.addAttribute("account",account);
        List<Product> productList = catalogService.searchProductList(keyword);
        model.addAttribute("productList",productList);
        return "catalog/searchProducts";
    }
}
