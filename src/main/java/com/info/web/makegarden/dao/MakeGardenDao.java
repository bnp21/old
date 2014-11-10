package com.info.web.makegarden.dao;

import com.info.web.domain.Email;
import com.info.web.domain.MakeGarden;

import java.util.List;


/**
 * <pre>
 * 창조마당
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
public interface MakeGardenDao {
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

    /*창조마당 메일담당자 리스트 가져오기 */
    public List<Email> getEmailReceivers(Email email);

}
