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
      console.log(data)
      items = $.map data, (notification) ->
        "<li>
          <a href='#{notification.url}'>
            <div class='media'>
              <div class='media-left media-middle'>
                <img class='media-object' src='/assets/icons/16/page_add.png'>
              </div>
              <div class='media-body'>
                <span class='small text-muted'>#{notification.created_at}</span>
                <p>
                  <strong>#{notification.actor}</strong> #{notification.action} #{notification.notifiable.type} en <strong>#{notification.notifiable.trial}</strong>
                </p>
              </div>
            </div>
          </a>
        </li>
        "

      $("[data-behavior='unread-count']").text(items.length)
      $("[data-behavior='notification-items']").html(items)

  jQuery ->
    new Notifications