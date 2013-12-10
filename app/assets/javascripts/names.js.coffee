$(document).ready ->
  initTree = (id) ->
    tree.init $("#h_container"),
      data:
        type: "json"
        async: true
        url: "show?h_id=" + id
      
      callback:
        onchange: (NODE, TREE_OBJ) ->
          node_id = NODE.id
          if (node_id)
            $.ajax 
              url: 'get_content/'+node_id
              type: 'GET'
              dataType: 'html'
              error: (jqXHR, textStatus, errorThrown) ->
                $("#namedetail").html("Error")
              success: (data, status, response) ->
                $("#namedetail").html(data)
      ui:
        dots: true
        theme_name: "apple"
    return
  
  tree = new tree_component()
  initTree $('.hierarchy_id').val()
  
  $('.hierarchy_id').change ->
    initTree $('.hierarchy_id').val()