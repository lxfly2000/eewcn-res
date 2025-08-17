//===========预警获取函数==============

//指定一个URL，若不想使用脚本的预警或地震历史功能请将相应的URL指定为空字符串，即""
function eew_url(){return "wss://ws-api.wolfx.jp/all_eew";}

//指定请求方式，"get"或"post"等，还可指定为"websocket"使用WebSocket连接（此时URL应为ws或wss协议）
function eew_method(){return "websocket";}

//指定HTTP请求头，以JSON形式返回，使用WebSocket时此函数不会被调用
function eew_header(){return {/*"Accept":"application/json"*/};}

//请求方式为POST时提交的数据，或WebSocket连接成功后要发送的数据，字符串形式，空字符串表示不发送
function eew_postdata(){return "query_sceew";}

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
    var converted;
    if(original.type==="sc_eew"){
        converted={
            eventId:original.EventID.split("_")[0],
            updates:original.ReportNum,
            latitude:original.Latitude,
            longitude:original.Longitude,
            depth:original.Depth,
            epicenter:original.HypoCenter,
            startAt:fmt_to_msts(original.OriginTime+" UTC+8"),//注意时区问题
            magnitude:original.Magunitude
        };
        last_eew={data:[converted]};
    }else if(original.type==="jma_eew"){
        converted={
            eventId:original.EventID,
            updates:original.Serial,
            latitude:original.Latitude,
            longitude:original.Longitude,
            depth:original.Depth,
            epicenter:"<b>["+shindo_str(original.MaxIntensity)+"]</b> "+original.Hypocenter+(original.Title==="緊急地震速報（警報）"?"(警報)":""),
            startAt:fmt_to_msts(original.OriginTime+" UTC+9"),//注意时区问题
            magnitude:original.Magunitude
        };
        last_eew={data:[converted]};
    }else if(original.type==="fj_eew"){
        converted={
            eventId:original.EventID.split("_")[0],
            updates:original.ReportNum,
            latitude:original.Latitude,
            longitude:original.Longitude,
            depth:0,
            epicenter:original.HypoCenter,
            startAt:fmt_to_msts(original.OriginTime+" UTC+8"),//注意时区问题
            magnitude:original.Magunitude
        };
        last_eew={data:[converted]};
    }else if(original.type==="cwa_eew"){
        converted={
            eventId:original.ID.toString(),
            updates:original.ReportNum,
            latitude:original.Latitude,
            longitude:original.Longitude,
            depth:original.Depth,
            epicenter:original.HypoCenter,
            startAt:fmt_to_msts(original.OriginTime+" UTC+8"),//注意时区问题
            magnitude:original.Magunitude
        };
        last_eew={data:[converted]};
    }
    return last_eew;
}

//失败时的调用，参数为一个数值型的错误码
function eew_onfail(num_errorcode){logger.error("eew_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为EEW数据，使用WebSocket时此函数不会被调用
function is_eew_data(url){return url==="wss://ws-api.wolfx.jp/all_eew";}

var last_report_data=null;
function eew_onreport(str_data){
    var data=JSON.parse(str_data);
    if(data.epicenter.startsWith("<b>[")){
        var ity=data.epicenter.substr(4,data.epicenter.indexOf("]")-4);
        if(last_report_data===null||//首次报
            last_report_data.eventId!==data.eventId||// 事件ID不同报
            Math.abs(last_report_data.startAt-data.startAt)>10000|| // 发震时间差超过10秒报
            last_report_data.epicenter!==data.epicenter||// 震中不同报
            last_report_data.ity!==data.ity){// 震度不同报
            tts.play("ja",data.epicenter.substr(data.epicenter.indexOf("]</b> ")+6).replace("(警報)","")+"で地震、推定最大震度"+ity+"。");
        }
        last_report_data=data;
        last_report_data.ity=ity; // 保存震度信息以便下次比较
    }else{
	    if(last_report_data===null||//首次报
            last_report_data.eventId!==data.eventId||// 事件ID不同报
            Math.abs(last_report_data.startAt-data.startAt)>10000|| // 发震时间差超过10秒报
            last_report_data.epicenter!==data.epicenter||// 震中不同报
            last_report_data.magnitude<data.magnitude||// 震级增大报
            last_report_data.depth>data.depth){// 震源深度变浅报
            tts.play("zh",data.epicenter+"发生"+voice_cn_ordinal(data.magnitude)+"级地震，深度"+voice_cn_quantity(data.depth)+"公里。");
        }
        last_report_data=data;
    }
}


//=========地震历史数据获取函数=============

function history_url(){return "wss://ws-api.wolfx.jp/all_eew";}
function history_method(){return "websocket";}
function history_header(){return {/*"Accept":"application/json"*/};}
function history_postdata(){return "query_cenceqlist";}
var last_history=null;
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
    var item;
    if(original.type==="cenc_eqlist"){
        item=original["No1"];
        last_history={shuju:[{
            id:item.EventID,
            O_TIME:item.time,
            EPI_LAT:item.latitude,
            EPI_LON:item.longitude,
            EPI_DEPTH:parseFloat(item.depth),
            AUTO_FLAG:(item.type==="automatic")?"(自动测定)":"M",
            EQ_TYPE:"M",
            M:item.magnitude,
            LOCATION_C:item.location
        }]};
    }else if(original.type==="jma_eqlist"){
        item=original["No1"];
        last_history={shuju:[{
            id:item.EventID,
            O_TIME:item.time_full,
            EPI_LAT:item.latitude,
            EPI_LON:item.longitude,
            EPI_DEPTH:parseFloat(item.depth.substr(0,item.depth.length-2)),
            AUTO_FLAG:parse_auto_flag(item.Title),
            EQ_TYPE:"M",
            M:item.magnitude,
            LOCATION_C:"<b>["+shindo_str(item.shindo)+"]</b> "+item.location
        }]};
    }
    return last_history;
}
function history_onfail(num_errorcode){logger.error("history_onfail: "+num_errorcode);}
function is_history_data(url){return url==="wss://ws-api.wolfx.jp/all_eew";}

function history_onreport(str_data){
    var data=JSON.parse(str_data);
    if(data.LOCATION_C.startsWith("<b>[")){
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
    }else{
	    tts.play("zh","中国地震台网"+(data.AUTO_FLAG==="(自动测定)"?"自动测定":"正式测定")+"："+
				 data.O_TIME+"，"+data.LOCATION_C+"发生"+voice_cn_ordinal(data.M)+"级地震，震源深度"+voice_cn_quantity(data.EPI_DEPTH)+"公里。");
	}
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
