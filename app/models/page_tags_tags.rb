module PageTagsTags
	include Radiant::Taggable

	desc %{
Search for all pages that have a certain keyword tag.
*Usage*:
<pre><code><r:keyword keywords="keyword1"> ... </r:keyword></code></pre>
	}
	tag "keyword" do |tag|

		Page.find(:all, :conditions => getConditions(tag)).each do |page|
			tag.locals.page = page
			tag.locals.child = page
			output << tag.expand
		end
	end

	def getConditions(tag)
		raise "`keywords' attribute required" unless tag.attr["keywords"]

		conditions = []
		tag.attr["keywords"].split(/\s+/).each do |keyword|
			conditions << [ "keywords LIKE (?)", "%" + keyword + "%" ]
		end
		conditions
	end
end
