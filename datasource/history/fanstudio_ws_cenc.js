//===========预警获取函数==============

function eew_url(){return "";}
function eew_method(){return "get";}
function eew_header(){return {/*"Accept":"application/json"*/};}
function eew_postdata(){return "";}
function eew_onsuccess(str_response){return {};}
function eew_onfail(num_errorcode){logger.error("eew_onfail: "+num_errorcode);}
function is_eew_data(url){return url==="";}


//=========地震历史数据获取函数=============

function history_url(){return "wss://ws.fanstudio.tech/cenc";}
function history_method(){return "websocket";}
function history_header(){return {/*"Accept":"application/json"*/};}
function history_postdata(){return "{\"type\":\"query\"}";}

//格式如下：
//  {shuju:[{id:"字符串型事件ID",
//          O_TIME:"YYYY-MM-DD HH:MM:SS格式发震时间",
//          EPI_LAT:"字符串型震中纬度",
//          EPI_LON:"字符串型震中经度",
//          EPI_DEPTH:数值型震源深度（公里）,
//          AUTO_FLAG:"字符串型自动测定标记，例如A，M等"
//          EQ_TYPE:"M",
//          M:"字符串型震级"
//          LOCATION_C:"字符串型震源地名称"},
//         {...},{...},{...},...
//        ]}
var last_history=null;
/*function history_onsuccess(str_response){
    var original=JSON.parse(str_response);
    if(original.type==="initial"||original.type==="update"||original.type==="query_response"){
        var shuju_array=[];
        var item=original.Data;
        shuju_array.push({
            id:item.eventId,
            O_TIME:item.shockTime,
            EPI_LAT:item.latitude.toString(),
            EPI_LON:item.longitude.toString(),
            EPI_DEPTH:item.depth,
            AUTO_FLAG:(item.infoTypeName==="[自动测定]")?"(自动测定)":"M",
            EQ_TYPE:"M",
            M:item.magnitude.toString(),
            LOCATION_C:item.placeName
        });
        last_history={shuju:shuju_array};
    }else if(original.type==="notice"||original.type==="error"){
		logger.info(str_response);
	}
    return last_history;
}*/
function history_onsuccess(str_response){
    var matchBrackets=str_response.replace(/\r?\n/g,"").match(/\{([^{},]+,){4,}[^{}]+\}/g);
    if(matchBrackets!==null&&matchBrackets!==undefined&&matchBrackets.length>0){
        //只要第一个数据
        var matchBracket=matchBrackets[0];
        var foundId_match=matchBracket.match(/id\w*" *: *"?([^,{}\[\]:"]+)/i);
        var foundId=foundId_match?foundId_match[1]:"No ID";
        var foundLat_match=matchBracket.match(/lat\w*" *: *"?(-?\d+\.?\d*) *[,}]/i);
        var foundLat=foundLat_match?foundLat_match[1]:"29.8";
        var foundLon_match=matchBracket.match(/(lon|lng)\w*" *: *"?(-?\d+\.?\d*) *[,}]/i);
        var foundLon=foundLon_match?foundLon_match[2]:"106.4";
        var foundDep_match=matchBracket.match(/dep\w*" *: *"?(-?\d+\.?\d*)/i);
        var foundDep=foundDep_match?foundDep_match[1]:"0";
        var foundMag_match=matchBracket.match(/mag\w*" *: *"?(-?\d+\.?\d*) *[,}]/i);
        var foundMag=foundMag_match?foundMag_match[1]:"0";
        var foundEpi_match=matchBracket.match(/(epi|hypo|place|cent|loc)\w*" *: *"([^"]+)"/i);
        var foundEpi=foundEpi_match?foundEpi_match[2]:"No Epicenter";
        var foundTime_match=matchBracket.match(/\d{4}[-/]\d{2}[-/]\d{2} \d{2}:\d{2}:\d{2}/g);
        var foundTime="1970-01-01 00:00:00";
        for(var t of foundTime_match){
            if(foundTime==="1970-01-01 00:00:00"||fmt_to_msts(foundTime)>fmt_to_msts(t)){
                foundTime=t;
            }
        }
        var foundAutoFlag_match=matchBracket.match(/自动/);
        var foundAutoFlag=foundAutoFlag_match?"(自动测定)":"M";

        var shuju_array=[];
        shuju_array.push({
            /*STR*/id:foundId,
            /*STR*/O_TIME:foundTime,
            /*STR*/EPI_LAT:foundLat,
            /*STR*/EPI_LON:foundLon,
            /*NUM*/EPI_DEPTH:parseFloat(foundDep),
            /*STR*/AUTO_FLAG:foundAutoFlag,
            /*STR*/EQ_TYPE:"M",
            /*STR*/M:foundMag,
            /*STR*/LOCATION_C:foundEpi
        });
        last_history={shuju:shuju_array};
    }else{
        if(str_response.indexOf("\"heartbeat\"")===-1)
            logger.info("无法识别的数据：\n"+str_response);
    }
    return last_history;
}

function history_onfail(num_errorcode){logger.error("history_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为地震历史数据
function is_history_data(url){return url==="wss://ws.fanstudio.tech/cenc";}

function history_onreport(str_data){
    var data=JSON.parse(str_data);
    tts.play("zh","中国地震台网"+(data.AUTO_FLAG==="(自动测定)"?"自动测定":"正式测定")+"："+
    data.O_TIME+"，"+data.LOCATION_C+"发生"+voice_cn_ordinal(data.M)+"级地震，震源深度"+voice_cn_quantity(data.EPI_DEPTH)+"公里。");
}


//=========测站数据获取函数=============

function station_count(){return 0;}
function station_url(){return [""];}
function station_method(){return ["websocket"];}
function station_header(){return [{/*"Accept":"application/json"*/},{}];}
function station_postdata(){return ["",""];}
function station_onsuccess(num_index,str_response){return {};}
function station_onfail(num_errorcode){logger.error("station_onfail: "+num_errorcode);}
function is_station_data(url){return url==="";}


//=========辅助函数=============

//将毫秒数时间戳转为YYYY-MM-DD HH:MM:SS
function msts_to_fmt(msts){
    var isodt=new Date(msts).toISOString();
    return isodt.substr(0,10)+" "+isodt.substr(11,8);
}

//将YYYY-MM-DD HH:MM:SS转为毫秒数时间戳
function fmt_to_msts(fmt){
    return new Date(fmt).getTime();
}

function voice_cn_ordinal(num){
    if(num==2){
        return "二";
    }
    return num;
}

function voice_cn_quantity(num){
    if(num==2){
        return "两";
    }
    return num;
}
