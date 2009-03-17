module KeywordFilterTags
	include Radiant::Taggable

	desc %{
Search for all pages that have a certain keyword tag.
*Usage*:
<pre><code><r:keyword keywords="keyword1"> ... </r:keyword></code></pre>
	}
	tag "keyword" do |tag|
		if (isOk?(tag)) then
			tag.expand
		end
	end

	def isOk?(tag)
		raise "`filter' attribute required" unless tag.attr["filter"]

		result = false
		tag.attr["filter"].split(/\s+/).each do |keyword|
			print "testing : #{keyword} on '#{tag.locals.page.keywords}'\n"
			if (tag.locals.page.keywords.include?(keyword)) then
				return true
			end
		end
		return false
	end
end
