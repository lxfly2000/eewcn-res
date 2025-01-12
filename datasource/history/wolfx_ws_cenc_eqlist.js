//=========地震历史数据获取函数=============

function history_url(){return "wss://ws-api.wolfx.jp/cenc_eqlist";}
function history_method(){return "websocket";}
function history_header(){return {/*"Accept":"application/json"*/};}
function history_postdata(){return "query_cenceqlist";}

//格式如下：
//  {shuju:[{id:"字符串型事件ID（在程序中会被转换为32位int型）",
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
    if(original.type==="cenc_eqlist"){
        var shuju_array=[];
        for(var i=1;i<=50;i++){
            var item=original["No"+i];
            shuju_array.push({
                id:(fmt_to_msts(item.time+" UTC+8")/1000).toString(),
                O_TIME:item.time,
                EPI_LAT:item.latitude,
                EPI_LON:item.longitude,
                EPI_DEPTH:parseFloat(item.depth),
                AUTO_FLAG:(item.type==="automatic")?"(AUTO)":"M",
                EQ_TYPE:"M",
                M:item.magnitude,
                LOCATION_C:item.location
            });
        }
        last_history={shuju:shuju_array};
    }
    return last_history;
}

function history_onfail(num_errorcode){logger.error("history_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为地震历史数据
function is_history_data(url){return url==="wss://ws-api.wolfx.jp/cenc_eqlist";}


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
