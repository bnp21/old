package com.info.framework.batch;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by asus on 14. 7. 1.
 */
public class SelectRequestedBookingProductJob {

    public void selectBookingCondition(boolean bRunJob, int serverTotalCount, int nowServerId) {
        if( bRunJob ) {
            try {
                long time = System.currentTimeMillis();
                SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
                String str = dayTime.format(new Date(time));
                //System.out.println("\n\n==== Run Job. Hello Job~ :) serverTime["+ str +"] nowServerId["+ nowServerId +"] ====\n\n");
            }catch(Exception e) {
                e.printStackTrace();
            }
        }else {
            //System.out.println("\n\n==== Do not Run Job. ====\n\n");
        }
    }
}