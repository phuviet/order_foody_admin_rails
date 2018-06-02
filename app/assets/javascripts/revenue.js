$(function () {
  var data = $('#data_revenues').data('rubyvar');
  if (data.length == 0) {
    alert('Data not found');
  }
  else {
    Morris.Line({
      element: 'graph_line',
      xkey: 'mon',
      ykeys: ['total'],
      labels: ['Total'],
      hideHover: 'auto',
      parseTime: false,
      lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
      xLabelFormat: function (x) { return 'Month ' + x.src.mon; },
      yLabelFormat: function (y) { return '$ ' + y },
      data: data
    });
  }
});