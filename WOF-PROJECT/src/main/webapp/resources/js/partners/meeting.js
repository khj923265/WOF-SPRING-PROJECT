var meetingService = (function(){
	
	function update(meet, callback, error){
		    $.ajax({
            url: '/schedule/update/'+meet.meet_id,
            type: 'post',
            data : {
            	meet_id : meet.meet_id,
            	meet_req_mem : meet.meet_req_mem,
            	meet_datetime : meet.meet_datetime,
            	meet_contents : meet.meet_contents
            },
            dataType: "json",
            
            success: function(data) {
                alert('success');
                $('.modal').modal('hide');
                $('#datetime').text() = meet.meet_datetime;
				$('#contetns').text() = meet.meet_contents;
            },
            error: function() {
                alert('error!');
            }
        });
	}
		
	return {
		update : update
	};
	
})();