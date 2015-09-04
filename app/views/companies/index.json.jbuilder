json.array!(@companies) do |company|
  json.extract! company, :id, :name, :email, :cnpj, :phone, :andress, :password, :access_token, :uid, :photo_url, :provider
  json.url company_url(company, format: :json)
end
