/****************************************************************************
  *
  * DemoDatabase.js
  *
  **************************************************************************/

/**
  * 打開資料庫
  */
function getDataBase() {
    return LocalStorage.openDatabaseSync("DemoDatabase",
                                         "1",
                                         "Demo project Database",
                                         1000000)
}
