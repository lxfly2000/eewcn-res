//请参考该网页获取RefreshToken：
// https://equake.top/apidocs
//然后将RefreshToken填入settings.json中的userExtra字段中，格式为：
// EQSCRefreshToken=你的RefreshToken
//若该字段有其他内容只需用空格隔开即可。
//返回码：
// -104：签名无效
// -105：token格式错误
// -102：token无效
// -106：token过期
//只要返回负数就需要重新生成AccessToken
var refreshToken="";
var accessToken="";
var lastReturnCode=-1;

//===========预警获取函数==============

function eew_url(){return "";}
function eew_method(){return "get";}
function eew_header(){return {/*"Accept":"application/json"*/};}
function eew_postdata(){return "";}
function eew_onsuccess(str_response){return {};}
function eew_onfail(num_errorcode){logger.error("eew_onfail: "+num_errorcode);}
function is_eew_data(url){return url==="";}


//=========地震历史数据获取函数=============

function history_url(){
    if(lastReturnCode<0){//需要重新获取AccessToken
        return "https://equake.top/createAccessToken";
    }else{//正常获取预警数据
        return "https://equake.top/eqlistCENC.json?limit={historyQueryCount}";
    }
}
function history_method(){return "get";}
function history_header(){
    if(lastReturnCode<0){//需要重新获取AccessToken
        return {"Authorization":"Bearer "+refreshToken};
    }else{//正常获取预警数据
        return {"Authorization":"Bearer "+accessToken};
    }
}
function history_postdata(){return "";}

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
var last_history_data=null;
function history_onsuccess(str_response){
    if(str_response.substr(0,1)==="-"){//错误码
        lastReturnCode=parseInt(str_response.split(",")[0]);
        logger.error("EQSC Error code: "+lastReturnCode);
    }else if(lastReturnCode<0){//现在处于获取AccessToken的状态
        lastReturnCode=0;
        accessToken=str_response.split(",")[0];
    }else{//正常获取数据
        var original=JSON.parse(str_response);
        var shuju_array=[];
        for(var i=1;;i++){
            var item=original["No"+i];
            if(!item)
                break;
            shuju_array.push({
                id:item.eventID,
                O_TIME:item.shockTime,
                EPI_LAT:item.latitude,
                EPI_LON:item.longitude,
                EPI_DEPTH:parseFloat(item.depth),
                AUTO_FLAG:(item.type==="automatic")?"(自动测定)":"M",
                EQ_TYPE:"M",
                M:item.magnitude,
                LOCATION_C:item.location
            });
        }
        last_history_data={shuju:shuju_array};
    }
    return last_history_data;
}

function history_onfail(num_errorcode){logger.error("history_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为地震历史数据
function is_history_data(url){return url.startsWith("https://equake.top/");}

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


//=========用户数据=============

function setUserData(data){
    var pairs=data.split(" ");
    for(var p of pairs){
        var eqPos=p.indexOf("=");
        if(eqPos!==-1){
            var key=p.substr(0,eqPos);
            var value=p.substr(eqPos+1);
            if(key==="EQSCRefreshToken"){
                refreshToken=value.split(",")[0];
            }
        }
    }
}


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
