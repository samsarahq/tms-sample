module ApplicationHelper
  def active_link?(path)
    request.path.start_with?(path) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white"
  end

  def format_duration(milliseconds)
    return "N/A" if milliseconds.nil?

    hours = milliseconds / (1000 * 60 * 60)
    minutes = (milliseconds % (1000 * 60 * 60)) / (1000 * 60)

    "#{hours}h #{minutes}m"
  end

  def duty_status_color(status)
    case status&.downcase
    when "on_duty"
      "bg-yellow-100 text-yellow-800"
    when "driving"
      "bg-green-100 text-green-800"
    when "off_duty"
      "bg-gray-100 text-gray-800"
    when "sleeper"
      "bg-blue-100 text-blue-800"
    else
      "bg-gray-100 text-gray-800"
    end
  end
end
