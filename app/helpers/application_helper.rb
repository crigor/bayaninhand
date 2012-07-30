module ApplicationHelper

  def region_options
    [["NCR", "NCR"],
     ["CAR", "CAR"],
     ["ARMM", "ARMM"],
     ["Region I", "Region I"],
     ["Region II", "Region II"],
     ["Region III", "Region III"],
     ["Region IV", "Region IV"],
     ["Region V", "Region V"],
     ["Region VI", "Region VI"],
     ["Region VII", "Region VII"],
     ["Region VIII", "Region VIII"],
     ["Region IX", "Region IX"],
     ["Region X", "Region X"],
     ["Region XI", "Region XI"],
     ["Region XII", "Region XII"],
     ["Region XIII", "Region XIII"]]
  end
  
  def on_current_page(current_page)
    return [controller_name, @highlighted_page].include?(current_page) ? "selected" : ""
  end

end
