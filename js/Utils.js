/****************************************************************************
  *
  * Utils.js
  *
  **************************************************************************/
Qt.include("DataStorage.js")

/**
  * 篩出天氣資訊
  */
function getWeekDescription(data) {
    var desc = data
    var weatherDesc = desc.split("<BR>")
    console.log(weatherDesc.toString())
    return weatherDesc
}

/**
  * 存入 DB
  */
function filterAndStoreWeather(weatherDesc) {
    for (var i = 0; i < weatherDesc.length; i++) {
        insertWeather(i, weatherDesc[i])
    }
}

/**
  * 取得天氣
  */
function getWeather(index) {
    return getWeather(index)
}

/**
  * 網路請求獲得每日一句
  */
function request(callback) {
    var xmlHttpRequest = new XMLHttpRequest()
    xmlHttpRequest.onreadystatechange = (function(xmlResult) {
        return function() {
            if (xmlResult.readyState === 4) {
                callback(xmlResult)
            }
        }
    })(xmlHttpRequest)
    xmlHttpRequest.open('GET', "https://tw.appledaily.com/index/dailyquote/", true)
    xmlHttpRequest.send('')
}

/**
  * 將 Html 以 Tag 作為篩選條件以獲得標籤內的資料
  * @param data 原始資料
  * @param startTag 標籤頭
  * @param endTag 標籤尾
  * @return 標籤內的資料
  */
function filterTags(data, startTag, endTag) {
    var splitHead = data.split(startTag)[1]
    var splitEnd = splitHead.split(endTag)[0]
    return splitEnd
}

/**
  * 為了方便而將標題標籤替換成段落標籤
  */
function replaceData(data) {
    var mapObject = {"<h1>": "<p>", "<\/h1>": "<\/p>", "<h2>": "<p>", "<\/h2>": "<\/p>"}

    var re = new RegExp(Object.keys(mapObject).join("|"), "gi")
    return data.replace(re, function(matched) {
        return mapObject[matched]
    })
}
