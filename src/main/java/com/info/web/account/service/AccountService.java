package com.info.web.account.service;

import com.info.web.domain.Account;

import java.util.List;


/**
 * <pre>
 * 계정 서비스 인터페이스.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
public interface AccountService {

    /**
     * 회원 정보 체크
     *
     * @param account
     * @return 회원 정보
     */
    public Account checkAccount(Account account);

    /**
     * 회원 정보 조회
     *
     * @param account
     * @return 회원 정보
     */
    public Account selectAccount(Account account);

    /**
     * 회원정보 목록 조회
     *
     * @param account
     * @return 회원 목록
     */
    public List<Account> selectAccountList(Account account);
    /**
     * 권한 목록 조회
     *
     * @param account
     * @return 회원 목록
     */
    public List<Account> selectAuthList(Account account);

    /**
     * 회원 가입
     *
     * @param account
     * @return 회원 가입한 여부
     */
    public int insertAccount(Account account);

    /**
     * 관리자 계정 등록
     *
     * @param account
     * @return 관리자 계정 등록
     */
    public int insertAdminAccount(Account account);

    /**
     * 계정 ID 조회
     *
     * @return 회원 정보 존재 여부
     */
    public int selectAccountId();

    /**
     * 회원 정보 수정
     *
     * @param account
     * @return 회원 수정한 여부
     */
    public int updateAccount(Account account);

    /*회원 정보 삭제*/
    public int deleteAccount(Account account);

}
