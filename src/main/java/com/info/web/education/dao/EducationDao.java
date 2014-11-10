package com.info.web.education.dao;

import com.info.web.domain.Education;

import java.util.List;


/**
 * <pre>
 * 유통교육원 인터페이스.
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.11
 */
public interface EducationDao {

    /**
     * 유통교육원 목록 조회
     *
     * @param education
     * @return AT소식 목록
     */
	public List<Education> selectEducationList(Education education);
}
