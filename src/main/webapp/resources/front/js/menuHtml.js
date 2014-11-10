var menuHtmlImg = "<img src='::MENUIMG::' width='100%' alt='::MENUNAME::'>";
//뉴스레터
var menuHtml01 = "<div class='main_01' onclick=\"outLinkAction('::URL::','5');\" style='cursor:pointer;'>"+
    "<div class='contents'>"+
    "<div class='m_title'> <span class='title'>Newsletter</span> <span class='day'>::FOOTERURL::</span> </div>"+
    "<div class='m_img'> <img src='::THUMBNAIL_NAME::' width='100%' alt='뉴스레터 메인사진'> </div>"+
    "<div class='m_footer'>::TITLE::</div>"+
    "</div>"+
    "<div class='m_bg'> <img src='/resources/front/img/main/main_list_01_bg.gif' width='100%' alt=''> </div>"+
    "</div>";

//수출기상도
var menuHtml02 = " <div class='main_02' onclick=\"linkAction('/exportweather/');\" style='cursor:pointer;'>"+
    "<div class='contents'>"+
    "<div class='m_title'> <span class='title'>농수산식품 수출기상도</span> <span class='day'>::ENDDATE::까지 농수산식품 수출 전년동기대비</span> <span class='percent'>::TOTAMTPER::%::TOTAMTPERFLUC::! ::TOTAMT::$</span> </div>"+
    "<ul>"+
    "<li class='list_01'>"+
    "<div class='top_box'>"+
    "<span class='arrow'> ::TOTAMTPERIMG1::</span>"+
    "<span class='percent'> ::TOTAMTPER1::% </span>"+
    "</div>"+
    "<div class='bottom_box'>"+
    "<div class='img_box'>"+
    "<div class='img'> <img src='/resources/front/img/main/weather_chart_li_01.png' width='100%' > </div>"+
    "</div>"+
    "<div class='i_b_bg'> <img src='/resources/front/img/main/weather_chart_0::TOTAMTPERNUM1::.png' width='100%' alt=''> </div>"+
    "</div>"+
    "<div class='text'> 신선식품 </div>"+
    "</li>"+
    "<li class='list_02'>"+
    "<div class='top_box'>"+
    "<span class='arrow'> ::TOTAMTPERIMG2:: </span>"+
    "<span class='percent'> ::TOTAMTPER2::% </span>"+
    "</div>"+
    "<div class='bottom_box'>"+
    "<div class='img_box'>"+
    "<div class='img'> <img src='/resources/front/img/main/weather_chart_li_02.png' width='100%'> </div>"+
    "</div>"+
    "<div class='i_b_bg'> <img src='/resources/front/img/main/weather_chart_0::TOTAMTPERNUM2::.png' width='100%' alt=''> </div>"+
    "</div>"+
    "<div class='text'> 가공식품 </div>"+
    "</li>"+
    "<li class='list_03'>"+
    "<div class='top_box'>"+
    "<span class='arrow'> ::TOTAMTPERIMG3::</span>"+
    "<span class='percent'> ::TOTAMTPER3::% </span>"+
    "</div>"+
    "<div class='bottom_box'>"+
    "<div class='img_box'>"+
    "<div class='img'> <img src='/resources/front/img/main/weather_chart_li_03.png' width='100%'> </div>"+
    "</div>"+
    "<div class='i_b_bg'> <img src='/resources/front/img/main/weather_chart_0::TOTAMTPERNUM3::.png' width='100%' alt=''> </div>"+
    "</div>"+
    "<div class='text'> 수산식품 </div>"+
    "</li>"+
    "</ul>"+
    "<div class='the_day'>"+
    "<div class='date'>발행일 : <span class='date_num'>::CREATDATE::</span></div>"+
    "<img src='/resources/front/img/main/weather_chart_day_bg.png' width='100%' alt=''> </div>"+
    "</div>"+
    "<div class='m_bg'> <img src='/resources/front/img/main/main_list_02_bg.gif' width='100%' alt=''> </div>"+
    "</div>";

/* 주간 알뜰장보기*/
var menuHtml03 = "<div class='main_05' onclick=\"linkAction('/WeeklyShopping/');\" style='cursor:pointer;'>"+
    "<div class='contents'>"+
    "<div class='m_title'>주간 알뜰장보기</div>"+
    "<div class='list_top'>"+
    "<div class='sub_title'>"+
    "<div class='bar'> <img src='/resources/front/img/main/week_dot.png' width='100%' alt=''> </div>"+
    "<div class='text'> 금주가격 </div>"+
    "</div>"+
    "<div class='c_main'>"+
    "<div class='left'>"+
    "<div class='text'> <span>::UPITEMNAME1::</span> <span>::UPITEMNAME2::</span> </div>"+
    "<div class='arrow'> <img src='/resources/front/img/main/week_top_arrow_up.png' width='100%' alt=''> </div>"+
    "</div>"+
    "<div class='right'>"+
    "<div class='arrow'> <img src='/resources/front/img/main/week_top_arrow_down.png' width='100%' alt=''> </div>"+
    "<div class='text'> <span>::DOWNITEMNAME1::</span> <span>::DOWNITEMNAME2::</span> </div>"+
    "</div>"+
    "</div>"+
    "</div>"+
    "<div class='bottom'>"+
    "<div class='sub_title'>"+
    "<div class='bar'> <img src='/resources/front/img/main/week_dot.png' width='100%' alt=''> </div>"+
    "<div class='text'> 다음주전망 </div>"+
    "</div>"+
    "<ul>"+
    "<li class='list_01'>"+
    "<div class='list_box'>"+
    "<div class='list_top'>"+
    "<div class='text'> 상승 </div>"+
    "<div class='a_img'> <img src='/resources/front/img/main/week_list_01.png' width='100%' alt='상승'> </div>"+
    "</div>"+
    "<div class='list_bottom'>"+
    "<div class='bg'> <img src='/resources/front/img/main/week_list_circle_01.png' width='100%' alt=''> </div>"+
    "<div class='p_img'> <img src='/resources/front/img/price/sub_01_t_p_::NEXTUPIMG::.jpg' alt='::NEXTUPNAME::' width='100%'> </div>"+
    "</div>"+
    "</div>"+
    "</li>"+
    "<li class='list_02'>"+
    "<div class='list_box'>"+
    "<div class='list_top'>"+
    "<div class='text'> 보합 </div>"+
    "<div class='a_img'> <img src='/resources/front/img/main/week_list_02.png' width='100%' alt='보합'> </div>"+
    "</div>"+
    "<div class='list_bottom'>"+
    "<div class='bg'> <img src='/resources/front/img/main/week_list_circle_02.png' width='100%' alt=''> </div>"+
    "<div class='p_img'> <img src='/resources/front/img/price/sub_01_t_p_::NEXTSAMEIMG::.jpg' alt='::NEXTSAMENAME::' width='100%'> </div>"+
    "</div>"+
    "</div>"+
    "</li>"+
    "<li class='list_03'>"+
    "<div class='list_box'>"+
    "<div class='list_top'>"+
    "<div class='text'> 하락 </div>"+
    "<div class='a_img'> <img src='/resources/front/img/main/week_list_03.png' width='100%' alt='하락'> </div>"+
    "</div>"+
    "<div class='list_bottom'>"+
    "<div class='bg'> <img src='/resources/front/img/main/week_list_circle_03.png' width='100%' alt=''> </div>"+
    "<div class='p_img'> <img src='/resources/front/img/price/sub_01_t_p_::NEXTDOWNIMG::.jpg' alt='::NEXTDOWNNAME::' width='100%'> </div>"+
    "</div>"+
    "</div>"+
    "</li>"+
    "</ul>"+
    "</div>"+
    "</div>"+
    "<div class='m_bg'> <img src='/resources/front/img/main/main_list_05_bg.gif' width='100%' alt=''> </div>"+
    "</div>";

/*주요농산물 일일거래동향*/
var menuHtml04 = "<div class='main_06' onclick=\"linkAction('/farmdealTrend/');\" style='cursor:pointer;'>"+
    "<div class='contents'>"+
    "<div class='m_title'>주요 농산물<br>일일거래동향</div>"+
    "<div class='box_all'>"+
    "<div class='box'>"+
    "<div class='name'> <span>::ITEMNAME::</span>"+
    "<div class='name_bg'> <img src='/resources/front/img/main/oneday_price_btn_left_0::DANGER::.png' width='100%' alt='::DANGERNAME::'> </div>"+
    "</div>"+
    "<div class='stat'> <span class='t_0::DANGER4::'>::DANGERNAME::</span>"+
    "<div class='stat_bg'> <img src='/resources/front/img/main/oneday_price_btn_right.png' width='100%' alt=''> </div>"+
    "</div>"+
    "<div class='price'> <span>::PRICE::원</span>"+
    "<div class='price_bg'> <img src='/resources/front/img/main/oneday_price_btn_long.png' width='100%' alt=''> </div>"+
    "</div>"+
    "<div class='graph'>"+
    "<div class='img'> <img src='/resources/front/img/main/oneday_price_graph_0::DANGER::.png' width='100%' alt='::DANGERNAME::'> </div>"+
    "<ul>"+
    "<li> <span class='dot'> <img src='/resources/front/img/main/oneday_price_dot_01.png' width='100%' alt=''> </span> 안정 </li>"+
    "<li> <span class='dot'> <img src='/resources/front/img/main/oneday_price_dot_02.png' width='100%' alt=''> </span> 주의 </li>"+
    "<li> <span class='dot'> <img src='/resources/front/img/main/oneday_price_dot_03.png' width='100%' alt=''> </span> 경계 </li>"+
    "<li> <span class='dot'> <img src='/resources/front/img/main/oneday_price_dot_04.png' width='100%' alt=''> </span> 심각 </li>"+
    "</ul>"+
    "</div>"+
    "</div>"+
    "<div class='back_bg'> <img src='/resources/front/img/main/oneday_bg.png' width='100%' alt=''> </div>"+
    "</div>"+
    "</div>"+
    "<div class='m_bg'> <img src='/resources/front/img/main/main_list_06_bg.gif' width='100%' alt=''> </div>"+
    "</div>";

/* 농축수산물 소매가격 일일동향*/
var menuHtml05 = "<div class='main_07' onclick=\"linkAction('/dailyPrice/');\" style='cursor:pointer;'>"+
    "<div class='contents'>"+
    "<div class='m_title'> <span class='title'>농수축산물<br>소매가격 일일동향</span> <span class='day'>::PKDATE:: 기준</span></div>"+
    "<ul>"+
    "<li class='list_01'>"+
    "<div class='img_box'>"+
    "<div class='img_bg'> <img src='/resources/front/img/main/retail_today_list_bg.png' width='100%' alt=''> </div>"+
    "<div class='img_list'><img src='/resources/front/img/price/sub_02_p_::ITEMCODE1::.jpg' width='100%' alt=''></div>"+
    "</div>"+
    "<div class='list_stat'> ::AVGPRICEIMG1:: </div>"+
    "<div class='list_text'> ::AVGPRICE1::원 </div>"+
    "</li>"+
    "<li class='list_02'>"+
    "<div class='img_box'>"+
    "<div class='img_bg'> <img src='/resources/front/img/main/retail_today_list_bg.png' width='100%' alt=''> </div>"+
    "<div class='img_list'> <img src='/resources/front/img/price/sub_02_p_::ITEMCODE2::.jpg' width='100%' alt=''> </div>"+
    "</div>"+
    "<div class='list_stat'> ::AVGPRICEIMG2:: </div>"+
    "<div class='list_text'> ::AVGPRICE2::원 </div>"+
    "</li>"+
    "<li class='list_03'>"+
    "<div class='img_box'>"+
    "<div class='img_bg'> <img src='/resources/front/img/main/retail_today_list_bg.png' width='100%' alt=''> </div>"+
    "<div class='img_list'> <img src='/resources/front/img/price/sub_02_p_::ITEMCODE3::.jpg' width='100%' alt=''> </div>"+
    "</div>"+
    "<div class='list_stat'> ::AVGPRICEIMG3:: </div>"+
    "<div class='list_text'> ::AVGPRICE3::원 </div>"+
    "</li>"+
    "</ul>"+
    "</div>"+
    "<div class='m_bg'> <img src='/resources/front/img/main/main_list_07_bg.gif' width='100%' alt=''> </div>"+
    "</div>";

/* 주요 원자재 주간가격동향*/
var menuHtml06 = "<div class='main_09' onclick=\"linkAction('/InternationalRawMaterial/');\" style='cursor:pointer;'>"+
    "<div class='contents'>"+
    "<div class='m_title'>주요 원자재<br>주간가격동향</div>"+
    "<div class='product'> <img src='/resources/front/img/main/materials_list_::ITEMCODE::.jpg' width='100%' alt='::ITEMNAME::'> </div>"+
    "<ul class='text_box'>"+
    "<li class='list_01'> <span class='text'>::WEEKPRICE::</span>"+
    "<div class='li_bg'> <img src='/resources/front/img/main/materials_text_bg.png' width='100%' alt=''> </div>"+
    "</li>"+
    "<li class='list_02'> <span class='text'>::LASTWEEKPRICE::</span>"+
    "<div class='li_bg'> <img src='/resources/front/img/main/materials_text_bg.png' width='100%' alt=''> </div>"+
    "</li>"+
    "<li class='list_03'> <span class='text'>::LASTYEARPRICE::</span>"+
    "<div class='li_bg'> <img src='/resources/front/img/main/materials_text_bg.png' width='100%' alt=''> </div>"+
    "</li>"+
    "</ul>"+
    "<ul class='etc'>"+
    "<li class='list_01'> <span class='e_dot'> <img src='/resources/front/img/main/materials_dot_01.png' width='100%' alt=''> </span> <span class='e_text'> 금주 평균 </span> </li>"+
    "<li class='list_02'> <span class='e_dot'> <img src='/resources/front/img/main/materials_dot_02.png' width='100%' alt=''> </span> <span class='e_text'> 전주 평균 </span> </li>"+
    "<li class='list_03'> <span class='e_dot'> <img src='/resources/front/img/main/materials_dot_03.png' width='100%' alt=''> </span> <span class='e_text'> 전년 평균 </span> </li>"+
    "</ul>"+
    "<div class='etc_t'> (단위:US$ / 톤,%) </div>"+
    "</div>"+
    "<div class='m_bg'> <img src='/resources/front/img/main/main_list_09_bg.gif' width='100%' alt=''> </div>"+
    "</div>";

/*주요 가공식품 주간 가격동향*/
var menuHtml07 = "<div class='main_10' onclick=\"linkAction('/ProcessedFood/');\" style='cursor:pointer;'>"+
    "<div class='contents'>"+
    "<div class='m_title'>주요 가공식품<br>주간 가격동향</div>"+
    "<div class='box'>"+
    "<div class='box_top'>"+
    "<div class='menu'> <span>::ITEMNAME::</span><br>(::UNIT::) </div>"+
    "<div class='main_img'> <img src='/resources/front/img/price/sub_05_list_::ITEMCODE::.png' width='100%' alt='::ITEMNAME::'></div>"+
    "</div>"+
    "<div class='box_bottom'>"+
    "<div class='menu_left'>"+
    "<div class='title small_title'> <span>::ITEMNAME1::</span> </div>"+
    "<div class='price'> ::PRICE1:: 원 </div>"+
    "<div class='stat'><span class='percent ::CLASSFLUC1::'>::MONTHPRICE1::%</span><span class='img'>::IMGFLUC1::</span></div>"+
    "</div>"+
    "<div class='menu_right'>"+
    "<div class='title small_title'> <span>::ITEMNAME2::</span> </div>"+
    "<div class='price'> ::PRICE2:: 원 </div>"+
    "<div class='stat'><span class='percent ::CLASSFLUC2::'>::MONTHPRICE2::%</span><span class='img'>::IMGFLUC2::</span></div>"+
    "</div>"+
    "</div>"+
    "</div>"+
    "</div>"+
    "<div class='m_bg'> <img src='/resources/front/img/main/main_list_10_bg.gif' width='100%' alt=''> </div>"+
    "</div>";

/*일일 곡물시황*/
var menuHtml08 = "<div class='main_11' onclick=\"linkAction('/grain-marketCondition/');\" style='cursor:pointer;'>"+
    "<div class='contents'>"+
    "<div class='m_title'>일일 곡물시황</div>"+
    "<div class='center'>"+
    "<div class='text'>::ITEMNAME::</div>"+
    "<div class='c_bg'> <img src='/resources/front/img/main/grain_list_::ITEMCODE::.png' width='100%' alt='::ITEMNAME::'> </div>"+
    "</div>"+
    "<ul>"+
    "<li class='list_01'>"+
    "<div class='li_title'> 기준일 </div>"+
    "</li>"+
    "<li class='list_02'>"+
    "<div class='li_title'> 전일대비 </div>"+
    "</li>"+
    "<li class='list_03'>"+
    "<div class='li_title'> 전년동월<br>평균대비 </div>"+
    "</li>"+
    "</ul>"+
    "<ul>"+
    "<li class='list_01'>"+
    "<div class='li_main'>"+
    "<div class='li_text'> <span class='dollar'>$</span> <span class='num'>::PRICE::</span> </div>"+
    "<img src='/resources/front/img/main/grain_text_bg.png' width='100%' alt=''> </div>"+
    "</li>"+
    "<li class='list_02'>"+
    "<div class='li_main'>"+
    "<div class='li_text'> <span class='num'>::REFERPRICE:: <span class='a_img'>::IMG_REFERPRICE::</span></span> </div>"+
    "<img src='/resources/front/img/main/grain_text_bg.png' width='100%' alt=''> </div>"+
    "</li>"+
    "<li class='list_03'>"+
    "<div class='li_main'>"+
    "<div class='li_text'> <span class='num'>::AVGRPRICE:: <span class='a_img'>::IMG_AVGRPRICE::</span></span> </div>"+
    "<img src='/resources/front/img/main/grain_text_bg.png' width='100%' alt=''> </div>"+
    "</li>"+
    "</ul>"+
    "<div class='etc'> (단위:US$ / 톤,%) </div>"+
    "</div>"+
    "<div class='m_bg'> <img src='/resources/front/img/main/main_list_11_bg.gif' width='100%' alt=''> </div>"+
    "</div>";

/*화훼 거래시세*/
var menuHtml09 = "<div class='main_15' onclick=\"linkAction('/flower_volume/');\" style='cursor:pointer;'>"+
    "<div class='contents'>"+
    "<div class='m_title'>화훼 거래시세 & 거래량</div>"+
    "<ul>"+
    "<li class='list_01'>"+
    "<div class='list_bg'> <img src='/resources/front/img/main/flower_list_bg.png' width='100%' alt=''> </div>"+
    "<div class='list_product'> <img src='/resources/front/img/main/flower_product_::ITEMCODE1::.jpg' width='100%' height='100%' alt='::ITEMNAME1::'> </div>"+
    "<div class='list_text'> <span class='name'>::ITEMNAME1::</span> <span class='price'>::PRICE1::원</span> </div>"+
    "</li>"+
    "<li class='list_02'>"+
    "<div class='list_bg'> <img src='/resources/front/img/main/flower_list_bg.png' width='100%' alt=''> </div>"+
    "<div class='list_product'> <img src='/resources/front/img/main/flower_product_::ITEMCODE2::.jpg' width='100%' alt='::ITEMNAME2::'> </div>"+
    "<div class='list_text'> <span class='name'>::ITEMNAME2::</span> <span class='price'>::PRICE2::원</span> </div>"+
    "</li>"+
    "<li class='list_03'>"+
    "<div class='list_bg'> <img src='/resources/front/img/main/flower_list_bg.png' width='100%' alt=''> </div>"+
    "<div class='list_product'> <img src='/resources/front/img/main/flower_product_::ITEMCODE3::.jpg' width='100%' alt='::ITEMNAME3::'> </div>"+
    "<div class='list_text'> <span class='name'>::ITEMNAME3::</span> <span class='price'>::PRICE3::원</span> </div>"+
    "</li>"+
    "</ul>"+
    "</div>"+
    "<div class='m_bg'> <img src='/resources/front/img/main/main_list_15_bg.gif' width='100%' alt=''> </div>"+
    "</div>";

var menuHtml =[
    ''
    ,menuHtmlImg //사이버거래소, 프로모션
    , menuHtml05 //KAMIS, 농산물일일도소매가격
    , menuHtml08 //FIS, 일일곡물시황
    , menuHtml07 //FIS, 주요가공식품주간가격동향
    , menuHtml01 //KATI, 뉴스레터
    , menuHtml02 //KATI, 농수산식품수출기상도
    , menuHtml03 //KAMIS, 알뜰장보기
    , menuHtmlImg //FIS, 국내외식품산업주요지표
    , menuHtml04 //KATI, 주요 농산물 거래 동향
    , menuHtml06 //FIS, 국제원자재 가격
    , menuHtmlImg //KATI, 해외도소매 가격
    , menuHtmlImg //KAMIS, 비용별·단계별품목유통실태
    , menuHtmlImg //FIS, 한국외식업경기지수
    , menuHtmlImg //e-Book
    , menuHtmlImg //KATI. aT Global Food Info
    , menuHtml09 //화훼공판장, 경매시세
];

