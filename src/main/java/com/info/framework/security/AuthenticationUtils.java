package com.info.framework.security;

import com.info.web.domain.Account;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import java.util.Collection;


/**
 * Created with IntelliJ IDEA.
 * User: Jaeger
 * Date: 13. 9. 14.
 * Time: 오후 3:45
 * To change this template use File | Settings | File Templates.
 */
public class AuthenticationUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(AuthenticationUtils.class);

    public static Authentication getAuthentication() {
        if (SecurityContextHolder.getContext() == null) {
            return null;
        }

        return SecurityContextHolder.getContext().getAuthentication();
    }

    public static Collection<? extends GrantedAuthority> getAuthorities() {
        return getAuthentication().getAuthorities();
    }

    public static boolean hasRole(LoginAuthorityType authorityType) {
        return getAuthorities().contains(new SimpleGrantedAuthority(authorityType.name()));
    }

//    public static Account getUser() {
//        return getUser(getAuthentication());
//    }
    //로그인후 세션으로 수정함 10월23일
    public static Account getUser() {
        return (Account)RequestContextHolder.getRequestAttributes().getAttribute("account", RequestAttributes.SCOPE_SESSION);
    }


    public static Account getUser(Authentication authentication) {
        if (authentication == null) {
            return Account.GUEST_USER.getGuestUser();
        }

        Object principal = authentication.getPrincipal();
        if (principal == null) {
            throw new NullPointerException("'Principal'은 반드시 값이 존재해야 합니다.");
        }

        if (principal instanceof UserDetailService) {
            UserDetailService userDetails = (UserDetailService) principal;

            return userDetails.getAccount();
        } else {
            return Account.GUEST_USER.getGuestUser();
        }
    }

    public static int getCurrentUserId() {
        if (getUser() == null) {
            Account account = Account.GUEST_USER.getGuestUser();
            return account.getId();
        }

        return getUser().getId();
    }

    public static boolean isAuthenticated() {
        if (getAuthentication() == null) {
            return false;
        }

        AuthenticationTrustResolver trustResolver = new AuthenticationTrustResolverImpl();
        if (getAuthentication().isAuthenticated()) {
            return (trustResolver.isAnonymous(getAuthentication()) == false);
        }

        return false;
    }
}
