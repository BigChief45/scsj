$ ->
  class Notifications
    constructor: ->
      @notifications = $("[data-behavior='notifications']")
      @setup() if @notifications.length > 0

    setup: ->
      $.ajax(
        url: '/notifications.json'
        dataType: 'JSON'
        method: 'GET'
        success: @handleSuccess
      )

    handleSuccess: (data) =>
      items = $.map data, (notification) ->
        "<li>
          <a href='#{notification.url}' id='#{notification.id}' data-behavior='notification-link'>
            <div class='media'>
              <div class='media-left media-middle'>
                <img class='media-object' src='/assets/icons/32/page_add.png'>
              </div>
              <div class='media-body'>
                <p>
                  <strong>#{notification.actor.full_name}</strong> #{notification.action} #{notification.notifiable.type} en <strong>#{notification.notifiable.trial_title}</strong>
                </p>

                <p class='small text-muted'><i>#{notification.notifiable.summary}</i></p>

                <span class='small text-muted'>#{notification.created_at}</span>
              </div>
            </div>
          </a>
        </li>
        "

      $("[data-behavior='unread-count']").text(items.length)
      $("[data-behavior='notification-items']").append(items)

      $("[data-behavior='notification-link']").on 'click', @notificationClick

    notificationClick: (e) =>
      $.ajax(
        url: "/notifications/#{e.currentTarget.id}/mark_as_read"
        dataType: 'JSON'
        method: 'POST'
      )

  jQuery ->
    new Notifications