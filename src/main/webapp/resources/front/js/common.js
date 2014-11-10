/*메인 html 데이터*/
function menuHtmlData(data,menuid, htmlBody){
    var infoArrNum = ReturnTo_Random(0,data.length-1);
    if( menuid == "2") { //KAMIS, 농산물일일도소매가격
        var infoArrNum2 = "";
        for( var i = 0; i<data.length;i++){
            infoArrNum2 = ReturnTo_Random(0,data.length-1);
            if( infoArrNum != infoArrNum2 ) break;
        }
        var infoArrNum3 = ReturnTo_Random(0,data.length-1);
        for( var i = 0; i<data.length;i++){
            infoArrNum3 = ReturnTo_Random(0,data.length-1);
            if( infoArrNum != infoArrNum3 && infoArrNum2 != infoArrNum3 ) break;
        }
        htmlBody = htmlBody.replace("::PKDATE::",data[infoArrNum].pkDate.substring(0,4)+"-"+data[infoArrNum].pkDate.substring(4,6)+"-"+data[infoArrNum].pkDate.substring(6,8));
        htmlBody = htmlBody.replace("::ITEMCODE1::",data[infoArrNum].itemCode);
        htmlBody = htmlBody.replace("::ITEMCODE2::",data[infoArrNum2].itemCode);
        htmlBody = htmlBody.replace("::ITEMCODE3::",data[infoArrNum3].itemCode);
        htmlBody = htmlBody.replace("::AVGPRICE1::",$.number(data[infoArrNum].avgPrice));
        htmlBody = htmlBody.replace("::AVGPRICE2::",$.number(data[infoArrNum2].avgPrice));
        htmlBody = htmlBody.replace("::AVGPRICE3::",$.number(data[infoArrNum3].avgPrice));
        var avgImg1 = "";
        var avgImg2 = "";
        var avgImg3 = "";
        if( (data[infoArrNum].avgPrice-data[infoArrNum].prevAvgPrice) > 0 ) avgImg1 = "<img src='/resources/front/img/main/retail_today_up.png' width='100%' alt='상승'>";
        else if( (data[infoArrNum].avgPrice-data[infoArrNum].prevAvgPrice) < 0 ) avgImg1 = "<img src='/resources/front/img/main/retail_today_down.png' width='100%' alt='하락'>";
        else avgImg1 = "<img src='/resources/front/img/main/retail_today_center.png' width='100%' alt='보합'>";
        if( (data[infoArrNum2].avgPrice-data[infoArrNum2].prevAvgPrice) > 0 ) avgImg2 = "<img src='/resources/front/img/main/retail_today_up.png' width='100%' alt='상승'>";
        else if( (data[infoArrNum2].avgPrice-data[infoArrNum2].prevAvgPrice) < 0 ) avgImg2 = "<img src='/resources/front/img/main/retail_today_down.png' width='100%' alt='하락'>";
        else avgImg2 = "<img src='/resources/front/img/main/retail_today_center.png' width='100%' alt='보합'>";
        if( (data[infoArrNum3].avgPrice-data[infoArrNum3].prevAvgPrice) > 0 ) avgImg3 = "<img src='/resources/front/img/main/retail_today_up.png' width='100%' alt='상승'>";
        else if( (data[infoArrNum3].avgPrice-data[infoArrNum3].prevAvgPrice) < 0 ) avgImg3 = "<img src='/resources/front/img/main/retail_today_down.png' width='100%' alt='하락'>";
        else avgImg3 = "<img src='/resources/front/img/main/retail_today_center.png' width='100%' alt='보합'>";
        htmlBody = htmlBody.replace("::AVGPRICEIMG1::",avgImg1);
        htmlBody = htmlBody.replace("::AVGPRICEIMG2::",avgImg2);
        htmlBody = htmlBody.replace("::AVGPRICEIMG3::",avgImg3);
    }else if( menuid == "3"){ //FIS, 일일곡물시황
        htmlBody = htmlBody.replace("::ITEMCODE::",data[infoArrNum].itemCode.replace("A",""));
        htmlBody = htmlBody.replace("::ITEMNAME::",data[infoArrNum].itemName);
        htmlBody = htmlBody.replace("::PRICE::",$.number(data[infoArrNum].netChangePrice));
        htmlBody = htmlBody.replace("::REFERPRICE::",$.number(data[infoArrNum].referenceDatePrice));
        htmlBody = htmlBody.replace("::AVGRPRICE::",$.number(data[infoArrNum].averagePrice));
        if( data[infoArrNum].referenceDateFluctuation == "증가"){
            htmlBody = htmlBody.replace("::IMG_REFERPRICE::","<img src='/resources/front/img/main/grain_g_up.png' width='100%' alt='"+data[infoArrNum].referenceDateFluctuation+"'>");
        }else if(data[infoArrNum].referenceDateFluctuation == "감소"){
            htmlBody = htmlBody.replace("::IMG_REFERPRICE::","<img src='/resources/front/img/main/grain_g_down.png' width='100%' alt='"+data[infoArrNum].referenceDateFluctuation+"'>");
        }else if(data[infoArrNum].referenceDateFluctuation == "변동없음"){
            htmlBody = htmlBody.replace("::IMG_REFERPRICE::","<img src='/resources/front/img/main/grain_g_middle.png' width='100%' alt='"+data[infoArrNum].referenceDateFluctuation+"'>");
        }
        if( data[infoArrNum].averageFluctuation == "증가"){
            htmlBody = htmlBody.replace("::IMG_AVGRPRICE::","<img src='/resources/front/img/main/grain_r_up.png' width='100%' alt='"+data[infoArrNum].averageFluctuation+"'>");
        }else if(data[infoArrNum].averageFluctuation == "감소"){
            htmlBody = htmlBody.replace("::IMG_AVGRPRICE::","<img src='/resources/front/img/main/grain_r_down.png' width='100%' alt='"+data[infoArrNum].averageFluctuation+"'>");
        }else if(data[infoArrNum].averageFluctuation == "변동없음"){
            htmlBody = htmlBody.replace("::IMG_AVGRPRICE::","<img src='/resources/front/img/main/grain_r_middle.png' width='100%' alt='"+data[infoArrNum].averageFluctuation+"'>");
        }
    }else if( menuid == "4" ){//FIS, 주요가공식품주간가격동향
        var infoArrNum2 = "";
        if( infoArrNum % 2 == 0 ) infoArrNum2 = infoArrNum+1;
        else infoArrNum2 = infoArrNum-1;
        htmlBody = htmlBody.replace("::ITEMCODE::",data[infoArrNum].itemCode.replace("C",""));
        htmlBody = htmlBody.replace(/::ITEMNAME::/g,data[infoArrNum].itemName);
        htmlBody = htmlBody.replace("::UNIT::",data[infoArrNum].unit);
        htmlBody = htmlBody.replace(/::ITEMNAME1::/g,data[infoArrNum].productName);
        htmlBody = htmlBody.replace("::PRICE1::",$.number(data[infoArrNum].weeklyPrice));
        htmlBody = htmlBody.replace("::MONTHPRICE1::",$.number(data[infoArrNum].lastMonthPrice));
        if(data[infoArrNum].weeklyFluctuation == "상승"){
            htmlBody = htmlBody.replace("::IMGFLUC1::","<img src='/resources/front/img/main/processed_food_up.png' width='100%' alt='상승'>");
            htmlBody = htmlBody.replace("::CLASSFLUC1::","red");
        }else if(data[infoArrNum].weeklyFluctuation == "하락"){
            htmlBody = htmlBody.replace("::IMGFLUC1::","<img src='/resources/front/img/main/processed_food_down.png' width='100%' alt='하락'>");
            htmlBody = htmlBody.replace("::CLASSFLUC1::","blue");
        }else{
            htmlBody = htmlBody.replace("::IMGFLUC1::","<img src='/resources/front/img/main/processed_food_center.png' width='100%' alt='변동없음'>");
            htmlBody = htmlBody.replace("::CLASSFLUC1::","green");
        }
        htmlBody = htmlBody.replace(/::ITEMNAME2::/g,data[infoArrNum2].productName);
        htmlBody = htmlBody.replace("::PRICE2::",$.number(data[infoArrNum2].weeklyPrice));
        htmlBody = htmlBody.replace("::MONTHPRICE2::",$.number(data[infoArrNum2].lastMonthPrice));
        if(data[infoArrNum2].weeklyFluctuation == "상승"){
            htmlBody = htmlBody.replace("::IMGFLUC2::","<img src='/resources/front/img/main/processed_food_up.png' width='100%' alt='상승'>");
            htmlBody = htmlBody.replace("::CLASSFLUC2::","red");
        }else if(data[infoArrNum2].weeklyFluctuation == "하락"){
            htmlBody = htmlBody.replace("::IMGFLUC2::","<img src='/resources/front/img/main/processed_food_down.png' width='100%' alt='하락'>");
            htmlBody = htmlBody.replace("::CLASSFLUC2::","blue");
        }else{
            htmlBody = htmlBody.replace("::IMGFLUC2::","<img src='/resources/front/img/main/processed_food_center.png' width='100%' alt='변동없음'>");
            htmlBody = htmlBody.replace("::CLASSFLUC2::","green");
        }
    }else if( menuid == "5" ){//뉴스레터
        htmlBody = htmlBody.replace("::URL::",data[0].url);
        htmlBody = htmlBody.replace("::THUMBNAIL_NAME::",data[0].thumbnailName);
        htmlBody = htmlBody.replace("::TITLE::",data[0].title);
        htmlBody = htmlBody.replace("::FOOTERURL::",data[0].footerurl);
    }else if(menuid == "6"){ //KATI, 농수산식품수출기상도
        if(data[0].titledate!=null) htmlBody = htmlBody.replace("::ENDDATE::",data[0].titledate);
        htmlBody = htmlBody.replace("::TOTAMTPER::",Number(data[0].totAmtper).toFixed(1));
        if( data[0].totAmtper > 0 ){
            htmlBody = htmlBody.replace("::TOTAMTPERFLUC::","증가");
        }else{
            htmlBody = htmlBody.replace("::TOTAMTPERFLUC::","하락");
        }
        if( data[0].totAmt.length > 9) {
            htmlBody = htmlBody.replace("::TOTAMT::", Math.floor(Number(data[0].totAmt) / 100000000).toFixed(1)+"억");
        }else{
            htmlBody = htmlBody.replace("::TOTAMT::", Math.floor(Number(data[0].totAmt) / 1000000).toFixed(1)+"백만");
        }
        if( data[1].totAmtper > 0 ){
            htmlBody = htmlBody.replace("::TOTAMTPERIMG1::","<img src='/resources/front/img/main/weather_chart_arrow_s_up.png' width='100%' alt='상승'>");
        }else{
            htmlBody = htmlBody.replace("::TOTAMTPERIMG1::","<img src='/resources/front/img/main/weather_chart_arrow_s_down.png' width='100%' alt='하락'>");
        }
        htmlBody = htmlBody.replace("::TOTAMTPER1::",Number(data[1].totAmtper).toFixed(1));
        htmlBody = htmlBody.replace("::TOTAMTPERNUM1::",data[1].totAmtperNum);

        if( data[2].totAmtper > 0 ){
            htmlBody = htmlBody.replace("::TOTAMTPERIMG2::","<img src='/resources/front/img/main/weather_chart_arrow_s_up.png' width='100%' alt='상승'>");
        }else{
            htmlBody = htmlBody.replace("::TOTAMTPERIMG2::","<img src='/resources/front/img/main/weather_chart_arrow_s_down.png' width='100%' alt='하락'>");
        }
        htmlBody = htmlBody.replace("::TOTAMTPER2::",Number(data[2].totAmtper).toFixed(1));
        htmlBody = htmlBody.replace("::TOTAMTPERNUM2::",data[2].totAmtperNum);
        if( data[3].totAmtper > 0 ){
            htmlBody = htmlBody.replace("::TOTAMTPERIMG3::","<img src='/resources/front/img/main/weather_chart_arrow_s_up.png' width='100%' alt='상승'>");
        }else{
            htmlBody = htmlBody.replace("::TOTAMTPERIMG3::","<img src='/resources/front/img/main/weather_chart_arrow_s_down.png' width='100%' alt='하락'>");
        }
        htmlBody = htmlBody.replace("::TOTAMTPER3::",Number(data[3].totAmtper).toFixed(1));
        htmlBody = htmlBody.replace("::TOTAMTPERNUM3::",data[3].totAmtperNum);
        htmlBody = htmlBody.replace("::CREATDATE::",data[0].publishdate.substring(0,10).replace(/-/g,'.'));
    }else if( menuid == "7" ){//KAMIS, 알뜰장보기
        htmlBody = htmlBody.replace("::UPITEMNAME1::",data[0].itemName);
        htmlBody = htmlBody.replace("::UPITEMNAME2::",data[1].itemName);
        htmlBody = htmlBody.replace("::DOWNITEMNAME1::",data[2].itemName);
        htmlBody = htmlBody.replace("::DOWNITEMNAME2::",data[3].itemName);
        htmlBody = htmlBody.replace("::NEXTUPIMG::",data[9].itemCode.substring(1,3));
        htmlBody = htmlBody.replace("::NEXTUPNAME::",data[9].itemName);
        htmlBody = htmlBody.replace("::NEXTSAMEIMG::",data[7].itemCode.substring(1,3));
        htmlBody = htmlBody.replace("::NEXTSAMENAME::",data[7].itemName);
        htmlBody = htmlBody.replace("::NEXTDOWNIMG::",data[6].itemCode.substring(1,3));
        htmlBody = htmlBody.replace("::NEXTDOWNNAME::",data[6].itemName);
    }else if( menuid == "9" ){//KATI, 주요 농산물 거래 동향
        htmlBody = htmlBody.replace("::ITEMNAME::",data[infoArrNum].itemName);
        htmlBody = htmlBody.replace(/::DANGER::/g, data[infoArrNum].danger);
        htmlBody = htmlBody.replace(/::DANGER4::/g, data[infoArrNum].danger.replace("0","4"));
        htmlBody = htmlBody.replace(/::DANGERNAME::/g, data[infoArrNum].dangerName);
        htmlBody = htmlBody.replace(/::PRICE::/g, $.number(data[infoArrNum].standardPrice));
    }else if( menuid == "10" ){//FIS, 국제원자재 가격
        htmlBody = htmlBody.replace("::ITEMCODE::",data[infoArrNum].itemCode.substring(1, 3));
        htmlBody = htmlBody.replace("::ITEMNAME::",data[infoArrNum].itemName);
        htmlBody = htmlBody.replace("::WEEKPRICE::",$.number(data[infoArrNum].weeklyAveragePrice));
        htmlBody = htmlBody.replace("::LASTWEEKPRICE::",$.number(data[infoArrNum].lastWeeklyAveragePrice));
        htmlBody = htmlBody.replace("::LASTYEARPRICE::",$.number(data[infoArrNum].lastYearlyAveragePrice));
    }else if( menuid=="16" ){//화훼공판장, 경매시세
        if( data.length > 0 ) {
            htmlBody = htmlBody.replace(/::ITEMCODE1::/g, data[0].itemCode.substring(1, 3));
            htmlBody = htmlBody.replace(/::ITEMNAME1::/g, data[0].itemName);
            htmlBody = htmlBody.replace("::PRICE1::", $.number(data[0].avgPrice));
        }
        if( data.length > 1 ) {
            htmlBody = htmlBody.replace(/::ITEMCODE2::/g, data[1].itemCode.substring(1, 3));
            htmlBody = htmlBody.replace(/::ITEMNAME2::/g, data[1].itemName);
            htmlBody = htmlBody.replace("::PRICE2::", $.number(data[1].avgPrice));
        }
        if( data.length > 2 ) {
            htmlBody = htmlBody.replace(/::ITEMCODE3::/g, data[2].itemCode.substring(1, 3));
            htmlBody = htmlBody.replace(/::ITEMNAME3::/g, data[2].itemName);
            htmlBody = htmlBody.replace("::PRICE3::", $.number(data[2].avgPrice));
        }
    }
    return htmlBody;
}

/*랜덤 숫자*/
function ReturnTo_Random(minNum, maxNum){
    var returnNum = Math.random() * (maxNum - minNum + 1) + minNum;
    returnNum = Math.floor(returnNum)%10;
    return returnNum;
}