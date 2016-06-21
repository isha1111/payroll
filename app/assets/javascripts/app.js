$('#employee-working').on('click', function () {
  $.ajax({
    url: "/site/employee/",
    method: 'get',
    data: {id: $('#site-id').val()}
  }).done(function(data){
    console.log(data);
    $('#employee-list').text(data);
  });
});

$('#get-timesheets').on('click',function() {
  $.ajax({
            type: 'get',
            url: '/timesheet/check',
            data: {id: $('#choose-emp').val() }
        }).done( function( data) {
            console.log(data);
            if (data[i] != 0) {
              $('#timesheet-data').empty();
              $('#timesheet-data').append("<table id='employee-table'></table>");
              $('#employee-table').append("<tr><th>Hours</th><th>Day</th><th>Site</th></tr>");
              for (var i=0; i<30; i++) {
                $('#employee-table').append("<tr><td>"+data[i]["hours"]+"</td><td>"+data[i]["day"]+"</td><td>"+data[i]["site_name"]+"</td><td><a href='/timesheet/delete/"+data[i]['id']+"'>delete</a></td></tr>");
              }
            }
        });
});
