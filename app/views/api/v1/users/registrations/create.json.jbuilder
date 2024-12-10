json.data do
  json.user @user
  json.token @token
end

json.message 'Signup Successfully'
json.status STATUS_CODES[:ok]
