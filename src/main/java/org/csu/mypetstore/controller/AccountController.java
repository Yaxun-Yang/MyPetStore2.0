package org.csu.mypetstore.controller;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import org.apache.catalina.Session;

import org.csu.mypetstore.domain.Account;
import org.csu.mypetstore.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/account")
@SessionAttributes(value = {"account"})
public class AccountController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/viewSignIn")
    public  String viewSignIn(Model model,String msg)
    {
        model.addAttribute("msg",msg);
        return "account/signInForm";
    }

    //判断账户合法性，合法则跳转到主页否则跳转回到登录页面
    @PostMapping("/postSignInForm")
    public String postSignInForm(String username,String password, String verifyCode,Model model,HttpServletRequest httpServletRequest)
    {

        Account account = accountService.getAccount(username,password);
        if(account != null)
        {
            HttpSession session=  httpServletRequest.getSession();
            String code =(String) session.getAttribute("code");
            session.setAttribute("code",null);
            if(verifyCode.equals(code))
            {
                model.addAttribute("account",account);
               // System.out.println(httpServletRequest.getSession().getAttribute("account"));
                return "redirect:/catalog/viewMain";
            }
            else {

                model.addAttribute("msg3","Invalid verification code .Sign in failed.");
            }
        }
        else
        {
            model.addAttribute("msg3","Invalid username or password.  Sign in failed.");
        }

        return "/account/signInForm";
    }

    //用户退出，清除用户缓存，返回登录页面
    @GetMapping("/signOut")
    public String signOut(Model model, SessionStatus sessionStatus)
    {
            sessionStatus.setComplete();

            return "redirect:/catalog/viewMain";

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
//        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "**********", "***********");
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
