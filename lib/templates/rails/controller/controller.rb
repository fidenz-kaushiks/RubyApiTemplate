<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/api_controller"

<% end -%>
<% module_namespacing do -%>
class <%= class_name %>Controller < ApiController
<% actions.each do |action| -%>
  def <%= action %>
  end
<%= "\n" unless action == actions.last -%>
<% end -%>
end
<% end -%>
