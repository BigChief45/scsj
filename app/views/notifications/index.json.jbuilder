json.array! @notifications do |notification|
  json.id notification.id
  json.created_at l(notification.created_at, format: :long)
  json.actor notification.actor.full_name
  json.action t("notifications.actions.#{notification.action}")
  json.notifiable do
    json.type "una #{t(notification.notifiable.class.model_name.human).downcase}"
    json.trial notification.notifiable.trial.title
  end

  json.url trial_path(notification.notifiable.trial, anchor: dom_id(notification.notifiable))
end