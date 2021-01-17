module ApplicationHelper

	def flash_class(level)
    {
    	"notice" => "alert-info",
      "success" => "alert-success",
      "danger" => "alert-error",
      "error" => "alert-error",
      "alert" => "alert-alert"
    }[level.to_s]
	end

end
