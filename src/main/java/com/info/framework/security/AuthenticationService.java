package com.info.framework.security;

import com.info.framework.exception.AuthenticationNotException;
import com.info.framework.exception.PasswordMismatchException;
import com.info.framework.exception.UserNotFoundException;

/**
 * <pre>
 * 회원 인증 인터페이스.
 * </pre>
 *
 * @author jaeger
 * @version 1.0, 2014.02.14
 */
public interface AuthenticationService {

    void login(String userId, String password) throws UserNotFoundException, AuthenticationNotException, PasswordMismatchException;

}
