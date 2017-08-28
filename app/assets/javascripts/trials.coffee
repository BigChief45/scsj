$ ->
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()

  formatLawyer = (lawyer) ->
    console.log(lawyer)
    if lawyer.loading
      return lawyer.text

    markup = '
    <div class="media">
      <div class="media-left">
        <img class="media-object" src="/assets/avatars/navbar_default_avatar.png" alt="">
      </div>
      <div class="media-body">
        <h4 class="media-heading text-black"><strong>' + lawyer.text + '</strong></h4>
        <ul class="list-inline text-muted">
          <li class="small">
            <img src="/assets/icons/email_16.png">
            <span>' + lawyer.text + '</span>
          </li>
          <li class="small">
            <img src="/assets/icons/cellphone_16.png">
            <span></span>
          </li>
        </ul>
      </div>
    </div>
    '

    markup

  $('.lawyer-search').select2
    theme: 'bootstrap'
    language: 'es'
    placeholder: 'Seleccione un abogado'
    minimumInputLength: 1
    escapeMarkup: (markup) ->
      markup
    #templateResult: formatLawyer
    templateSelection: (d) ->
      d.text

  $('.person-search').select2
    theme: 'bootstrap'
    language: 'es'
    minimumInputLength: 1
    maximumInputLength: 20
    ajax:
      url: $('.person-search').data('endpoint')
      dataType: 'json'
      delay: 250
      data: (params) ->
        {
          q: params.term
          page: params.page
        }

      processResults: (data) ->
        {
          results: $.map(data, (item) ->
            {
              text: item.full_name
              id: item.id
            }
        )}