module ApplicationHelper

	def markdown(text)
	markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                       no_intra_emphasis: true,
                                       fenced_code_blocks: true,
                                       disable_indented_code_blocks: true,
                                       autolink: true,
                                       tables: true,
                                       underline: true,
                                       highlight: true
                                      )
    return markdown.render(text).html_safe
  end

  def gravatar_for(user, options = { size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.email, class: "rounded-circle")
  end

  def is_approved?(project)
    @projects = Project.all
    @projects.each do |project|
      if project.approved
        return '<span class="status badge badge-success float-right" id="status">
                        <strong>Validé</strong>
                      </span>'.html_safe
      else
         return '<span class="status badge badge-warning float-right" id="status">
                       <strong>Pas encore validé</strong>
                      </span>'.html_safe
      end  
    end 
  end 

end
