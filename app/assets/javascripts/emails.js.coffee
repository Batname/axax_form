jQuery ->
  validate_url = '/emails/validate'
  $('#new_email, [id^=edit_email_]').validate(
    #debug: true
    rules:
      'email[email]':
        required: true
        remote:
          url: validate_url
          type: 'post'
      'email[frequency]':
        remote:
          url: validate_url
          type: 'post'
      'email[text]':
        remote:
          url: validate_url
          type: 'post'
  )


