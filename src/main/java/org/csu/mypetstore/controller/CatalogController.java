package org.csu.mypetstore.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.jws.WebParam;

@Controller
@RequestMapping("/catalog")
public class CatalogController {
    @GetMapping("/main")
    public String viewMain()
    {
        return"catalog/main";
    }


}
