//=========测站数据获取函数=============

var seis_data=[];//Wolfx SEIS格式
var index_seis_data={};//UUID:Index

//返回测站URL数量
function station_count(){return 1;}

//指定测站URL
function station_url(){return ["wss://seisjs.wolfx.jp/all_seis"];}

//指定测站连接方式
function station_method(){return ["websocket"];}

//指定测站header（websocket以外）
function station_header(){return [{/*"Accept":"application/json"*/},{}];}

//指定测站postdata（post时）
function station_postdata(){return ["",""];}

//收到数据后转换为下列格式
//{data:[{name:"AAA",//测站名或位置等信息
//        longitude:0.0,//测站经度
//        latitude:0.0,//测站纬度
//        height:0.0,//测站高度（米）
//        pga:0.0,//gal
//        pgv:0.0,//cm/s
//        pgd:0.0,//cm
//        intensity:0.0,//烈度
//        update:1234567890000//测站数据时间戳（毫秒），注意时区问题
//       },...]}
function station_onsuccess(num_index,str_response){
    var original=JSON.parse(str_response);
    if(original.type==="heartbeat"){
        if(original.message!==""){
            logger.info("SEIS Message: "+original.message);
        }
    }else{
        if(index_seis_data[original.type]===undefined){
            index_seis_data[original.type]=seis_data.length;
            seis_data.push(original);
        }else{
            seis_data[index_seis_data[original.type]]=original;
        }
    }
    var jsonArray=[];
    for(var i=0;i<seis_data.length;i++){
        jsonArray.push({name:seis_data[i].region,//测站名或位置等信息
            longitude:seis_data[i].longitude,//测站经度
            latitude:seis_data[i].latitude,//测站纬度
            height:0.0,//测站高度（米）
            pga:seis_data[i].PGA,//gal
            pgv:seis_data[i].PGV,//cm/s
            pgd:seis_data[i].PGD,//cm
            intensity:Math.round(seis_data[i].Intensity),//烈度
            update:fmt_to_msts(seis_data[i].update_at+" UTC+8")//测站数据时间戳（毫秒），注意时区问题
        });
    }
    return {data:jsonArray};
}

//错误处理
function station_onfail(num_errorcode){logger.error("station_onfail: "+num_errorcode);}

//判断URL是否是测站数据的URL（websocket以外）
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
