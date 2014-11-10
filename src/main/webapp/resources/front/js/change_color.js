
$(document).ready(function(){
	ACTIVE_INFO.initialize(1);
})

var ACTIVE_FUN = {
	
	commify:function(n) {
		var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
		n += '';                          // 숫자를 문자열로 변환

		while (reg.test(n)){
			n = n.replace(reg, '$1' + ',' + '$2');
			return n;
		}
	}

	,animateNumber:function(aniVal){
		/*aniVal:{
			targetNumber:settings["first"]
			,startnum:0
			,span:""
			,targetObj:".industrialNum"
			,comm:false
		});*/

		var option = {
			'speed':750
			,'easing':'easeInOutExpo'
			,'fps':50
			,'defaultColor':'#575a5d'
		}
					
		var num = aniVal.startnum;
		var animNum = 0;
		var timerojb;
		var difValue = aniVal.targetNumber-aniVal.startnum;
		var digits = aniVal.targetNumber.toString().length;
		if(digits<aniVal.startnum.toString().length)
		digits = aniVal.startnum.toString().length;

		refashtime = option['speed']/option.fps; // 1968이 갈 횟수 speed이면 10번  
		timerojb = setInterval(function() 
		{
			var zero = "";
			animNum++;
			num+=(difValue/refashtime);
			var htmlStr = Math.round(num);
			htmlStr =htmlStr.toString();
            
			if(htmlStr.length<digits){
				for(var i = 0; i<digits- htmlStr.length; i++){
					zero += "0";
				}
			}
		
			htmlStr = zero+htmlStr;

			if(digits>3)htmlStr = ACTIVE_FUN.commify(htmlStr);
			//*************************************//
			$(aniVal.targetObj).html(htmlStr+aniVal.span);
			//*************************************//
			if (refashtime <= animNum)
			{
				clearInterval(timerojb);
			}
		},option.fps);
	}
}

var ACTIVE_INFO = {
	option:{
		'speed':750
		,'delay':750
		,'color_off':'#c7c7c7'
		,'color_on':'#ff006c'
		,'chartDelay':500
	}
	,status:{
		debugMode:true
		,mapAni:false
		,chart01:false
		,chart02:false
		,chart03:false

	}
	,initialize:function(type){
		var that = this;
        if( type == "1") {
            that.char01Animation();
        }else if( type == "2") {
            that.char02Animation();
        }else if( type == "3") {
            that.char03Animation();
        }
	}
	,char01Animation:function(){
		var that = this;
        var listCnt = 1;
		var onAnimation = function(){
            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev1_flowerNum1_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev1_flowerNum1_"+i
                    });
                    $(".dev1_flowerNum1_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })
            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev1_flowerNum2_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev1_flowerNum2_"+i
                    });
                    $(".dev1_flowerNum2_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })
            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev1_flowerNum3_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev1_flowerNum3_"+i
                    });
                    $(".dev1_flowerNum3_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })

            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev1_flowerNum4_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev1_flowerNum4_"+i
                    });
                    $(".dev1_flowerNum4_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })
		}

		if(!this.status.chart01){
			//this.status.chart01=true;
			onAnimation();			
		}
	}
    ,char02Animation:function(){
        var that = this;
        var listCnt = 1;
        var onAnimation = function(){
            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev2_flowerNum1_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev2_flowerNum1_"+i
                    });
                    $(".dev2_flowerNum1_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })
            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev2_flowerNum2_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev2_flowerNum2_"+i
                    });
                    $(".dev2_flowerNum2_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })
            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev2_flowerNum3_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev2_flowerNum3_"+i
                    });
                    $(".dev2_flowerNum3_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })

            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev2_flowerNum4_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev2_flowerNum4_"+i
                    });
                    $(".dev2_flowerNum4_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })
        }

        if(!this.status.chart02){
            //this.status.chart02=true;
            onAnimation();
        }
    }
    ,char03Animation:function(){
        var that = this;
        var listCnt = 1;
        var onAnimation = function(){
            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev3_flowerNum1_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev3_flowerNum1_"+i
                    });
                    $(".dev3_flowerNum1_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })
            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev3_flowerNum2_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev3_flowerNum2_"+i
                    });
                    $(".dev3_flowerNum2_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })
            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev3_flowerNum3_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev3_flowerNum3_"+i
                    });
                    $(".dev3_flowerNum3_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })

            setTimeout(function(){
                for( var i=1;i<=5;i++) {
                    ACTIVE_FUN.animateNumber({
                        targetNumber: parseInt($(".dev3_flowerNum4_"+i).html().replace(/,/g, ''), 10), startnum: 0, span: "", targetObj: ".dev3_flowerNum4_"+i
                    });
                    $(".dev3_flowerNum4_"+i).animate({"color": "#f7ff7a"}, that.option.speed);
                }
            })
        }

        if(!this.status.chart03){
            //this.status.chart03=true;
            onAnimation();
        }
    }
}

