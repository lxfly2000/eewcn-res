//===========预警获取函数==============

//指定一个URL，若不想使用脚本的预警或地震历史功能请将相应的URL指定为空字符串，即""
function eew_url(){return "wss://ws.fanstudio.tech/all";}

//指定请求方式，"get"或"post"等，还可指定为"websocket"使用WebSocket连接（此时URL应为ws或wss协议）
function eew_method(){return "websocket";}

//指定HTTP请求头，以JSON形式返回，使用WebSocket时此函数不会被调用
function eew_header(){return {/*"Accept":"application/json"*/};}

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
var last_eew=null;
function eew_onsuccess(str_response){
    var original=JSON.parse(str_response);
    if(original.type==="initial_all"||original.type==="update"||original.type==="query_response"){
        var original_cea=original.cea;
        var converted_cea={
            eventId:original_cea.Data.eventId,
            updates:original_cea.Data.updates,
            latitude:parseFloat(original_cea.Data.latitude),
            longitude:parseFloat(original_cea.Data.longitude),
            depth:original_cea.Data.depth,
            epicenter:original_cea.Data.placeName,
            startAt:fmt_to_msts(original_cea.Data.shockTime+" UTC+8"),//注意时区问题
            magnitude:parseFloat(original_cea.Data.magnitude)
        };
        var original_sichuan=original.sichuan;
        var parts=original_sichuan.Data.eventId.split("_");
        var converted_sichuan={
            eventId:parts[0], // 事件ID的第一部分作为事件ID
            updates:parseInt(parts[1]), // 事件ID的第二部分作为更新次数
            latitude:original_sichuan.Data.latitude,
            longitude:original_sichuan.Data.longitude,
            depth:0,
            epicenter:original_sichuan.Data.placeName,
            startAt:fmt_to_msts(original_sichuan.Data.shockTime+" UTC+8"),//注意时区问题
            magnitude:parseFloat(original_sichuan.Data.magnitude)
        };
        var arr_not_sorted=[converted_cea, converted_sichuan];
        last_eew={data:arr_not_sorted.sort(function(a, b) {
            return b.startAt - a.startAt;
        })};
    }else if(original.type==="notice"||original.type==="error"){
		logger.info(str_response);
	}
    return last_eew;
}

//失败时的调用，参数为一个数值型的错误码
function eew_onfail(num_errorcode){logger.error("eew_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为EEW数据
function is_eew_data(url){return url==="wss://ws.fanstudio.tech/all";}

function eew_onreport(str_data){
    var data=JSON.parse(str_data);
    tts.play("zh",data.epicenter+"发生"+voice_cn_ordinal(data.magnitude)+"级地震，深度"+voice_cn_quantity(data.depth)+"公里。");
}


//=========地震历史数据获取函数=============

function history_url(){return "";}
function history_method(){return "get";}
function history_header(){return {/*"Accept":"application/json"*/};}
function history_postdata(){return "query_sceew";}
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
