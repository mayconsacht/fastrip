json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :cpf, :phone, :andress, :password, :access_token, :uid, :photo_url, :provider
  json.url user_url(user, format: :json)
end
