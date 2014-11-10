package com.info.web.makegarden.service;

import com.info.web.domain.Email;
import com.info.web.domain.MakeGarden;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * <pre>
 * 창조마당
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.09.13
 */
public interface MakeGardenService {
    /**
     *창조마당 데이터 리스트
     *
     * @param makeGarden
     * @return 창조마당 데이터 리스트
     */
    public List<MakeGarden> selectMakeGardenList(MakeGarden makeGarden);

    /*창조마당 데이터 가져오기*/
    public MakeGarden selectMakeGardenView(MakeGarden makeGarden);

    /*창조마당 등록*/
    public int insertMakeGarden(MakeGarden makeGarden);

    /*창조마당 수정*/
    public int updateMakeGarden(MakeGarden makeGarden);

    /*창조마당 메일보내기*/
    public int sendMail(Email email, HttpServletRequest request);

    /*창조마당 어드민 메일보내기*/
    public int sendAdminMail(Email email, HttpServletRequest request);
}
