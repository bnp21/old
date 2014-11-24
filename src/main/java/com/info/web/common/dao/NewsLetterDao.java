package com.info.web.common.dao;

import com.info.web.domain.NewsLetter;

import java.util.List;

/**
 * Created by Ljd on 2014-11-10.
 */

public interface NewsLetterDao {

    public List<NewsLetter> selectNewsLetterList(NewsLetter newsLetter);

}
