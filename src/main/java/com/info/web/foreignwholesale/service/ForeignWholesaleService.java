package com.info.web.foreignwholesale.service;

import com.info.web.domain.ForeignWholesale;

import java.util.List;


/**
 * <pre>
 * 해외 농산물 도매 가격
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.08.08
 */
public interface ForeignWholesaleService {
    /**
     *해외 농산물 도매 가격 데이터 리스트
     *
     * @param foreignWholesale
     * @return 해외 농산물 도매 가격 데이터 리스트
     */
    public List<ForeignWholesale> selectForeignWholesaleList(ForeignWholesale foreignWholesale);

    /*해외 농산물 도매 가격 최근일자*/
    public ForeignWholesale selectForeignWholesaleTop(ForeignWholesale foreignWholesale);
}
