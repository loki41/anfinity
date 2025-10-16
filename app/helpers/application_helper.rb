module ApplicationHelper
    def body_class
        "#{controller_path.tr('/', '_')} #{action_name}"
    end

    def join_with_spaces(classes)
        return "" unless classes.is_a?(Array) && classes.present?

        classes.map(&:to_s).join(" ")
    end
end
