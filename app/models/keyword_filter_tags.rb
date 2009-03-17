module KeywordFilterTags
	include Radiant::Taggable

	desc %{
<p>Process content only if the current page contains the keywords specified.</p>
<p> The attribute "all" controls if you want all of them or just one of keywords to match, by all of the keywords specifieds are required. </p>
*Usage*:
<pre><code><r:if_keyword filter="keyword1 keyword2" [all="false"]> ... </r:if_keyword></code></pre>
	}
	tag "if_keyword" do |tag|
		if (isOk?(tag)) then
			tag.expand
		end
	end

	desc %{
<p>Process content only if the current page <em>does not</em> contains the keywords specified. This tag does the exact inverse of the if_keyword tag.</p>
<p> The attribute "all" controls if you want all of them or just one of keywords to match, by all of the keywords specifieds are required. </p>
*Usage*:
<pre><code><r:unless_keyword filter="keyword1 keyword2" [all="false"]> ... </r:unless_keyword></code></pre>
	}
	tag "unless_keyword" do |tag|
		if (not isOk?(tag)) then
			tag.expand
		end
	end

	def isOk?(tag)
		raise "`filter' attribute required" unless tag.attr["filter"]

		if (tag.attr["all"] != "false" && tag.attr["all"] != "no") then
			all = true
		else
			all = false
		end

		tag.attr["filter"].split(/\s+/).each do |keyword|
			if (tag.locals.page.keywords.include?(keyword) != all) then
				return(not all)
			end
		end
		return all
	end
end
