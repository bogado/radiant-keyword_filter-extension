# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PageTagsExtension < Radiant::Extension
	version "1.0"
	description "Describe your extension here"
	url "http://yourwebsite.com/page_tags"

	# define_routes do |map|
	#   map.namespace :admin, :member => { :remove => :get } do |admin|
	#     admin.resources :page_tags
	#   end
	# end

	def activate
		Page.send :include, PageTagsTags
		# admin.tabs.add "Page Tags", "/admin/page_tags", :after => "Layouts", :visibility => [:all]
	end

	def deactivate
		# admin.tabs.remove "Page Tags"
	end

end
