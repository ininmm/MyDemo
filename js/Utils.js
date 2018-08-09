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
    var desc = data;
    var weatherDesc = desc.split("<BR>");
    console.log(weatherDesc.toString());
    return weatherDesc;
}

/**
  * 存入 DB
  */
function filterAndStoreWeather(weatherDesc) {
    for (var i = 0; i < weatherDesc.length; i++) {
        insertWeather(i, weatherDesc[i])
    }
}

function getWeather(index) {
    return getWeather(index)
}
