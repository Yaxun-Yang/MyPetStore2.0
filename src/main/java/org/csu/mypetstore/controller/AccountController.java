package org.csu.mypetstore.controller;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import org.csu.mypetstore.domain.Account;
import org.csu.mypetstore.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


@SessionAttributes("account,msg,code")
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/viewSignIn")
    public  String viewSignIn(Model model)
    {
        model.addAttribute("msg",null);
        return "account/signInForm";
    }

    @PostMapping("/postSignInForm")
    public String postSignInForm(String username,String password, String verifyCode,Model model,HttpServletRequest httpServletRequest)
    {

        Account account = accountService.getAccount(username,password);
        if(account != null)
        {
            String code =(String) httpServletRequest.getSession().getAttribute("code");

            if(verifyCode.equals(code))
            {
                model.addAttribute("account",account);
                return "/catalog/main";
            }
            else {
                model.addAttribute("msg","Invalid verification code .Sign in failed.");
            }
        }
        else
        {
            model.addAttribute("msg","Invalid username or password.  Sign in failed.");
        }

        return "account/signInForm";
    }

    @GetMapping("/signOut")
    public String signOut(Model model)
    {
        //退出登录
            model.addAttribute("account",null);
            model.addAttribute("msg",null);
            return "/catalog/main";

    }

    @PostMapping("/sendVerificationCode")
    @ResponseBody
    public void sendVerificationCode(@RequestParam String phoneNumber, Model model, HttpServletRequest httpServletRequest)
    {


        String code =String.valueOf((int)(Math.random()*1000000));
        httpServletRequest.getSession().setAttribute("code",code);
        //此处仅为模拟短信发送
        System.out.println("成功发送短信给"+phoneNumber+"，验证码为"+code);

        //此处为真实的短信发送
//        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4FgfSgYDH9yXHUy96voS", "PupkjLABMhSlzvwSWQT7SovsVfL7Ao");
//        IAcsClient client = new DefaultAcsClient(profile);
//
//        CommonRequest request = new CommonRequest();
//        request.setMethod(MethodType.POST);
//        request.setDomain("dysmsapi.aliyuncs.com");
//        request.setVersion("2017-05-25");
//        request.setAction("SendSms");
//        request.putQueryParameter("RegionId", "cn-hangzhou");
//        request.putQueryParameter("PhoneNumbers", phoneNumber);
//        request.putQueryParameter("SignName", "MyPetStore");
//        request.putQueryParameter("TemplateCode", "SMS_186968418");
//        request.putQueryParameter("TemplateParam", "{\"code\":\""+code+"\"}");
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
