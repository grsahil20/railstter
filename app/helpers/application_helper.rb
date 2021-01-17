module ApplicationHelper

	def flash_class(level)
    {
    	"notice" => "flash-alert alert-info",
      "success" => "flash-alert alert-success",
      "danger" => "flash-alert alert-error",
      "error" => "flash-alert alert-error",
      "alert" => "flash-alert alert-alert"
    }[level.to_s]
	end

end
