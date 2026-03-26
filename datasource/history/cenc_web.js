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
    var now=new Date();
    var a_week_ago=new Date(now.getTime()-7*24*3600*1000);
    var now_str=msts_to_fmt(now.getTime());
    var a_week_ago_str=msts_to_fmt(a_week_ago.getTime());
    return "https://www.cenc.ac.cn/prodlaunch-web-backend/open/data/catalogs?"
    +"orderBy=id&"
    +"isAsc=false&"
    +"startMg=0&endMg=10&"
    +"startTime="+a_week_ago_str.substr(0,10)+"+"+a_week_ago_str.substr(11,8)+"&"
    +"endTime="+now_str.substr(0,10)+"+"+now_str.substr(11,8)+"&"
    +"locationRange=2";}
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
function history_onsuccess(str_response){
    //2026-3-26更新：网站域名已换，格式已换
    //格式：
    /*{
  "message": "",
  "code": 0,
  "data": [
    {
      "id": 20260324123750,
      "uniEventId": "CC1774327070000",
      "oriTime": "2026-03-24 12:37:50",
      "oriTimeStr": null,
      "locName": "汤加群岛",
      "epiLon": -175.199997,
      "epiLat": -18.700001,
      "focDepth": 250,
      "magType": "",
      "magnitude": 7.6,
      "epiIntensity": 0,
      "costTime": 0,
      "trigStaNum": 0,
      "magNum": 0,
      "isSubject": 1,
      "eqType": "CC",
      "gmtCreate": "2026-03-24 13:02:24",
      "gmtUpdate": null,
      "isDeleted": 0,
      "locationRange": 2,
      "event": "{\"origin\":{\"costTime\":0,\"epiIntensity\":0.0,\"epiLat\":-18.700000762939453,\"epiLon\":-175.1999969482422,\"eqType\":\"CC\",\"focDepth\":250.0,\"locName\":\"汤加群岛\",\"magNum\":0,\"magType\":\"\",\"magnitude\":7.599999904632568,\"oriTime\":1774327070000,\"trigStaNum\":0},\"reportTime\":0,\"sendTime\":0,\"serial\":0,\"uniEventId\":\"CC1774327070000\"}",
      "earthquakeEvent": {
        "uniEventId": "CC1774327070000",
        "systemMode": null,
        "strategy": null,
        "serial": 0,
        "sender": null,
        "senderCode": null,
        "sendTime": 0,
        "reportTime": 0,
        "status": null,
        "msgType": null,
        "version": null,
        "sendType": null,
        "origin": {
          "oriTime": 1774327070000,
          "locName": "汤加群岛",
          "epiLon": -175.199996948242,
          "epiLat": -18.7000007629395,
          "focDepth": 250,
          "magType": "",
          "magnitude": 7.59999990463257,
          "epiIntensity": 0,
          "costTime": 0,
          "trigStaNum": 0,
          "magNum": 0,
          "eqType": "CC"
        }
      },
      "distance": null,
      "subjectCodes": "base-info",
      "nameByInfo": "汤加群岛7.6级地震"
    },
    ...]}*/
    var original=JSON.parse(str_response);
    var shuju_array=[];
    for(var i=0;i<original.data.length;i++){
        var item=original.data[i];
        shuju_array.push({
            id:item.uniEventId,
            O_TIME:item.oriTime,
            EPI_LAT:item.epiLat.toString(),
            EPI_LON:item.epiLon.toString(),
            EPI_DEPTH:item.focDepth,
            AUTO_FLAG:"M",
            EQ_TYPE:"M",
            M:item.magnitude.toString(),
            LOCATION_C:item.locName
        });
    }
    return {shuju:shuju_array};
}

function history_onfail(num_errorcode){logger.error("history_onfail: "+num_errorcode);}

//根据URL判断该URL返回的是否为地震历史数据
function is_history_data(url){return url.substr(0,64)==="https://www.cenc.ac.cn/prodlaunch-web-backend/open/data/catalogs";}

function history_onreport(str_data){
    var data=JSON.parse(str_data);
    tts.play("zh","中国地震台网地震信息："+
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
