json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor.full_name
  json.action notification.action
  json.notifiable do
    json.type "una #{t('action', count: 1)}"
  end

  json.url trial_path(notification.notifiable.trial, anchor: dom_id(notification.notifiable))
end