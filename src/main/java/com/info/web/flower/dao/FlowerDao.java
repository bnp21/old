package com.info.web.flower.dao;


import com.info.web.domain.FlowerVolume;
import com.info.web.domain.Grain;
import com.info.web.domain.InternationalRawMaterial;

import java.util.List;


public interface FlowerDao {
    /**
     *화훼 거래시세 데이터 리스트
     *
     * @param flowerVolume
     * @return 화훼 거래시세 데이터 리스트
     */
    public List<FlowerVolume> selectFlowerVolumeList(FlowerVolume flowerVolume);

    /*화훼 거래시세 최근 경매일*/
    public FlowerVolume selectFlowerVolumeTop(FlowerVolume flowerVolume);

}
