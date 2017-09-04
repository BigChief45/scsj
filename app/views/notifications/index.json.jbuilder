json.array! @notifications do |notification|
  json.id notification.id
  json.created_at l(notification.created_at, format: :long)
  json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]

end
