package org.csu.mypetstore.aop;


import org.apache.catalina.Session;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.csu.mypetstore.domain.Account;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Aspect
@Component
public class ControllerAOP {

    //将account 从seesion中取出来并加入到model中
    @Pointcut("execution(public * org.csu.mypetstore.controller.CartController.viewCart(..) )" +
            "&&execution (public * org.csu.mypetstore.controller.CartController.addItemCart(..) )")
    public void accountUsedController()
    {

    }

    @Before("accountUsedController()")
    public void beforeAccountUsedController() {

        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = ((ServletRequestAttributes) requestAttributes).getRequest();
        HttpSession httpSession = request.getSession();
        Account account =(Account) httpSession.getAttribute("account");
    }

}
