package com.info.web.flower.service;

import com.info.web.domain.FlowerVolume;
import com.info.web.domain.Grain;
import com.info.web.domain.InternationalRawMaterial;
import com.info.web.flower.dao.FlowerDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * <pre>
 * 화훼 거래시세.
 * </pre>
 *
 * @author 이소정
 * @version 1.0, 2014.07.08
 */
@Service("flowerService")
public class FlowerServiceImpl implements FlowerService {
    private static Logger LOGGER = LoggerFactory.getLogger(FlowerServiceImpl.class);

    @Autowired
    private FlowerDao flowerDao;


    public List<FlowerVolume> selectFlowerVolumeList(FlowerVolume flowerVolume) {
        return flowerDao.selectFlowerVolumeList(flowerVolume);
    }


    public FlowerVolume selectFlowerVolumeTop(FlowerVolume flowerVolume) {
        return flowerDao.selectFlowerVolumeTop(flowerVolume);
    }
}
