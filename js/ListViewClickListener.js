/****************************************************************************
  *
  * ListViewClickListener.js
  *
  **************************************************************************/

Qt.include("DataStorage.js")

/**
  * 點擊刪除天氣
  */
function onClickListener(index, listModel) {
    deleteWeather(listModel)
    console.log("Delete weather.")
}
