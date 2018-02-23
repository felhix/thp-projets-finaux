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
        return '<span class="badge badge-pill badge-success float-right" id="status">
                        <strong>Validé par Féfé</strong>
                      </span>'.html_safe
      else
         return '<span class="status badge badge-pill badge-warning float-right" id="status">
                       <strong>Pas encore validé</strong>
                      </span>'.html_safe
      end  
    end 
  end 

  

  def home_page_is_approved?(project)
    @projects = Project.all
    @projects.each do |project|
      if project.approved
        return '<span class="badge badge-pill badge-success" id="home-pill">
                        <strong>Validé</strong>
                      </span>'.html_safe
      else
         return '<span class="badge badge-pill badge-warning" id="home-pill">
                       <strong>Pas encore validé</strong>
                      </span>'.html_safe
      end  
    end 
  end 

  def home_page_is_locked?(project)
    @projects = Project.all
    @projects.each do |project|
      if project.locked
        return '<span class="badge badge-pill badge-primary" id="home-pill">
                        <strong>Verrouillé</strong>
                      </span>'.html_safe
      else
         return '<span class="badge badge-pill badge-danger" id="home-pill">
                       <strong>Pas encore validé</strong>
                      </span>'.html_safe
      end  
    end 
  end

  def has_project?(user)
      @projects = Project.all
      @projects.each do |project|
      if user.id == project.user_id
        return true
      else
         return false
      end   
    end 
  end

end
