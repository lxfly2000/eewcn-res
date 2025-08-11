//===========预警获取函数==============

function eew_url(){return "";}
function eew_method(){return "get";}
function eew_header(){return {/*"Accept":"application/json"*/};}
function eew_postdata(){return "";}
function eew_onsuccess(str_response){return {};}
function eew_onfail(num_errorcode){logger.error("eew_onfail: "+num_errorcode);}
function is_eew_data(url){return url==="";}


//=========地震历史数据获取函数=============

function history_url(){return "https://api.wolfx.jp/jma_eqlist.json";}
function history_method(){return "get";}
function history_header(){return {/*"Accept":"application/json"*/};}
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
function parse_auto_flag(str){
    var dict={
        "震度速報":"(震度速報)",
        "震源に関する情報":"(震源情報)",
        "震源・震度情報":"M",
        "顕著な震源要素更新のお知らせ":"(顕著震源要素更新)",
        "顕著な地震の震源要素更新のお知らせ":"(顕著震源要素更新)",
        "遠地地震に関する情報":"(遠地)"
    };
    return dict[str]===undefined?"("+str+")":dict[str];
}
function history_onsuccess(str_response){
    var original=JSON.parse(str_response);
    var shuju_array=[];
    for(var i=1;i<=50;i++){
        var item=original["No"+i];
        shuju_array.push({
            id:item.EventID,
            O_TIME:item.time_full,
            EPI_LAT:item.latitude,
            EPI_LON:item.longitude,
            EPI_DEPTH:parseFloat(item.depth.substr(0,item.depth.length-2)),
            AUTO_FLAG:parse_auto_flag(item.Title),
            EQ_TYPE:"M",
            M:item.magnitude,
            LOCATION_C:"<b>["+shindo_str(item.shindo)+"]</b> "+item.location
        });
    }
    return {shuju:shuju_array};
}

function history_onfail(num_errorcode){logger.error("history_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为地震历史数据
function is_history_data(url){return url==="https://api.wolfx.jp/jma_eqlist.json";}

function history_onreport(str_data){
    var data=JSON.parse(str_data);
    var shindo=data.LOCATION_C.substr(4,data.LOCATION_C.indexOf("]")-4);
    shindo=shindo.replace("+","強");
    shindo=shindo.replace("-","弱");
    var auto_flag=data.AUTO_FLAG;
    if(auto_flag==="(震度速報)"){
        tts.play("ja",auto_flag+"最大震度"+shindo+"の地震がありました。");
        return;
    }else if(auto_flag==="(震源情報)"){
        tts.play("ja",auto_flag+"震源は"+data.LOCATION_C.substr(data.LOCATION_C.indexOf("]</b> ")+6)+"です。マグニチュード"+data.M+"、深さは"+data.EPI_DEPTH+"キロメートルです。");
        return;
    }else if(auto_flag==="M"){
        auto_flag="(地震情報)";
    }else if(auto_flag==="(遠地)"){
        auto_flag="(遠地地震情報)";
    }
    var loc=data.LOCATION_C.substr(data.LOCATION_C.indexOf("]</b> ")+6);
    tts.play("ja",auto_flag+data.O_TIME+"，"+loc+"で、"+(auto_flag==="(地震情報)"?"最大震度"+shindo+"の":"")+"地震がありました。マグニチュード"+data.M+"、深さは"+data.EPI_DEPTH+"キロメートルです。");
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

function shindo_str(num){
    if("012347".indexOf(num)===-1){
        return num;
    }
    return String.fromCharCode(0xFF10+parseInt(num));
}
