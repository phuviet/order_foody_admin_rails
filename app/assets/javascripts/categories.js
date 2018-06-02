// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var handleDataTableButtons = function() {
  "use strict";
  0 !== $("#datatable-buttons-user").length && $("#datatable-buttons-user").DataTable({
    dom: "Bfrtip",
    buttons: [
    {
      extend: "csv",
      className: "btn btn-default btn-sm",
      exportOptions: {
        columns: [ 0, 1 ]
      }
    },
    {
      extend: "excel",
      className: "btn btn-default btn-sm",
      exportOptions: {
        columns: [ 0, 1 ]
      }
    },
    {
      extend: "pdf",
      className: "btn btn-default btn-sm",
      exportOptions: {
        columns: [ 0, 1 ]
      }
    },
    {
      extend: "print",
      className: "btn btn-default btn-sm",
      exportOptions: {
        columns: [ 0, 1 ]
      }
    }
    ]
  })
},
TableManageButtons = function() {
  "use strict";
  return {
    init: function() {
      handleDataTableButtons()
    }
  }
}();

TableManageButtons.init();

document.addEventListener("turbolinks:before-cache", function() {
  $("#datatable-buttons-user").DataTable().destroy();
});
