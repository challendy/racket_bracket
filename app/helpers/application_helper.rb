module ApplicationHelper
  def active_class(path)
    URI.parse(request.path_info).path =~ /#{path}/ ? 'active' : nil
  end  
end
