$(document).ready(function(){
    $("#btn-check ").click(function(){
      let month = $("#month").val();
      let year = $("#year").val();
      $.ajax({
        method: "GET",
        url: "/top_products_data",
        data: "month=" + month + "&year=" + year,
        dataType: "json",
        success: function(data){
          if (data.length > 0) {
            Morris.Bar({
              element: 'graph_bar_group',
              data: data,
              xkey: 'name',
              barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
              ykeys: ['quantity', 'total'],
              labels: ['Quantity', 'Total'],
              hideHover: 'auto',
              xLabelAngle: 60
            });
          } else {
            $('#graph_bar_group').empty();
            alert('Data not found');
          }
        },
        error: function(err){
          console.log(err);
        }
      });
    });
});