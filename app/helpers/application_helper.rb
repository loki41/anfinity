module ApplicationHelper
    def body_class
        "#{controller_path.tr('/', '_')} #{action_name}"
    end
end
