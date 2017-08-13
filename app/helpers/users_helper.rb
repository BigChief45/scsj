module UsersHelper

  def render_roles(user)
    content_tag :ul, class: 'list-inline' do
      user.roles.map do |role|
        concat(content_tag(:li, image_tag("icons/roles/#{role.name}",
          alt: "#{role.name}")))
      end
    end
  end
end
