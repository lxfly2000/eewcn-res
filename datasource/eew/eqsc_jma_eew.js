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

//指定一个URL，若不想使用脚本的预警或地震历史功能请将相应的URL指定为空字符串，即""
function eew_url(){
    if(lastReturnCode<0){//需要重新获取AccessToken
        return "https://equake.top/createAccessToken";
    }else{//正常获取预警数据
        return "https://equake.top/jma_eew.json";
    }
}

//指定请求方式，"get"或"post"等，还可指定为"websocket"使用WebSocket连接（此时URL应为ws或wss协议）
function eew_method(){return "get";}

//指定HTTP请求头，以JSON形式返回，使用WebSocket时此函数不会被调用
function eew_header(){
    if(lastReturnCode<0){//需要重新获取AccessToken
        return {"Authorization":"Bearer "+refreshToken};
    }else{//正常获取预警数据
        return {"Authorization":"Bearer "+accessToken};
    }
}

//请求方式为POST时提交的数据，或WebSocket连接成功后要发送的数据，字符串形式，空字符串表示不发送
function eew_postdata(){return "";}

//成功返回数据时请将响应内容转换为指定的JSON形式
//格式如下：
//  {data:[{eventId:字符串型事件ID,
//          updates:数值型第几报,
//          latitude:数值型震中纬度,
//          longitude:数值型震中经度,
//          depth:数值型震源深度（公里）,
//          epicenter:"字符串型震源地名称",
//          startAt:数值型发震时间戳（毫秒）,
//          magnitude:数值型震级},
//         {...},{...},{...},...
//        ]}
var last_eew_data=null;
function eew_onsuccess(str_response){
    if(str_response.substr(0,1)==="-"){//错误码
        lastReturnCode=parseInt(str_response.split(",")[0]);
        logger.error("EQSC Error code: "+lastReturnCode);
    }else if(lastReturnCode<0){//现在处于获取AccessToken的状态
        lastReturnCode=0;
        accessToken=str_response.split(",")[0];
    }else{//正常获取预警数据
        lastReturnCode=0;
        var original=JSON.parse(str_response);
        var converted={
            eventId:original.EventID,
            updates:parseInt(original.Serial),
            latitude:parseFloat(original.Latitude),
            longitude:parseFloat(original.Longitude),
            depth:parseFloat(original.Depth),
            epicenter:original.Hypocenter,
            startAt:fmt_to_msts(original.OriginTime+" UTC+9"),//注意时区问题
            magnitude:parseFloat(original.Magunitude),
            ttsepicenter:original.Hypocenter
        };
        if(original.isWarn==="true"){
            converted.epicenter="<font color=\"red\">"+converted.epicenter+"</font>";
        }
        if(original.isFinal==="true"){
            converted.epicenter+="(最終報)";
        }
        if(original.isCancel==="true"){
            converted.epicenter+="(取消)";
        }
        converted.epicenter="<b>["+shindo_str(original.MaxIntensity)+"]</b> "+converted.epicenter;
        last_eew_data={data:[converted]};
    }
    return last_eew_data;
}

//失败时的调用，参数为一个数值型的错误码
function eew_onfail(num_errorcode){logger.error("eew_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为EEW数据，使用WebSocket时此函数不会被调用
function is_eew_data(url){return url.startsWith("https://equake.top/");}

var last_report_data=null;
function eew_onreport(str_data){
    var data=JSON.parse(str_data);
    var ity=data.epicenter.substr(4,data.epicenter.indexOf("]")-4);
    if(last_report_data===null||//首次报
        last_report_data.eventId!==data.eventId||// 事件ID不同报
        Math.abs(last_report_data.startAt-data.startAt)>10000|| // 发震时间差超过10秒报
        last_report_data.ttsepicenter!==data.ttsepicenter||// 震中不同报
        last_report_data.ity!==ity){// 震度不同报
        tts.play("ja",data.ttsepicenter+"で地震、推定最大震度"+ity+"。");
    }
    last_report_data=data;
    last_report_data.ity=ity; // 保存震度信息以便下次比较
}


//=========地震历史数据获取函数=============

function history_url(){return "";}
function history_method(){return "get";}
function history_header(){return {/*"Accept":"application/json"*/};}
function history_postdata(){return "";}
function history_onsuccess(str_response){return {};}
function history_onfail(num_errorcode){logger.error("history_onfail: "+num_errorcode);}
function is_history_data(url){return url==="";}


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

function shindo_str(num){
    if("012347".indexOf(num)===-1){
        return num;
    }
    return String.fromCharCode(0xFF10+parseInt(num));
}
