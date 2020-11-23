 		$(".ni-favourite-28").click(function() {
			$(this).toggleClass("red");
			var related_project = $(this).find("input").val();
			if ($(this).hasClass("red")) { 
				alert("add"+related_project );
				$.ajax({
					url : "follwProject/"+related_project,
					type : "POST",
					success : function(result) {
						alert(result);
					},
					error : function(error) {
						alert(error);
					}
				})
			}
			else {
				alert("delete"+ related_project);
				$.ajax({
					url : "follwProject/"+related_project,
					type : "DELETE",
					success : function(result) {
						alert(result);
					},
					error : function(error) {
						alert(error);
					}
					})
				}
});
