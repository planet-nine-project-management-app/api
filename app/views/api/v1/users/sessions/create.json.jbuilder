json.data do
  json.user @user
  json.token @token
end

json.message 'Logged in Successfully'
json.status STATUS_CODES[:ok]