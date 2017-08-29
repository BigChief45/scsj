json.array! @notifications do |notification|
  json.id notification.id
  json.created_at l(notification.created_at, format: :long)

  json.actor do
    json.full_name notification.actor.full_name
    json.avatar notification.actor.avatar.url(:navbar)
  end

  json.action t("notifications.actions.#{notification.action}")

  json.notifiable do
    json.type "una #{t(notification.notifiable.class.model_name.human).downcase}"
    json.trial_title notification.notifiable.trial.title
    json.summary truncate(notification.notifiable.description, length: 60)
  end

  json.url trial_path(notification.notifiable.trial, anchor: dom_id(notification.notifiable))
end