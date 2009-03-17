# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class KeywordFilterExtension < Radiant::Extension
	version "1.0"
	description "Filter content based on the keywords of the current page, usefull to create 'tags'"
	url "http://github.com/bogado/radiant-keyword_filter-extension/tree/master"

	# define_routes do |map|
	#   map.namespace :admin, :member => { :remove => :get } do |admin|
	#     admin.resources :page_tags
	#   end
	# end

	def activate
		Page.send :include, KeywordFilterTags
		# admin.tabs.add "Page Tags", "/admin/page_tags", :after => "Layouts", :visibility => [:all]
	end

	def deactivate
		# admin.tabs.remove "Page Tags"
	end

end
