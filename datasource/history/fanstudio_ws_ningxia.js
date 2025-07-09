//===========预警获取函数==============

function eew_url(){return "";}
function eew_method(){return "get";}
function eew_header(){return {/*"Accept":"application/json"*/};}
function eew_postdata(){return "";}
function eew_onsuccess(str_response){return {};}
function eew_onfail(num_errorcode){logger.error("eew_onfail: "+num_errorcode);}
function is_eew_data(url){return url==="";}


//=========地震历史数据获取函数=============

function history_url(){return "wss://ws.fanstudio.tech/ningxia";}
function history_method(){return "websocket";}
function history_header(){return {/*"Accept":"application/json"*/};}
function history_postdata(){return "query";}

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
function history_onsuccess(str_response){
    var original=JSON.parse(str_response);
    if(original.type==="initial"||original.type==="update"||original.type==="query_response"){
        var shuju_array=[];
        var item=original.Data;
        shuju_array.push({
            id:item.id,
            O_TIME:item.time,
            EPI_LAT:item.latitude.toString(),
            EPI_LON:item.longitude.toString(),
            EPI_DEPTH:item.depth,
            AUTO_FLAG:"M",
            EQ_TYPE:"M",
            M:item.magnitude.toString(),
            LOCATION_C:item.placeName
        });
        last_history={shuju:shuju_array};
    }
    return last_history;
}

function history_onfail(num_errorcode){logger.error("history_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为地震历史数据
function is_history_data(url){return url==="wss://ws.fanstudio.tech/ningxia";}


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
