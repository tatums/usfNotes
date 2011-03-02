module ApplicationHelper

def display_notice_when_needed
  unless notice.blank?
  "<div class='row'>
  	<div class='column grid_12'>
  	<p id='notice'>#{notice}</p>	 
  	</div>
  </div>".html_safe
  end
end


end
