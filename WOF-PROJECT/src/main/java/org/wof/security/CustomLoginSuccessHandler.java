package org.wof.security;

import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.wof.service.MemberService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    MemberService service;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        List<String> roleNames = new ArrayList<>();
        authentication.getAuthorities().forEach(authority ->{roleNames.add(authority.getAuthority());
        });

        if (roleNames.contains("ROLE_ADMIN")){
            httpServletResponse.sendRedirect("member/admin");
            return;
        }
        if (roleNames.contains("ROLE_CLIENT")){
            httpServletResponse.sendRedirect("member/success/client");
            return;
        }
        if (roleNames.contains("ROLE_PARTNERS")){
            httpServletResponse.sendRedirect("member/success/partners");
            return;
        }
        if (roleNames.contains("ROLE_USER")){
            httpServletResponse.sendRedirect("/");
            return;
        }
        httpServletResponse.sendRedirect("/");
    }
}
