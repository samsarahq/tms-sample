module ApplicationHelper
  def active_link?(path)
    request.path.start_with?(path) ? "bg-gray-900 text-white" : "text-gray-300 hover:bg-gray-700 hover:text-white"
  end
end
