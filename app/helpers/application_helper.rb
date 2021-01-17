module ApplicationHelper

	def flash_class(level)
    flash_class_name = {
    	"notice" => "flash-alert alert-info",
      "success" => "flash-alert alert-success",
      "danger" => "flash-alert alert-error",
      "error" => "flash-alert alert-error",
      "alert" => "flash-alert alert-alert"
    }[level.to_s]

    p level
    p level
    p level
    p flash_class_name
    p flash_class_name
    p flash_class_name
    return flash_class_name
	end

end
