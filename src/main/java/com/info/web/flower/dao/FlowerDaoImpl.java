package com.info.web.flower.dao;

import com.info.web.domain.FlowerVolume;
import com.info.web.domain.Grain;
import com.info.web.domain.InternationalRawMaterial;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <pre>
 * 계정 DAO 구현체.
 * </pre>
 *
 * @author 임세환
 * @version 1.0, 2013.12.11
 */
@Repository("flowerDao")
public class FlowerDaoImpl implements FlowerDao {
    private static final Logger logger = LoggerFactory.getLogger(FlowerDaoImpl.class);

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;


    public List<FlowerVolume> selectFlowerVolumeList(FlowerVolume flowerVolume) {
        return sqlSessionTemplate.selectList("FlowerVolume.selectFlowerVolumeList", flowerVolume);
    }


    public FlowerVolume selectFlowerVolumeTop(FlowerVolume flowerVolume) {
        return sqlSessionTemplate.selectOne("FlowerVolume.selectFlowerVolumeTop", flowerVolume);
    }
}