//请在settings.json文件中的userExtra中输入以下信息，不要带引号，用空格分开
//wx_open_id=值 timestamp=值 app_id=值 Signature=值
var register_time_msts=0;
var query_time_msts=0;
var header_signature="";
var register_post_data={};
var register_response_data={};
const update_token_interval=7200000

//===========预警获取函数==============

//指定一个URL，若不想使用脚本的预警或地震历史功能请将相应的URL指定为空字符串，即""
function eew_url(){
    query_time_msts=now_time_msts();
    if(query_time_msts-register_time_msts>update_token_interval){
        return "https://yjfw.cenc.ac.cn/api/earthquake/user/v1/register_user#eew";//需要更新token
    }else{
        return "https://yjfw.cenc.ac.cn/api/earthquake/event/v1/list#eew";
    }
}

//指定请求方式，"get"或"post"等，还可指定为"websocket"使用WebSocket连接（此时URL应为ws或wss协议）
function eew_method(){return "post";}

//指定HTTP请求头，以JSON形式返回，使用WebSocket时此函数不会被调用
function eew_header(){
    if(query_time_msts-register_time_msts>update_token_interval){
        return {"Signature":header_signature,"Content-Type":"application/json; charset=UTF-8"};//需要更新token
    }else{
        return {"Authorization":"Bearer "+register_response_data.data.token,"Content-Type":"application/json; charset=UTF-8"};
    }
}

//请求方式为POST时提交的数据，或WebSocket连接成功后要发送的数据，字符串形式，空字符串表示不发送
function eew_postdata(){
    if(query_time_msts-register_time_msts>update_token_interval){
        return JSON.stringify(register_post_data);//需要更新token
    }else{
        return JSON.stringify({"page_query":{"page_no":1,"page_size":10},"uid":register_response_data.data.user_info.uid,"wx_open_id":register_post_data.wx_open_id,"app_id":register_post_data.app_id});
    }
}

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
    if(original.data.token===undefined||original.data.token===null){
        var converted=[];
        var spot=original.data.spot_infos;
        for(var i=0;i<spot.length;i++){
            converted.push({
                eventId:spot[i].third_id,
                updates:spot[i].serial_number,
                latitude:spot[i].latitude,
                longitude:spot[i].longitude,
                depth:spot[i].depth,
                epicenter:spot[i].location,
                startAt:spot[i].created_at*1000,
                magnitude:parseFloat(spot[i].level)
            });
        }
        last_eew={data:converted};
    }else{
        register_response_data=original;
        register_time_msts=now_time_msts();
    }
    return last_eew;
}

//失败时的调用，参数为一个数值型的错误码
function eew_onfail(num_errorcode){logger.error("eew_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为EEW数据，使用WebSocket时此函数不会被调用
function is_eew_data(url){return url.startsWith("https://yjfw.cenc.ac.cn/api/earthquake/")&&url.endsWith("#eew");}


//=========地震历史数据获取函数=============

function history_url(){
    query_time_msts=now_time_msts();
    if(query_time_msts-register_time_msts>update_token_interval){
        return "https://yjfw.cenc.ac.cn/api/earthquake/user/v1/register_user#history";//需要更新token
    }else{
        return "https://yjfw.cenc.ac.cn/api/earthquake/event/v1/list#history";
    }
}

function history_method(){return "post";}

function history_header(){
    if(query_time_msts-register_time_msts>update_token_interval){
        return {"Signature":header_signature,"Content-Type":"application/json; charset=UTF-8"};//需要更新token
    }else{
        return {"Authorization":"Bearer "+register_response_data.data.token,"Content-Type":"application/json; charset=UTF-8"};
    }
}

function history_postdata(){
    if(query_time_msts-register_time_msts>update_token_interval){
        return JSON.stringify(register_post_data);//需要更新token
    }else{
        return JSON.stringify({"alarm_type":1,"page_query":{"page_no":1,"page_size":10},"uid":register_response_data.data.user_info.uid,"wx_open_id":register_post_data.wx_open_id,"app_id":register_post_data.app_id});
    }
}

var last_history=null;
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
function history_onsuccess(str_response){
    var original=JSON.parse(str_response);
    if(original.data.token===undefined||original.data.token===null){
        var converted=[];
        var spot=original.data.spot_infos;
        for(var i=0;i<spot.length;i++){
            converted.push({
                id:spot[i].third_id,
                O_TIME:msts_to_fmt(spot[i].created_at*1000),
                EPI_LAT:spot[i].latitude.toString(),
                EPI_LON:spot[i].longitude.toString(),
                EPI_DEPTH:spot[i].depth,
                AUTO_FLAG:"M",
                EQ_TYPE:"M",
                M:spot[i].level,
                LOCATION_C:spot[i].location
            });
        }
        last_history={shuju:converted};
    }else{
        register_response_data=original;
        register_time_msts=now_time_msts();
    }
    return last_history;
}

function history_onfail(num_errorcode){logger.error("history_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为地震历史数据
function is_history_data(url){return url.startsWith("https://yjfw.cenc.ac.cn/api/earthquake/")&&url.endsWith("#history");}


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
            switch(key){
                case "Signature":
                    header_signature=value;
                    break;
                case "wx_open_id":
                    register_post_data.wx_open_id=value;
                    break;
                case "timestamp":
                    register_post_data.timestamp=value;
                    break;
                case "app_id":
                    register_post_data.app_id=value;
                    break;
            }
        }
    }
}


//=========辅助函数=============

//将毫秒数时间戳转为YYYY-MM-DD HH:MM:SS
function msts_to_fmt(msts){
	var date=new Date(msts);
	let year = date.getFullYear();
	let month = ('0' + (date.getMonth() + 1)).slice(-2);
	let day = ('0' + date.getDate()).slice(-2);
	let hours = ('0' + date.getHours()).slice(-2);
	let minutes = ('0' + date.getMinutes()).slice(-2);
	let seconds = ('0' + date.getSeconds()).slice(-2);
	let formattedDate = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
	return formattedDate;
}

//将YYYY-MM-DD HH:MM:SS转为毫秒数时间戳
function fmt_to_msts(fmt){
    return new Date(fmt).getTime();
}

function now_time_msts(){
    return new Date().getTime();
}
