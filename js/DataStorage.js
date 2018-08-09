/****************************************************************************
  *
  * DataStorage.js
  *
  **************************************************************************/
Qt.include("DemoDatabase.js")

/**
  * 初始化 Weather table
  */
function init() {
    var database = getDataBase()
    database.transaction(
        function (tx) {
        tx.executeSql('CREATE TABLE IF NOT EXISTS Weather(setting TEXT UNIQUE, value TEXT)')
        })
}

/**
  * 加入天氣資料
  */
function insertWeather(setting, value) {
    var database = getDataBase()
    var result = ""
    database.transaction(function (tx) {
        var _result = tx.executeSql('INSERT OR REPLACE INTO Weather VALUES (?,?);', [setting,value])
        if (_result.rowsAffected > 0) {
          result = "OK"
        } else {
          result = "Error"
        }

    })
    return result
}

/**
  * 獲得天氣資料
  */
function getWeather(setting) {
    var database = getDataBase()
    var result = ""
    database.transaction(function (tx) {
        var _result = tx.executeSql('SELECT value FROM Weather WHERE setting=?;', [setting])
        if (_result.rows.length > 0) {
            result = _result.rows.item(0).value
        } else {
            result = "Unknown"
        }
    })
    return result
}

/**
  * 獲得全部天氣資料
  */
function getAllWeather() {
    var database = getDataBase()
    var result = ""
    database.transaction(function (tx) {
        var _result = tx.executeSql('SELECT * FROM Weather ')
        var data = []
        for (var i = 0; i < _result.rows.length; i++) {
            data.push(_result.rows.item(i).value)
        }

        result = data
    })
    return result
}

/**
  * 獲得全部資料數量
  */
function getItems() {
    var database = getDataBase()
    var result = ""
    database.transaction(function (tx) {
        var _result = tx.executeSql('SELECT * FROM Weather ')
        result = _result.rows
    })
    return result
}

/**
  * 刪除天氣
  */
function deleteWeather(value) {
    var database = getDataBase()
    var result = ""
    database.transaction(function (tx) {
        var _result = tx.executeSql('DELETE FROM Weather WHERE value=?;' , value)
        if (_result.rowAffected > 0) {
            result = "OK"
        } else {
            result = "Error"
        }
    })
    return result
}

/**
  * 刪除全部天氣
  */
function deleteAllWeather() {
    var database = getDataBase()
    var result = ""
    database.transaction(function (tx) {
        var _result = tx.executeSql('DELETE FROM Weather')
        if (_result.rowAffected > 0) {
            result = "OK"
        } else {
            result = "Error"
        }
    })
    return result
}








