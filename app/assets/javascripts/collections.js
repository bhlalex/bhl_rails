function go_to(sort_type){
  var url = window.location.href.split('?');
  var query = "";
  if (url.length == 2 ){
    var vars = url[1].split("&");
    for(var i = 0; i < vars.length; i++){
      if(vars[i].indexOf('search') != -1){
        query = vars[i];
        break;
      }
    }
  }
  if(sort_type != 'none'){
    if(query != ''){
      query += "&"
    }
    query+= "sort_type=" + sort_type;
  }
  if(query != ''){
    query = "?" + query
  }
  window.location = window.location.href.split('?')[0] + query;
}

function search_collection(element, message){
  field = $("#" + element).val();
  if (field == ''){
    alert(message);
    return;
  }
  if ([' ',  '!', '@', '#', '$' , '^', '&', '*', '(',  ',',  ')', '_',  '+', '-', '=' , '&'].indexOf(field) >= 0 || field.indexOf("%") >= 0) {
    alert("#{I18n.t(:invalid_input)}");
    return;
  }
  else{
    window.location=window.location.href.split('?')[0] + "?search=" + field;
  }
}