user = User.create(name: "Maycon", email: "maycon.sacht@gmail.com", password: "12345678", andress: "Paraná n29", phone: "91612509", cpf: "08564013908")
company = Company.create(name: "Fastrip", email: "fastrip@gmail.com", password: "12345678", andress: "Paraná n29", phone: "91612509", cnpj: "08564013908")
trip = Trip.create(name: "XXXperience", origin: "Jaraguá do Sul", destination: "Curitiba", price: 25.10)
trip.company = company
trip.save!