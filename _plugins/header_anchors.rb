require 'cgi'

Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  next unless doc.output_ext == ".html"

  # Extract values from header tags (h2-h4)
  doc.output.gsub!(/<h([2-4])\s+id="([^"]+)"([^>]*)>(.*?)<\/h\1>/m) do
    level = $1
    id = $2
    attrs = $3
    content = $4

    # Strip any inner HTML tags (like <code>) to get plain text for the label
    plain_title = CGI.escapeHTML(content.gsub(/<\/?[^>]+(>|$)/, "").strip)

	# Recreate header alongside anchor
    %(<h#{level} id="#{id}"#{attrs}>#{content} <a href="##{id}" class="perma" aria-label="Permalink to #{plain_title}">#</a></h#{level}>)
  end
end
